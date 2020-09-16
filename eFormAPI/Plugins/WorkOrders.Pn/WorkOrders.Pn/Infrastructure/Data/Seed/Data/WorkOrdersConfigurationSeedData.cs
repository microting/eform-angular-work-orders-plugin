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
            new PluginConfigurationValue()
            {
                Name = "WorkOrdersBaseSettings:LogLimit",
                Value = "25000"
            },
            new PluginConfigurationValue()
            {
                Name = "WorkOrdersBaseSettings:SdkConnectionString",
                Value = "..."
            },
            new PluginConfigurationValue()
            {
                Name = "WorkOrdersBaseSettings:MaxParallelism",
                Value = "1"
            },
            new PluginConfigurationValue()
            {
                Name = "WorkOrdersBaseSettings:NumberOfWorkers",
                Value = "1"
            }
        };
    }
}
