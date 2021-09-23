import loginPage from '../../Page objects/Login.page';
import myEformsPage from '../../Page objects/MyEforms.page';
import foldersPage from '../../Page objects/Folders.page';
import workOrdersPage from '../../Page objects/WorkOrders/WorkOrders.page';
import { generateRandmString } from '../../Helpers/helper-functions';

const expect = require('chai').expect;

const folders = [
  { name: generateRandmString(), description: generateRandmString() },
  { name: generateRandmString(), description: generateRandmString() },
];

describe('Work Orders Settings Folder', function () {
  before(async () => {
    await loginPage.open('/');
    await loginPage.login();
    await myEformsPage.Navbar.goToFolderPage();
    await foldersPage.createNewFolder(folders[0].name, folders[0].description);
    await foldersPage.createNewFolder(folders[1].name, folders[1].description);

    await workOrdersPage.goToWorkOrdersSettingsPage();
  });
  it('Assign Folder', async () => {
    const spinnerAnimation = await $('#spinner-animation');
    await (await $('#folderSelectorLabel')).waitForDisplayed({ timeout: 20000 });
    await browser.pause(1000);
    const oldFolder = await (await workOrdersPage.folderSelectorInput()).getValue();
    await workOrdersPage.selectFolder(0);
    await spinnerAnimation.waitForDisplayed({ timeout: 30000, reverse: true });
    await loginPage.open('/');
    await workOrdersPage.goToWorkOrdersSettingsPage();
    await spinnerAnimation.waitForDisplayed({ timeout: 30000, reverse: true });
    await browser.pause(1000);
    const newFolder = await (await workOrdersPage.folderSelectorInput()).getValue();
    expect(oldFolder).not.equal(newFolder);
  });
  it('Change Assigned Folder', async () => {
    const spinnerAnimation = await $('#spinner-animation');
    await workOrdersPage.goToWorkOrdersSettingsPage();
    await spinnerAnimation.waitForDisplayed({ timeout: 30000, reverse: true });
    await (await $('#folderSelectorLabel')).waitForDisplayed({ timeout: 20000 });
    await browser.pause(1000);
    const oldFolder = await (await workOrdersPage.folderSelectorInput()).getValue();
    await workOrdersPage.selectFolder(1);
    await spinnerAnimation.waitForDisplayed({ timeout: 30000, reverse: true });
    await loginPage.open('/');
    await workOrdersPage.goToWorkOrdersSettingsPage();
    await spinnerAnimation.waitForDisplayed({ timeout: 30000, reverse: true });
    await browser.pause(1000);
    const newFolder = await (await workOrdersPage.folderSelectorInput()).getValue();
    expect(oldFolder).not.equal(newFolder);
  });
});
