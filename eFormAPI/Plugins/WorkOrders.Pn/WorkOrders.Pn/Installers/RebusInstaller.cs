using Castle.MicroKernel.Registration;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using Rebus.Config;
using System;
using Rebus.Logging;

namespace WorkOrders.Pn.Installers
{
    public class RebusInstaller : IWindsorInstaller
    {
        private readonly string connectionString;
        private readonly int _maxParallelism;
        private readonly int _numberOfWorkers;
        private readonly string _rabbitMqUser;
        private readonly string _rabbitMqPassword;
        private readonly string _rabbitMqHost;

        public RebusInstaller(string connectionString, int maxParallelism, int numberOfWorkers, string rabbitMqUser, string rabbitMqPassword, string rabbitMqHost)
        {
            if (string.IsNullOrEmpty(connectionString)) throw new ArgumentNullException(nameof(connectionString));
            this.connectionString = connectionString;
            this._maxParallelism = maxParallelism;
            this._numberOfWorkers = numberOfWorkers;
            _rabbitMqHost = rabbitMqHost;
            _rabbitMqUser = rabbitMqUser;
            _rabbitMqPassword = rabbitMqPassword;
        }

        public void Install(IWindsorContainer container, IConfigurationStore store)
        {
            Configure.With(new CastleWindsorContainerAdapter(container))
                .Logging(l => l.ColoredConsole(LogLevel.Info))
                .Transport(t => t.UseRabbitMq($"amqp://{_rabbitMqUser}:{_rabbitMqPassword}@{_rabbitMqHost}", "eform-angular-work-orders-plugin"))
                .Options(o =>
                {
                    o.SetMaxParallelism(_maxParallelism);
                    o.SetNumberOfWorkers(_numberOfWorkers);
                })
                .Start();
        }
    }
}
