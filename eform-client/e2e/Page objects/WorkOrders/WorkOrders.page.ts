import {PageWithNavbarPage} from '../PageWithNavbar.page';
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
    this.workOrderSettingsBtn.waitForDisplayed({timeout: 20000});
    this.workOrderSettingsBtn.click();
    $('#spinner-animation').waitForDisplayed({timeout: 90000, reverse: true});
  }
  public workOrdersBtn() {
    $('#work-orders-pn').waitForDisplayed({timeout: 60000});
    return $('#work-orders-pn');
  }
  public get workOrderSettingsBtn() {
    return $$('#plugin-settings-link')[$$('#plugin-settings-link').length - 1];
  }
  public goToOrdersPage() {
    this.workOrdersBtn().click();
    this.ordersBtn.click();
    $('#spinner-animation').waitForDisplayed({timeout: 30000, reverse: true});
  }
  public get ordersBtn() {
    return $(`//*[contains(@class, 'fadeInDropdown')]//*[contains(text(), 'Orders')]`);
  }
}

const workOrdersPage = new WorkOrdersPage();
export default workOrdersPage;
