using Rebus.Handlers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WorkOrders.Pn.Messages;

namespace WorkOrders.Pn.Handlers
{
    public class eFormCaseUpdatedHandler : IHandleMessages<eFormCaseUpdated>
    {
        private readonly eFormCore.Core _sdkCore;

        public eFormCaseUpdatedHandler(eFormCore.Core sdkCore)
        {
            _sdkCore = sdkCore;
        }

        public Task Handle(eFormCaseUpdated message)
        {
            throw new NotImplementedException();
        }
    }
}
