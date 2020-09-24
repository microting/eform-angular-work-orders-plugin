import { PageWithNavbarPage } from '../PageWithNavbar.page';
import loginPage from '../Login.page';
import myEformsPage from '../MyEforms.page';

class WorkOrdersPage extends PageWithNavbarPage {
  constructor() {
    super();
  }

  public get rowNum(): number {
    return $$('#tableBody > tr').length;
  }

  public get firstWorkOrderId() {
    return $$('#workOrderId')[0].getText();
  }

  public goToWorkOrdersSettingsPage() {
    myEformsPage.Navbar.goToPluginsPage();
    this.workOrderSettingsBtn.waitForDisplayed({ timeout: 20000 });
    this.workOrderSettingsBtn.click();
    $('#spinner-animation').waitForDisplayed({ timeout: 90000, reverse: true });
  }

  public assignDeviceUser(name: string) {
    $('#addNewSiteBtn').waitForDisplayed({ timeout: 20000 });
    $('#addNewSiteBtn').click();
    $('#selectDeviceUser').waitForDisplayed({ timeout: 20000 });
    $('#selectDeviceUser').click();
    $('#selectDeviceUser input').setValue(name);
    $$('#selectDeviceUser .ng-option')[0].waitForDisplayed({ timeout: 20000 });
    $$('#selectDeviceUser .ng-option')[0].click();
    $('#siteAssignBtnSave').click();
    $('#spinner-animation').waitForDisplayed({ timeout: 90000, reverse: true });
  }

  public removeAssignedDeviceUser() {
    $('#addNewSiteBtn').waitForDisplayed({ timeout: 20000 });
    $$('#removeSiteBtn')[$$('#removeSiteBtn').length - 1].click();
    $('#removeSiteSaveBtn').waitForDisplayed({ timeout: 20000 });
    $('#removeSiteSaveBtn').click();
    $('#spinner-animation').waitForDisplayed({ timeout: 30000, reverse: true });
  }

  public cancelRemovingDeviceUser() {
    $('#addNewSiteBtn').waitForDisplayed({ timeout: 20000 });
    $$('#removeSiteBtn')[$$('#removeSiteBtn').length - 1].click();
    $('#removeSiteSaveCancelBtn').waitForDisplayed({ timeout: 20000 });
    $('#removeSiteSaveCancelBtn').click();
  }

  public workOrdersBtn() {
    $('#work-orders-pn').waitForDisplayed({ timeout: 60000 });
    return $('#work-orders-pn');
  }

  public get workOrderSettingsBtn() {
    return $$('#plugin-settings-link')[$$('#plugin-settings-link').length - 1];
  }

  public goToOrdersPage() {
    this.workOrdersBtn().click();
    this.ordersBtn.click();
    $('#spinner-animation').waitForDisplayed({ timeout: 30000, reverse: true });
  }

  public get ordersBtn() {
    return $(
      `/ /*[contains(@class, 'fadeInDropdown')]//*[contains(text(), 'Orders')]`
    );
  }

  cancelAddingDeviceUser() {
    $('#addNewSiteBtn').waitForDisplayed({timeout: 20000});
    $('#addNewSiteBtn').click();
    $('#selectDeviceUser').waitForDisplayed({timeout: 20000});
    $('#selectDeviceUser').click();
    $$('#selectDeviceUser .ng-option')[0].click();
    $('#siteAssignBtnSaveCancel').click();
  }
}

const workOrdersPage = new WorkOrdersPage();
export default workOrdersPage;
