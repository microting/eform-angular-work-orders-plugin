using System.Collections.Generic;

namespace WorkOrders.Pn.Infrastructure.Models.Settings
{
    public class WorkOrdersSettingsModel
    {
        public List<SiteNameModel> AssignedSites { get; set; } = new List<SiteNameModel>();
    }
}
