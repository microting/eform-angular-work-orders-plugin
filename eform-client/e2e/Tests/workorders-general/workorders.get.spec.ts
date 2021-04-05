import loginPage from '../../Page objects/Login.page';
import workOrdersPage from '../../Page objects/WorkOrders/WorkOrders.page';
import { testSorting } from '../../Helpers/helper-functions';
import { parse } from 'date-fns';

const expect = require('chai').expect;

describe('Work Orders Page', function () {
  before(function () {
    loginPage.open('/');
    loginPage.login();
    workOrdersPage.goToOrdersPage();
  });
  it('Read Work Orders', function () {
    expect(workOrdersPage.rowNum).equal(2);
  });
  it('Sort Work Orders by Id', function () {
    testSorting(workOrdersPage.idTableHeader, '#workOrderId', 'Id');
  });
  it('Sort Work Orders by Created At', function () {
    testSorting(
      workOrdersPage.createdAtHeader,
      '#workOrderCreatedAt',
      'Created At',
      (ele) => parse(ele.getText(), 'dd.MM.yyyy HH:mm:ss', new Date())
    );
  });
  it('Sort Work Orders by Description', function () {
    testSorting(
      workOrdersPage.descriptionHeader,
      '#workOrderDescription',
      'Description'
    );
  });
  it('Sort Work Orders by Corrected at the Latest', function () {
    testSorting(
      workOrdersPage.correctedAtTheLatestHeader,
      '#workOrderCorrectedAtLatest',
      'Corrected at the Latest'
    );
  });
  it('Sort Work Orders by Done At', function () {
    testSorting(workOrdersPage.doneAtHeader, '#workOrderDoneAt', 'Done At');
  });
  it('Sort Work Orders by Description Of Task Done', function () {
    testSorting(
      workOrdersPage.descriptionOfTaskDoneHeader,
      '#workOrderDescriptionOfTaskDone',
      'Description Of Task Done'
    );
  });
  it('Search Work Orders', function () {
    const searchString = 'hhhh';
    workOrdersPage.searchInput.setValue(searchString);
    browser.pause(500);
    $('#spinner-animation').waitForDisplayed({ timeout: 50000, reverse: true });
    expect(workOrdersPage.rowNum).equal(1);
  });
});
