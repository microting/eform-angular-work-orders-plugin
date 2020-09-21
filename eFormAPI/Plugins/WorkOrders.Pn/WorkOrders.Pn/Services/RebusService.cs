using Castle.Windsor;
using eFormCore;
using Microting.eForm.Installers;
using Microting.eFormApi.BasePn.Abstractions;
using Microting.WorkOrderBase.Infrastructure.Data;
using Microting.WorkOrderBase.Infrastructure.Data.Factories;
using Rebus.Bus;
using System.Threading.Tasks;
using WorkOrders.Pn.Abstractions;

namespace WorkOrders.Pn.Services
{
    public class RebusService : IRebusService
    {
        private IBus _bus;
        private IWindsorContainer _container;
        private string _connectionString;
        private readonly IEFormCoreService _coreHelper;

        public RebusService(IEFormCoreService coreHelper)
        {
            _coreHelper = coreHelper;
        }

        public async Task Start(string connectionString)
        {
            _connectionString = connectionString;
            _container = new WindsorContainer();
            _container.Install(new RebusHandlerInstaller(), 
                new RebusInstaller(connectionString, 1, 1));

            Core _core = await _coreHelper.GetCore();
            _container.Register(Castle.MicroKernel.Registration.Component.For<Core>().Instance(_core));
            _container.Register(Castle.MicroKernel.Registration.Component.For<WorkOrderPnDbContext>().Instance(GetContext()));
            _bus = _container.Resolve<IBus>();
        }

        public IBus GetBus()
        {
            return _bus;
        }

        private WorkOrderPnDbContext GetContext() 
        {
            WorkOrderPnContextFactory contextFactory = new WorkOrderPnContextFactory();
            return contextFactory.CreateDbContext(new[] { _connectionString });
        }
    }
}
