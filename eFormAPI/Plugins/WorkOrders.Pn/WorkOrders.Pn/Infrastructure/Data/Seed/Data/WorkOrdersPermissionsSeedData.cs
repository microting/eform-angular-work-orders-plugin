using Microting.eFormApi.BasePn.Infrastructure.Database.Entities;
using Microting.WorkOrderBase.Infrastructure.Const;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WorkOrders.Pn.Infrastructure.Data.Seed.Data
{
    public class WorkOrdersPermissionsSeedData
    {
        public static PluginPermission[] Data => new[]
{
            new PluginPermission()
            {
                PermissionName = "Access ItemsPlanning Plugin",
                ClaimName = WorkOrderClaims.AccessInstallationCheckingPlugin
            }//,
            //new PluginPermission()
            //{
            //    PermissionName = "Create Notification Rules",
            //    ClaimName = WorkOrderClaims.CreateItemsLists
            //},
        };
    }
}
