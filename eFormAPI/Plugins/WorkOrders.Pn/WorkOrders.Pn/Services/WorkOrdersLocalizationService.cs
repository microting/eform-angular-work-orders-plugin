using Microsoft.Extensions.Localization;
using Microting.eFormApi.BasePn.Localization.Abstractions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WorkOrders.Pn.Abstractions;

namespace WorkOrders.Pn.Services
{
    public class WorkOrdersLocalizationService : IWorkOrdersLocalizationService
    {
        private readonly IStringLocalizer _localizer;

        // ReSharper disable once SuggestBaseTypeForParameter
        public WorkOrdersLocalizationService(IEformLocalizerFactory factory)
        {
            _localizer = factory.Create(typeof(EformWorkOrdersPlugin));
        }

        public string GetString(string key)
        {
            var str = _localizer[key];
            return str.Value;
        }

        public string GetString(string format, params object[] args)
        {
            var message = _localizer[format];
            if (message?.Value == null)
            {
                return null;
            }

            return string.Format(message.Value, args);
        }
    }
}
