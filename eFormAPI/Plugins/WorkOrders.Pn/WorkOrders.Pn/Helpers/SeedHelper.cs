using eFormCore;
using Microting.eForm.Infrastructure.Constants;
using Microting.eForm.Infrastructure.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WorkOrders.Pn.Helpers
{
    public class SeedHelper
    {
        public static async Task<int> CreateNewTaskEform(Core core)
        {

            var timeZone = "Europe/Copenhagen";
            TimeZoneInfo timeZoneInfo;

            try
            {
                timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById(timeZone);
            }
            catch
            {
                timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("E. Europe Standard Time");
            }

            var templatesDto = await core.TemplateItemReadAll(false,
                "",
                "eform-angular-workorders-plugin-newtask",
                false,
                "",
                new List<int>(),
                timeZoneInfo
                );

            if (templatesDto.Count > 0)
            {
                return templatesDto.First().Id;
            }
            else
            {
                var newTaskForm = new MainElement
                {
                    Id = 142108,
                    Repeated = 0,
                    Label = "eform-angular-workorders-plugin-newtask",
                    StartDate = new DateTime(2020, 09, 14),
                    EndDate = new DateTime(2030, 09, 14),
                    Language = "da",
                    MultiApproval = false,
                    FastNavigation = false,
                    DisplayOrder = 0
                };

                var dataItems = new List<DataItem>();

                dataItems.Add(new Picture(
                        371263,
                        false,
                        false,
                        "Billede af opgaven",
                        "<br>",
                        "e8eaf6",
                        0, 
                        false,
                        0,
                        false
                    )
                );
                dataItems.Add(new Text(
                        371264,
                        false,
                        false,
                        "Beskrivelse af opgaven",
                        "",
                        "e8eaf6",
                        1,
                        false,
                        "",
                        0,
                        false,
                        false,
                        false,
                        false,
                        ""
                    )
                );
                dataItems.Add(new Date(
                        371265,
                        false,
                        false,
                        "Senest udbedret d.",
                        "",
                        "e8eaf6",
                        2,
                        false,
                        new DateTime(),
                        new DateTime(),
                        ""
                    )
                );
                dataItems.Add(new SaveButton(
                        371266,
                        false,
                        false,
                        "GEM & SEND",
                        "",
                        "e8eaf6",
                        2,
                        false,
                        "GEM & SEND"
                    )
                );

                var dataElement = new DataElement(
                    142108,
                    "Ny opgave",
                    0,
                    "", // ?
                    false,
                    false,
                    false,
                    false,
                    "",
                    false,
                    new List<DataItemGroup>(),
                    dataItems);

                newTaskForm.ElementList.Add(dataElement);

                newTaskForm = await core.TemplateUploadData(newTaskForm);
                return await core.TemplateCreate(newTaskForm);
            }
        }

        public static async Task<int> CreateTaskListEform(Core core)
        {
            var timeZone = "Europe/Copenhagen";
            TimeZoneInfo timeZoneInfo;

            try
            {
                timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById(timeZone);
            }
            catch
            {
                timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("E. Europe Standard Time");
            }

            var templatesDto = await core.TemplateItemReadAll(false,
                    "",
                    "eform-angular-workorders-plugin-tasklist",
                    false,
                    "",
                    new List<int>(),
                    timeZoneInfo
                    );

            if (templatesDto.Count > 0)
            {
                return templatesDto.First().Id;
            }
            else
            {
                var taskListForm = new MainElement
                {
                    Id = 142109,
                    Repeated = 0,
                    Label = "eform-angular-workorders-plugin-tasklist",
                    StartDate = new DateTime(2020, 09, 14),
                    EndDate = new DateTime(2030, 09, 14),
                    Language = "da",
                    MultiApproval = false,
                    FastNavigation = false,
                    DisplayOrder = 0
                };

                var dataItems = new List<DataItem>();

                dataItems.Add(new None(
                        371267, 
                        false,
                        false,
                        "Beskrivelse af opgaven",
                        "",
                        "e8eaf6",
                        0, 
                        false
                    )
                );
                dataItems.Add(new ShowPdf(
                        371268,
                        false,
                        false,
                        "Se billeder af opgaven",
                        "",
                        "e8eaf6",
                        1,
                        false,
                        "https://eform.microting.com/app_files/uploads/20200914114927_14937_9fae9a0b11bda418201523437984027c.pdf"
                    )
                );
                dataItems.Add(new CheckBox(
                        371269,
                        false,
                        false,
                        "Opgaven er udført",
                        "",
                        "e8eaf6",
                        2,
                        false,
                        false,
                        false
                    )
                );
                dataItems.Add(new Picture(
                        371270,
                        true,
                        false,
                        "Evt. billede af den udførte opgave",
                        "<br>",
                        "e8eaf6",
                        3,
                        false,
                        0,
                        false
                    )
                );
                dataItems.Add(new Text(
                        371271,
                        false,
                        false,
                        "Beskriv evt. den udførte opgave",
                        "",
                        "e8eaf6",
                        4,
                        false,
                        "",
                        0,
                        false,
                        false,
                        false,
                        false,
                        ""
                    )
                );
                dataItems.Add(new SaveButton(
                        371272,
                        false,
                        false,
                        "GEM & SEND",
                        "",
                        "e8eaf6",
                        5,
                        false,
                        "GEM & SEND"
                    )
                );

                var dataElement = new DataElement(
                    142109,
                    "Opgave registreret",
                    0,
                    "", 
                    false,
                    false,
                    false,
                    false,
                    "",
                    false,
                    new List<DataItemGroup>(),
                    dataItems);

                taskListForm.ElementList.Add(dataElement);

                taskListForm = await core.TemplateUploadData(taskListForm);
                return await core.TemplateCreate(taskListForm);
            }
        }
    }
}
