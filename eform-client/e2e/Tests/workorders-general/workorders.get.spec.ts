import loginPage from '../../Page objects/Login.page';
import workOrdersPage from '../../Page objects/WorkOrders/WorkOrders.page';
import { testSorting } from '../../Helpers/helper-functions';
import { parse } from 'date-fns';

const expect = require('chai').expect;

describe('Work Orders Page', function () {
  before(async () => {
    await loginPage.open('/');
    await loginPage.login();
    await workOrdersPage.goToOrdersPage();
  });
  it('Read Work Orders', async () => {
    expect(await workOrdersPage.rowNum()).equal(2);
  });
  it('Sort Work Orders by Id', async () => {
    await testSorting(await workOrdersPage.idTableHeader(), '#workOrderId', 'Id');
  });
  it('Sort Work Orders by Created At', async () => {
    await testSorting(
      await workOrdersPage.createdAtHeader(),
      '#workOrderCreatedAt',
      'Created At',
      async (ele) => parse(await ele.getText(), 'dd.MM.yyyy HH:mm:ss', new Date())
    );
  });
  it('Sort Work Orders by Description', async () => {
    await testSorting(
      await workOrdersPage.descriptionHeader(),
      '#workOrderDescription',
      'Description'
    );
  });
  it('Sort Work Orders by Corrected at the Latest', async () => {
    await testSorting(
      await workOrdersPage.correctedAtTheLatestHeader(),
      '#workOrderCorrectedAtLatest',
      'Corrected at the Latest'
    );
  });
  it('Sort Work Orders by Done At', async () => {
    await testSorting(await workOrdersPage.doneAtHeader(), '#workOrderDoneAt', 'Done At');
  });
  it('Sort Work Orders by Description Of Task Done', async () => {
    await testSorting(
      await workOrdersPage.descriptionOfTaskDoneHeader(),
      '#workOrderDescriptionOfTaskDone',
      'Description Of Task Done'
    );
  });
  it('Search Work Orders', async () => {
    const searchString = 'hhhh';
    await (await workOrdersPage.searchInput()).setValue(searchString);
    await browser.pause(500);
    await (await $('#spinner-animation')).waitForDisplayed({ timeout: 50000, reverse: true });
    expect(await workOrdersPage.rowNum()).equal(1);
  });
});
