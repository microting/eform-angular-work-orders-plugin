using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WorkOrders.Pn.Infrastructure.Models
{
    public class WorkOrdersModel
    {
        public int Total { get; set; } = 0;
        public List<WorkOrderModel> WorkOrders { get; set; } 
        public WorkOrdersModel()
        {
            WorkOrders = new List<WorkOrderModel>();
        }
    }
}
