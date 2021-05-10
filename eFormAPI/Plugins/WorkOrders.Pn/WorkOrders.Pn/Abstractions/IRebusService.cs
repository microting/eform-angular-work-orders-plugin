using Rebus.Bus;
using System.Threading.Tasks;

namespace WorkOrders.Pn.Abstractions
{
    public interface IRebusService
    {
        Task Start(string connectionString, string rabbitMqUser, string rabbitMqPassword, string rabbitMqHost);
        IBus GetBus();
    }
}
