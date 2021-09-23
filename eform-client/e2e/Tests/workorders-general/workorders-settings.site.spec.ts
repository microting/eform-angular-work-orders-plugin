import loginPage from '../../Page objects/Login.page';
import myEformsPage from '../../Page objects/MyEforms.page';
import {Guid} from 'guid-typescript';
import deviceUsersPage, {DeviceUsersRowObject} from '../../Page objects/DeviceUsers.page';
import workOrdersPage from '../../Page objects/WorkOrders/WorkOrders.page';

const expect = require('chai').expect;

const name = Guid.create().toString();
const surname = Guid.create().toString();

describe('Work Order Settings', function () {
  before(async () => {
    await loginPage.open('/');
    await loginPage.login();

    await deviceUsersPage.createDeviceUserFromScratch(name, surname);

    await (await $('#spinner-animation')).waitForDisplayed({ timeout: 90000, reverse: true });
    await workOrdersPage.goToWorkOrdersSettingsPage();
  });
  it('Assign Site', async() => {
    const rowCountBeforeCreation = await workOrdersPage.rowNum();
    await workOrdersPage.assignDeviceUser(name);
    await loginPage.open('/');
    await workOrdersPage.goToWorkOrdersSettingsPage();
    await (await $('#spinner-animation')).waitForDisplayed({ timeout: 90000, reverse: true });
    const rowCountAfterCreation = await workOrdersPage.rowNum();
    expect(rowCountAfterCreation, 'Number of rows hasn\'t changed after adding site').equal(rowCountBeforeCreation + 1);
  });
  it('Cancel Removing Site', async () => {
    const rowCountBefore = await workOrdersPage.rowNum();
    await workOrdersPage.cancelRemovingDeviceUser();
    await loginPage.open('/');
    await workOrdersPage.goToWorkOrdersSettingsPage();
    const rowCountAfter = await workOrdersPage.rowNum();
    expect(rowCountAfter, 'Number of rows has changed').equal(rowCountBefore);
  });
  it('Remove Site', async () => {
    const rowCountBefore = await workOrdersPage.rowNum();
    await workOrdersPage.removeAssignedDeviceUser();
    await loginPage.open('/');
    await workOrdersPage.goToWorkOrdersSettingsPage();
    const rowCountAfter = await workOrdersPage.rowNum();
    expect(rowCountAfter, 'Number of rows has changed').equal(rowCountBefore - 1);
  });
  it('Cancel Adding Site', async () => {
    const rowCountBefore = await workOrdersPage.rowNum();
    await workOrdersPage.cancelAddingDeviceUser();
    await loginPage.open('/');
    await workOrdersPage.goToWorkOrdersSettingsPage();
    const rowCountAfter = await workOrdersPage.rowNum();
    expect(rowCountAfter, 'Number of rows has changed').equal(rowCountBefore);
  });
});
