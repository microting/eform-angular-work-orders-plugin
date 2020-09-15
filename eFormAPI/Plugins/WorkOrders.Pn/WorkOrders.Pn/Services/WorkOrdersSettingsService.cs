using Amazon.Runtime.Internal.Util;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Microting.eForm.Dto;
using Microting.eFormApi.BasePn.Abstractions;
using Microting.eFormApi.BasePn.Infrastructure.Helpers.PluginDbOptions;
using Microting.eFormApi.BasePn.Infrastructure.Models.API;
using Microting.WorkOrderBase.Infrastructure.Data;
using Microting.WorkOrderBase.Infrastructure.Data.Entities;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.NetworkInformation;
using System.Security.Claims;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using WorkOrders.Pn.Abstractions;
using WorkOrders.Pn.Infrastructure.Models;
using WorkOrders.Pn.Infrastructure.Models.Settings;

namespace WorkOrders.Pn.Services
{
    public class WorkOrdersSettingsService : IWorkOrdersSettingsService
    {
        private readonly WorkOrderPnDbContext _dbContext;
        private readonly ILogger<WorkOrdersSettingsService> _logger;
        private readonly IWorkOrdersLocalizationService _workOrdersLocalizationService;
        private readonly IEFormCoreService _core;

        public WorkOrdersSettingsService(WorkOrderPnDbContext dbContext, 
            ILogger<WorkOrdersSettingsService> logger,
            IWorkOrdersLocalizationService workOrdersLocalizationService,
            IEFormCoreService core)
        {
            _dbContext = dbContext;
            _logger = logger;
            _workOrdersLocalizationService = workOrdersLocalizationService;
            _core = core;
        }

        public async Task<OperationDataResult<WorkOrdersSettingsModel>> GetAllSettingsAsync()
        {
            try
            {
                var assignedSitesId = await _dbContext.AssignedSites.Select(x => x.SiteId).ToListAsync();
                var allSites = await _core.GetCore().Result.SiteReadAll(false);
                var workOrdersSettings = new WorkOrdersSettingsModel();
                foreach (var id in assignedSitesId)
                {
                    var siteNameModel = allSites.Where(x => x.SiteId == id).Select(x => new SiteNameModel()
                    {
                        SiteName = x.SiteName,
                        SiteUId = x.SiteId
                    }).FirstOrDefault();
                    workOrdersSettings.AssignedSites.Add(siteNameModel);
                }

                return new OperationDataResult<WorkOrdersSettingsModel>(true, workOrdersSettings);
            }
            catch (Exception e)
            {
                Trace.TraceError(e.Message);
                _logger.LogError(e.Message);
                return new OperationDataResult<WorkOrdersSettingsModel>(false,
                    _workOrdersLocalizationService.GetString("ErrorWhileObtainingWorkOrdersSettings"));
            }
        }

        public async Task<OperationResult> AddSiteToSettingsAsync(int siteId)
        {
            using(var transaction = await _dbContext.Database.BeginTransactionAsync())
            {
                try
                {
                    AssignedSite assignedSite = new AssignedSite() { SiteId = siteId };
                    await assignedSite.Create(_dbContext);
                    transaction.Commit();
                    return new OperationResult(true, _workOrdersLocalizationService.GetString("SiteAddedSuccessfully"));
                }
                catch (Exception e)
                {
                    await transaction.RollbackAsync();
                    Trace.TraceError(e.Message);
                    _logger.LogError(e.Message);
                    return new OperationResult(false,
                        _workOrdersLocalizationService.GetString("ErrorWhileAddingSiteToSettings"));
                }
            }
        }

        public async Task<OperationResult> RemoveSiteFromSettingsAsync(int siteId)
        {
            try
            {
                AssignedSite assignedSite = new AssignedSite() { SiteId = siteId };
                await assignedSite.Delete(_dbContext);

                return new OperationResult(true,
                    _workOrdersLocalizationService.GetString("SiteDeletedSuccessfully"));
            }
            catch (Exception e)
            {
                Trace.TraceError(e.Message);
                _logger.LogError(e.Message);
                return new OperationResult(false,
                    _workOrdersLocalizationService.GetString("ErrorWhileDeletingSiteFromSettings"));
            }
        }
    }
}
