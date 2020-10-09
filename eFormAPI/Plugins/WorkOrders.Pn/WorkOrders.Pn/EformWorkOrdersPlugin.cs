using Microsoft.AspNetCore.Builder;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microting.eFormApi.BasePn;
using Microting.eFormApi.BasePn.Abstractions;
using Microting.eFormApi.BasePn.Infrastructure.Database.Extensions;
using Microting.eFormApi.BasePn.Infrastructure.Helpers;
using Microting.eFormApi.BasePn.Infrastructure.Helpers.PluginDbOptions;
using Microting.eFormApi.BasePn.Infrastructure.Models.Application;
using Microting.eFormApi.BasePn.Infrastructure.Settings;
using Microting.WorkOrderBase.Infrastructure.Const;
using Microting.WorkOrderBase.Infrastructure.Data;
using Microting.WorkOrderBase.Infrastructure.Data.Factories;
using Rebus.Bus;
using System;
using System.Collections.Generic;
using System.Reflection;
using WorkOrders.Pn.Abstractions;
using WorkOrders.Pn.Helpers;
using WorkOrders.Pn.Infrastructure.Data.Seed.Data;
using WorkOrders.Pn.Infrastructure.Models.Settings;
using WorkOrders.Pn.Messages;
using WorkOrders.Pn.Services;

namespace WorkOrders.Pn
{
    using eFormCore;
    using Infrastructure.Data.Seed;

    public class EformWorkOrdersPlugin : IEformPlugin
    {
        public string Name => "Microting Work Orders Plugin";
        public string PluginId => "eform-angular-work-orders-plugin";
        public string PluginPath => PluginAssembly().Location;
        public string PluginBaseUrl => "work-orders-pn";

        private string _connectionString;
        private IBus _bus;

        public Assembly PluginAssembly()
        {
            return typeof(EformWorkOrdersPlugin).GetTypeInfo().Assembly;
        }

        public void ConfigureServices(IServiceCollection services)
        {
            services.AddTransient<IWorkOrdersSettingsService, WorkOrdersSettingsService>();
            services.AddTransient<IWorkOrdersService, WorkOrdersService>();
            services.AddTransient<IWorkOrdersLocalizationService, WorkOrdersLocalizationService>();
            services.AddSingleton<IRebusService, RebusService>();
            services.AddControllers();
            SeedWorkOrderForms(services);
        }

        public void AddPluginConfig(IConfigurationBuilder builder, string connectionString)
        {
            WorkOrdersConfigurationSeedData seedData = new WorkOrdersConfigurationSeedData();
            WorkOrderPnContextFactory contextFactory = new WorkOrderPnContextFactory();
            builder.AddPluginConfiguration(
                connectionString,
                seedData,
                contextFactory);
        }

        public void ConfigureOptionsServices(IServiceCollection services, IConfiguration configuration)
        {
            services.ConfigurePluginDbOptions<WorkOrdersBaseSettings>(
                        configuration.GetSection("WorkOrdersBaseSettings"));
        }

        public void ConfigureDbContext(IServiceCollection services, string connectionString)
        {
            _connectionString = connectionString;
            services.AddDbContext<WorkOrderPnDbContext>(o => o.UseMySql(connectionString,
                b => b.MigrationsAssembly(PluginAssembly().FullName)));

            WorkOrderPnContextFactory contextFactory = new WorkOrderPnContextFactory();
            WorkOrderPnDbContext context = contextFactory.CreateDbContext(new[] { connectionString });
            context.Database.Migrate();

            // Seed database
            SeedDatabase(connectionString);
        }

        public void Configure(IApplicationBuilder appBuilder)
        {
            appBuilder.UseHttpsRedirection();

            appBuilder.UseRouting();

            IServiceProvider serviceProvider = appBuilder.ApplicationServices;
            IRebusService rebusService = serviceProvider.GetService<IRebusService>();
            rebusService.Start(_connectionString);

            _bus = rebusService.GetBus();

            appBuilder.UseAuthorization();

            appBuilder.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }

        public MenuModel HeaderMenu(IServiceProvider serviceProvider)
        {
            IWorkOrdersLocalizationService localizationService = serviceProvider
                            .GetService<IWorkOrdersLocalizationService>();

            MenuModel result = new MenuModel();
            result.LeftMenu.Add(new MenuItemModel()
            {
                Name = localizationService.GetString("WorkOrders"),
                E2EId = "work-orders-pn",
                Link = "",
                Guards = new List<string>() { WorkOrdersClaims.AccessWorkOrdersPlugin },
                MenuItems = new List<MenuItemModel>()
                {
                    new MenuItemModel()
                    {
                        Name = localizationService.GetString("Orders"),
                        E2EId = "work-orders-pn-orders",
                        Link = "/plugins/work-orders-pn/orders",
                        Position = 0,
                    }
                }
            });
            return result;
        }

        public void SeedDatabase(string connectionString)
        {
            // Get DbContext
            WorkOrderPnContextFactory contextFactory = new WorkOrderPnContextFactory();
            using WorkOrderPnDbContext context = contextFactory.CreateDbContext(new[] { connectionString });
            // Seed configuration
            WorkOrdersPluginSeed.SeedData(context);
        }

        public PluginPermissionsManager GetPermissionsManager(string connectionString)
        {
            WorkOrderPnContextFactory contextFactory = new WorkOrderPnContextFactory();
            WorkOrderPnDbContext context = contextFactory.CreateDbContext(new[] { connectionString });

            return new PluginPermissionsManager(context);
        }

        private void UpdateRelatedCase(int caseId)
        {
            _bus.SendLocal(new eFormCaseUpdated(caseId));
        }

        private async void SeedWorkOrderForms(IServiceCollection serviceCollection)
        {
            ServiceProvider serviceProvider = serviceCollection.BuildServiceProvider();
            IPluginDbOptions<WorkOrdersBaseSettings> pluginDbOptions = serviceProvider.GetRequiredService<IPluginDbOptions<WorkOrdersBaseSettings>>();

            Core core = await serviceProvider.GetRequiredService<IEFormCoreService>().GetCore();
            WorkOrderPnDbContext context = serviceProvider.GetRequiredService<WorkOrderPnDbContext>();

            if (pluginDbOptions.Value.NewTaskId == 0)
            {
                int newTaskId = await SeedHelper.CreateNewTaskEform(core);
                await pluginDbOptions.UpdateDb(settings => settings.NewTaskId = newTaskId, context, 1);
            }

            if (pluginDbOptions.Value.TaskListId == 0)
            {
                int taskListId = await SeedHelper.CreateTaskListEform(core);
                await pluginDbOptions.UpdateDb(settings => settings.TaskListId = taskListId, context, 1);
            }
        }
    }
}
