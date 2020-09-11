using Microting.eForm.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WorkOrders.Pn.Infrastructure.Models.Settings
{
    public class WorkOrdersSettingsModel
    {
        public List<SiteNameModel> AssignedSites { get; set; } = new List<SiteNameModel>();
    }
}
