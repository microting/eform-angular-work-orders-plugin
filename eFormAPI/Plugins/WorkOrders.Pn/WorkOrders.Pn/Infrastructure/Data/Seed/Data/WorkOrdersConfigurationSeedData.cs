using Microting.eFormApi.BasePn.Abstractions;
using Microting.eFormApi.BasePn.Infrastructure.Database.Entities;

namespace WorkOrders.Pn.Infrastructure.Data.Seed.Data
{
    using Consts;

    public class WorkOrdersConfigurationSeedData : IPluginConfigurationSeedData
    {
        public PluginConfigurationValue[] Data => new[]
        {
            new PluginConfigurationValue()
            {
                Name = "WorkOrdersBaseSettings:LogLevel",
                Value = "4"
            },
            new PluginConfigurationValue()
            {
                Name = "WorkOrdersBaseSettings:NewTaskId",
                Value = "0",
            },
            new PluginConfigurationValue()
            {
                Name = "WorkOrdersBaseSettings:TaskListId",
                Value = "0",
            },
        };
    }
}
