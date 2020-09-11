using Castle.MicroKernel.Registration;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using Rebus.Handlers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WorkOrders.Pn.Handlers;
using WorkOrders.Pn.Messages;

namespace WorkOrders.Pn.Installers
{
    public class RebusHandlerInstaller : IWindsorInstaller
    {
        public void Install(IWindsorContainer container, IConfigurationStore store)
        {
            container.Register(Component.For<IHandleMessages<eFormCaseUpdated>>().ImplementedBy<eFormCaseUpdatedHandler>().LifestyleTransient());
        }
    }
}
