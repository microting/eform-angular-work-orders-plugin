import loginPage from '../../Page objects/Login.page';
import myEformsPage from '../../Page objects/MyEforms.page';
import {Guid} from 'guid-typescript';
import foldersPage from '../../Page objects/Folders.page';
import workOrdersPage from '../../Page objects/WorkOrders/WorkOrders.page';

const expect = require('chai').expect;

describe('Work Orders Settings Folder', function () {
  before(function () {
    loginPage.open('/');
    loginPage.login();
    myEformsPage.Navbar.goToFolderPage();
    $('#newFolderBtn').waitForDisplayed({timeout: 20000});
    const name = Guid.create().toString();
    const description = Guid.create().toString();
    foldersPage.createNewFolder(name, description);
  });
  it('Assign Folder', function () {
    workOrdersPage.goToWorkOrdersSettingsPage();
    $('#folderSelectorLabel').waitForDisplayed({timeout: 20000});
    $('#spinner-animation').waitForDisplayed({timeout: 30000, reverse: true});
    const oldFolder = $('#folderSelectorInput').getValue();
    $('#folderSelectorLabel').click();
    $('#folderTreeName').waitForDisplayed({timeout: 20000});
    $$('#folderTreeName')[ $$('#folderTreeName').length - 1].click();
    $('#spinner-animation').waitForDisplayed({timeout: 30000, reverse: true});
    const newFolder = $('#folderSelectorInput').getValue();
    expect(oldFolder).not.equal(newFolder);
  });
  it('Change Assigned Folder', function () {
    workOrdersPage.goToWorkOrdersSettingsPage();
    $('#folderSelectorLabel').waitForDisplayed({timeout: 20000});
    const oldFolder = $('#folderSelectorInput').getValue();
    $('#folderSelectorLabel').click();
    $('#folderTreeName').waitForDisplayed({timeout: 20000});
    $$('#folderTreeName')[ $$('#folderTreeName').length - 2].click();
    $('#spinner-animation').waitForDisplayed({timeout: 30000, reverse: true});
    const newFolder = $('#folderSelectorInput').getValue();
    expect(oldFolder).not.equal(newFolder);
  });
});
