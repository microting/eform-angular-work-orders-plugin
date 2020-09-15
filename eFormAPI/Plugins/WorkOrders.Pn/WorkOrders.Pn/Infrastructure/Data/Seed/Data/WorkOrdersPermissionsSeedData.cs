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
                PermissionName = "Access WorkOrder Plugin",
                ClaimName = WorkOrderClaims.AccessInstallationCheckingPlugin
            }
        };
    }
}
