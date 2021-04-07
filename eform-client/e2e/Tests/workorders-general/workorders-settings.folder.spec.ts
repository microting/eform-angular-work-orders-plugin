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
  before(function () {
    loginPage.open('/');
    loginPage.login();
    myEformsPage.Navbar.goToFolderPage();
    foldersPage.createNewFolder(folders[0].name, folders[0].description);
    foldersPage.createNewFolder(folders[1].name, folders[1].description);

    workOrdersPage.goToWorkOrdersSettingsPage();
  });
  it('Assign Folder', function () {
    const spinnerAnimation = $('#spinner-animation');
    $('#folderSelectorLabel').waitForDisplayed({ timeout: 20000 });
    browser.pause(1000);
    const oldFolder = workOrdersPage.folderSelectorInput.getValue();
    workOrdersPage.selectFolder(0);
    spinnerAnimation.waitForDisplayed({ timeout: 30000, reverse: true });
    loginPage.open('/');
    workOrdersPage.goToWorkOrdersSettingsPage();
    spinnerAnimation.waitForDisplayed({ timeout: 30000, reverse: true });
    browser.pause(1000);
    const newFolder = workOrdersPage.folderSelectorInput.getValue();
    expect(oldFolder).not.equal(newFolder);
  });
  it('Change Assigned Folder', function () {
    const spinnerAnimation = $('#spinner-animation');
    workOrdersPage.goToWorkOrdersSettingsPage();
    spinnerAnimation.waitForDisplayed({ timeout: 30000, reverse: true });
    $('#folderSelectorLabel').waitForDisplayed({ timeout: 20000 });
    browser.pause(1000);
    const oldFolder = workOrdersPage.folderSelectorInput.getValue();
    workOrdersPage.selectFolder(1);
    spinnerAnimation.waitForDisplayed({ timeout: 30000, reverse: true });
    loginPage.open('/');
    workOrdersPage.goToWorkOrdersSettingsPage();
    spinnerAnimation.waitForDisplayed({ timeout: 30000, reverse: true });
    browser.pause(1000);
    const newFolder = workOrdersPage.folderSelectorInput.getValue();
    expect(oldFolder).not.equal(newFolder);
  });
});
