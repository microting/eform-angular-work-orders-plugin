using Microting.eForm.Infrastructure.Constants;
using Microting.eFormApi.BasePn.Infrastructure.Database.Entities;
using Microting.WorkOrderBase.Infrastructure.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WorkOrders.Pn.Infrastructure.Data.Seed.Data
{
    public class WorkOrdersPluginSeed
    {
        public static void SeedData(WorkOrderPnDbContext dbContext)
        {
            var seedData = new WorkOrdersConfigurationSeedData();
            var configurationList = seedData.Data;
            foreach (var configurationItem in configurationList)
            {
                if (!dbContext.PluginConfigurationValues.Any(x => x.Name == configurationItem.Name))
                {
                    var newConfigValue = new PluginConfigurationValue()
                    {
                        Name = configurationItem.Name,
                        Value = configurationItem.Value,
                        CreatedAt = DateTime.UtcNow,
                        UpdatedAt = DateTime.UtcNow,
                        Version = 1,
                        WorkflowState = Constants.WorkflowStates.Created,
                        CreatedByUserId = 1
                    };
                    dbContext.PluginConfigurationValues.Add(newConfigValue);
                    dbContext.SaveChanges();
                }
            }

            // Seed plugin permissions
            var newPermissions = WorkOrdersPermissionsSeedData.Data
                .Where(p => dbContext.PluginPermissions.All(x => x.ClaimName != p.ClaimName))
                .Select(p => new PluginPermission
                {
                    PermissionName = p.PermissionName,
                    ClaimName = p.ClaimName,
                    CreatedAt = DateTime.UtcNow,
                    Version = 1,
                    WorkflowState = Constants.WorkflowStates.Created,
                    CreatedByUserId = 1
                });
            dbContext.PluginPermissions.AddRange(newPermissions);

            dbContext.SaveChanges();
        }
    }
}
