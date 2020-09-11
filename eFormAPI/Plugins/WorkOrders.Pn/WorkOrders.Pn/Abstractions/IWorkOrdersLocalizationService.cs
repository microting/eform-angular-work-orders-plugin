using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WorkOrders.Pn.Abstractions
{
    public interface IWorkOrdersLocalizationService
    {
        string GetString(string key);
        string GetString(string format, params object[] args);
    }
}
