using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microting.eFormApi.BasePn.Infrastructure.Models.API;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WorkOrders.Pn.Abstractions;
using WorkOrders.Pn.Infrastructure.Models.Settings;

namespace WorkOrders.Pn.Controllers
{
    [Authorize]
    [Route("api/workorders-pn")]
    public class WorkOrdersSettingsController : Controller
    {
        private readonly IWorkOrdersSettingsService _workOrdersSettingsService;

        public WorkOrdersSettingsController(IWorkOrdersSettingsService workOrdersSettingsService)
        {
            _workOrdersSettingsService = workOrdersSettingsService;
        }

        [HttpGet("settings")]
        public async Task<OperationDataResult<WorkOrdersSettingsModel>> GetAllSettings()
        {
            return await _workOrdersSettingsService.GetAllSettingsAsync();
        }

        [HttpPost("settings/sites")]
        public async Task<OperationResult> PostSiteToSettings([FromBody]int siteId)
        {
            return await _workOrdersSettingsService.AddSiteToSettingsAsync(siteId);
        }

        [HttpDelete("settings/sites/{siteId}")]
        public async Task<OperationResult> DeleteSiteFromSettingsAsync(int siteId)
        {
            return await _workOrdersSettingsService.RemoveSiteFromSettingsAsync(siteId);
        }
    }
}
