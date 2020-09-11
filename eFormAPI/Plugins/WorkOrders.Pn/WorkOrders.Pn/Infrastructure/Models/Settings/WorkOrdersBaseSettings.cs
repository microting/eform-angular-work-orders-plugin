using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WorkOrders.Pn.Infrastructure.Models.Settings
{
    public class WorkOrdersBaseSettings
    {
        public string LogLevel { get; set; }

        public string LogLimit { get; set; }

        public string SdkConnectionString { get; set; }

        public string MaxParallelism { get; set; }

        public int NumberOfWorkers { get; set; }
    }
}
