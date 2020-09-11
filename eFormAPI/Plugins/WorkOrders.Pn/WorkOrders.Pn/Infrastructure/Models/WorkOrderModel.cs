using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WorkOrders.Pn.Infrastructure.Models
{
    public class WorkOrderModel
    {
        public int Id { get; set; }
        public DateTime CreatedAt { get; set; }
        public int CreatedByUserId { get; set; }
        public string Description { get; set; }
        public DateTime CorrectedAtLatest { get; set; }
        public DateTime DoneAt { get; set; }
        public int DoneBySiteId { get; set; }
        public string DescriptionOfTaskDone { get; set; }
    }
}
