using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Microting.eForm.Infrastructure.Constants;
using Microting.eFormApi.BasePn.Infrastructure.Extensions;
using Microting.eFormApi.BasePn.Infrastructure.Models.API;
using Microting.WorkOrderBase.Infrastructure.Data;
using Microting.WorkOrderBase.Infrastructure.Data.Entities;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using WorkOrders.Pn.Abstractions;
using WorkOrders.Pn.Infrastructure.Models;
using CollectionExtensions = Castle.Core.Internal.CollectionExtensions;

namespace WorkOrders.Pn.Services
{
    public class WorkOrdersService : IWorkOrdersService
    {
        private readonly ILogger<WorkOrdersService> _logger;
        private readonly WorkOrderPnDbContext _dbContext;
        private readonly IWorkOrdersLocalizationService _workOrdersLocalizationService;
        public WorkOrdersService(WorkOrderPnDbContext dbContext, 
            IWorkOrdersLocalizationService workOrdersLocalizationService,
            ILogger<WorkOrdersService> logger)
        {
            _dbContext = dbContext;
            _workOrdersLocalizationService = workOrdersLocalizationService;
            _logger = logger;
        }

        public async Task<OperationDataResult<WorkOrdersModel>> GetWorkOrdersAsync(WorkOrdersRequestModel pnRequestModel)
        {
            try
            {
                WorkOrdersModel workOrdersModel = new WorkOrdersModel();
                IQueryable<WorkOrder> workOrdersQuery= _dbContext.WorkOrders.Where(x => 
                    x.WorkflowState != Constants.WorkflowStates.Removed).AsQueryable();
                if(!CollectionExtensions.IsNullOrEmpty(pnRequestModel.SearchString) && pnRequestModel.SearchString != "")
                {
                    workOrdersQuery = workOrdersQuery.Where(x =>
                        x.Description.ToLower().Contains(pnRequestModel.SearchString.ToLower()) ||
                        x.DescriptionOfTaskDone.ToLower().Contains(pnRequestModel.SearchString.ToLower()));
                }
                if (!string.IsNullOrEmpty(pnRequestModel.Sort))
                {
                    if (pnRequestModel.IsSortDsc) 
                    {
                        workOrdersQuery = workOrdersQuery.CustomOrderByDescending(pnRequestModel.Sort);
                    }
                    else
                    {
                        workOrdersQuery = workOrdersQuery.CustomOrderBy(pnRequestModel.Sort);
                    }
                }
                else
                {
                    workOrdersQuery = _dbContext.WorkOrders.OrderBy(x => x.Id);
                }

                workOrdersQuery = workOrdersQuery
                                    .Where(x => x.WorkflowState != Constants.WorkflowStates.Removed)
                                    .Skip(pnRequestModel.Offset)
                                    .Take(pnRequestModel.PageSize);

                List<WorkOrderModel> workOrderList = await workOrdersQuery.Select(x => new WorkOrderModel()
                {
                    Id = x.Id,
                    CreatedAt = x.CreatedAt,
                    CreatedByUserId = x.CreatedByUserId,
                    Description = x.Description,
                    CorrectedAtLatest = x.CorrectedAtLatest,
                    DoneAt = x.DoneAt,
                    DoneBySiteId = x.DoneBySiteId,
                    DescriptionOfTaskDone = x.DescriptionOfTaskDone

                }).ToListAsync();
                workOrdersModel.Total = await _dbContext.WorkOrders.CountAsync(x => 
                            x.WorkflowState != Constants.WorkflowStates.Removed);
                workOrdersModel.WorkOrders = workOrderList;

                return new OperationDataResult<WorkOrdersModel>(true, workOrdersModel);
            }
            catch(Exception e)
            {
                Trace.TraceError(e.Message);
                _logger.LogError(e.Message);
                return new OperationDataResult<WorkOrdersModel>(false,
                    _workOrdersLocalizationService.GetString("ErrorWhileObtainingWorkOrders"));
            }
        }
    }
}
