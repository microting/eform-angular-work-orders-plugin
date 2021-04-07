import { PageWithNavbarPage } from '../PageWithNavbar.page';
import myEformsPage from '../MyEforms.page';
import pluginPage from '../Plugin.page';

class WorkOrdersPage extends PageWithNavbarPage {
  constructor() {
    super();
  }

  public get rowNum(): number {
    return $$('#tableBody > tr').length;
  }

  public goToWorkOrdersSettingsPage() {
    myEformsPage.Navbar.goToPluginsPage();
    const plugin = pluginPage.getPluginRowObjByName(
      'Microting Work Orders Plugin'
    );
    plugin.settingsBtn.click();
    $('#spinner-animation').waitForDisplayed({ timeout: 90000, reverse: true });
  }

  public get folderSelectorInput() {
    const ele = $('#folderSelectorInput');
    ele.waitForDisplayed({ timeout: 60000 });
    return ele;
  }

  public get selectDeviceUser() {
    const ele = $('#selectDeviceUser');
    ele.waitForDisplayed({ timeout: 60000 });
    ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public get addNewSiteBtn() {
    const ele = $('#addNewSiteBtn');
    ele.waitForDisplayed({ timeout: 60000 });
    ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public get siteAssignBtnSave() {
    const ele = $('#siteAssignBtnSave');
    ele.waitForDisplayed({ timeout: 60000 });
    return ele;
  }

  public get siteAssignBtnSaveCancel() {
    const ele = $('#siteAssignBtnSaveCancel');
    ele.waitForDisplayed({ timeout: 60000 });
    ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public assignDeviceUser(name: string) {
    this.addNewSiteBtn.click();
    this.selectDeviceUser.click();
    this.selectDeviceUser.$('input').setValue(name);
    browser.pause(500);
    this.selectDeviceUser.$$('.ng-option')[0].click();
    this.siteAssignBtnSave.click();
    $('#spinner-animation').waitForDisplayed({ timeout: 90000, reverse: true });
    browser.pause(10000);
  }

  public removeAssignedDeviceUser() {
    this.addNewSiteBtn.waitForDisplayed({ timeout: 20000 });
    $$('#removeSiteBtn')[$$('#removeSiteBtn').length - 1].click();
    this.removeSiteSaveBtn.click();
    $('#spinner-animation').waitForDisplayed({ timeout: 30000, reverse: true });
  }

  public cancelRemovingDeviceUser() {
    this.addNewSiteBtn.waitForDisplayed({ timeout: 20000 });
    $$('#removeSiteBtn')[$$('#removeSiteBtn').length - 1].click();
    this.removeSiteSaveCancelBtn.click();
  }

  public workOrdersBtn() {
    const ele = $('#work-orders-pn');
    ele.waitForDisplayed({ timeout: 60000 });
    ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public get removeSiteSaveCancelBtn() {
    const ele = $('#removeSiteSaveCancelBtn');
    ele.waitForDisplayed({ timeout: 60000 });
    ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public get removeSiteSaveBtn() {
    const ele = $('#removeSiteSaveBtn');
    ele.waitForDisplayed({ timeout: 60000 });
    return ele;
  }

  public goToOrdersPage() {
    this.workOrdersBtn().click();
    this.ordersBtn.click();
    $('#spinner-animation').waitForDisplayed({ timeout: 30000, reverse: true });
    this.searchInput.waitForDisplayed({ timeout: 50000 });
  }

  public get ordersBtn() {
    const ele = $('#work-orders-pn-orders');
    ele.waitForDisplayed({ timeout: 60000 });
    ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public get searchInput() {
    const ele = $('#searchInput');
    ele.waitForDisplayed({ timeout: 60000 });
    return ele;
  }

  public get idTableHeader() {
    const ele = $('#idTableHeader');
    ele.waitForDisplayed({ timeout: 60000 });
    ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public get createdAtHeader() {
    const ele = $('#createdAtHeader');
    ele.waitForDisplayed({ timeout: 60000 });
    ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public get assignedAreaHeader() {
    const ele = $('#assignedAreaHeader');
    ele.waitForDisplayed({ timeout: 60000 });
    ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public get assignedWorkerHeader() {
    const ele = $('#assignedWorkerHeader');
    ele.waitForDisplayed({ timeout: 60000 });
    ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public get descriptionHeader() {
    const ele = $('#descriptionHeader');
    ele.waitForDisplayed({ timeout: 60000 });
    ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public get correctedAtTheLatestHeader() {
    const ele = $('#correctedAtTheLatestHeader');
    ele.waitForDisplayed({ timeout: 60000 });
    ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public get doneAtHeader() {
    const ele = $('#doneAtHeader');
    ele.waitForDisplayed({ timeout: 60000 });
    ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public get descriptionOfTaskDoneHeader() {
    const ele = $('#descriptionOfTaskDoneHeader');
    ele.waitForDisplayed({ timeout: 60000 });
    ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  cancelAddingDeviceUser() {
    $('#spinner-animation').waitForDisplayed({ timeout: 30000, reverse: true });
    this.addNewSiteBtn.click();
    this.selectDeviceUser.click();
    this.selectDeviceUser.$$('.ng-option')[0].click();
    this.siteAssignBtnSaveCancel.click();
  }

  public selectFolder(numberPosition: number) {
    this.folderSelectorLabel.click();
    this.folderTreeName.waitForDisplayed({ timeout: 20000 });
    $$('#folderTreeName')[numberPosition].click();
    $('#spinner-animation').waitForDisplayed({ timeout: 30000, reverse: true });
  }

  public get folderSelectorLabel() {
    const ele = $('#folderSelectorLabel');
    ele.waitForDisplayed({ timeout: 60000 });
    return ele;
  }

  public get folderTreeName() {
    const ele = $('#folderTreeName');
    ele.waitForDisplayed({ timeout: 60000 });
    return ele;
  }
}

const workOrdersPage = new WorkOrdersPage();
export default workOrdersPage;
