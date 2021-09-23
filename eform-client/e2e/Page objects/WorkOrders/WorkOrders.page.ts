import { PageWithNavbarPage } from '../PageWithNavbar.page';
import myEformsPage from '../MyEforms.page';
import pluginPage from '../Plugin.page';

class WorkOrdersPage extends PageWithNavbarPage {
  constructor() {
    super();
  }

  public async rowNum(): Promise<number> {
    return (await $$('#tableBody > tr')).length;
  }

  public async goToWorkOrdersSettingsPage() {
    await myEformsPage.Navbar.goToPluginsPage();
    const plugin = await pluginPage.getPluginRowObjByName(
      'Microting Work Orders Plugin'
    );
    await plugin.settingsBtn.click();
    await (await $('#spinner-animation')).waitForDisplayed({ timeout: 90000, reverse: true });
  }

  public async folderSelectorInput(): Promise<WebdriverIO.Element> {
    const ele = await $('#folderSelectorInput');
    await ele.waitForDisplayed({ timeout: 60000 });
    return ele;
  }

  public async selectDeviceUser(): Promise<WebdriverIO.Element> {
    const ele = await $('#selectDeviceUser');
    await ele.waitForDisplayed({ timeout: 60000 });
    await ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public async addNewSiteBtn(): Promise<WebdriverIO.Element> {
    const ele = await $('#addNewSiteBtn');
    await ele.waitForDisplayed({ timeout: 60000 });
    await ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public async siteAssignBtnSave(): Promise<WebdriverIO.Element> {
    const ele = await $('#siteAssignBtnSave');
    await ele.waitForDisplayed({ timeout: 60000 });
    return ele;
  }

  public async siteAssignBtnSaveCancel(): Promise<WebdriverIO.Element> {
    const ele = await $('#siteAssignBtnSaveCancel');
    await ele.waitForDisplayed({ timeout: 60000 });
    await ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public async assignDeviceUser(name: string) {
    await (await this.addNewSiteBtn()).click();
    await (await this.selectDeviceUser()).click();
    await (await (await this.selectDeviceUser()).$('input')).setValue(name);
    await browser.pause(500);
    await (await (await this.selectDeviceUser()).$$('.ng-option'))[0].click();
    await (await this.siteAssignBtnSave()).click();
    await (await $('#spinner-animation')).waitForDisplayed({ timeout: 90000, reverse: true });
    await browser.pause(10000);
  }

  public async removeAssignedDeviceUser() {
    await (await this.addNewSiteBtn()).waitForDisplayed({ timeout: 20000 });
    await ((await $$('#removeSiteBtn'))[(await $$('#removeSiteBtn')).length - 1]).click();
    await (await this.removeSiteSaveBtn()).click();
    await (await $('#spinner-animation')).waitForDisplayed({ timeout: 30000, reverse: true });
  }

  public async cancelRemovingDeviceUser() {
    await (await this.addNewSiteBtn()).waitForDisplayed({ timeout: 20000 });
    await ((await $$('#removeSiteBtn'))[(await $$('#removeSiteBtn')).length - 1]).click();
    await (await this.removeSiteSaveCancelBtn()).click();
  }

  public async workOrdersBtn(): Promise<WebdriverIO.Element> {
    const ele = await $('#work-orders-pn');
    await ele.waitForDisplayed({ timeout: 60000 });
    await ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public async removeSiteSaveCancelBtn(): Promise<WebdriverIO.Element> {
    const ele = await $('#removeSiteSaveCancelBtn');
    await ele.waitForDisplayed({ timeout: 60000 });
    await ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public async removeSiteSaveBtn(): Promise<WebdriverIO.Element> {
    const ele = await $('#removeSiteSaveBtn');
    await ele.waitForDisplayed({ timeout: 60000 });
    return ele;
  }

  public async goToOrdersPage() {
    await (await this.workOrdersBtn()).click();
    await (await this.ordersBtn()).click();
    await (await $('#spinner-animation')).waitForDisplayed({ timeout: 30000, reverse: true });
    await (await this.searchInput()).waitForDisplayed({ timeout: 50000 });
  }

  public async ordersBtn(): Promise<WebdriverIO.Element> {
    const ele = await $('#work-orders-pn-orders');
    await ele.waitForDisplayed({ timeout: 60000 });
    await ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public async searchInput(): Promise<WebdriverIO.Element> {
    const ele = await $('#searchInput');
    await ele.waitForDisplayed({ timeout: 60000 });
    return ele;
  }

  public async idTableHeader(): Promise<WebdriverIO.Element> {
    const ele = await $('#idTableHeader');
    await ele.waitForDisplayed({ timeout: 60000 });
    await ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public async createdAtHeader(): Promise<WebdriverIO.Element> {
    const ele = await $('#createdAtHeader');
    await ele.waitForDisplayed({ timeout: 60000 });
    await ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public async assignedAreaHeader(): Promise<WebdriverIO.Element> {
    const ele = await $('#assignedAreaHeader');
    await ele.waitForDisplayed({ timeout: 60000 });
    await ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public async assignedWorkerHeader(): Promise<WebdriverIO.Element> {
    const ele = await $('#assignedWorkerHeader');
    await ele.waitForDisplayed({ timeout: 60000 });
    await ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public async descriptionHeader(): Promise<WebdriverIO.Element> {
    const ele = await $('#descriptionHeader');
    await ele.waitForDisplayed({ timeout: 60000 });
    await ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public async correctedAtTheLatestHeader(): Promise<WebdriverIO.Element> {
    const ele = await $('#correctedAtTheLatestHeader');
    await ele.waitForDisplayed({ timeout: 60000 });
    await ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public async doneAtHeader(): Promise<WebdriverIO.Element> {
    const ele = await $('#doneAtHeader');
    await ele.waitForDisplayed({ timeout: 60000 });
    await ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  public async descriptionOfTaskDoneHeader() {
    const ele = await $('#descriptionOfTaskDoneHeader');
    await ele.waitForDisplayed({ timeout: 60000 });
    await ele.waitForClickable({ timeout: 60000 });
    return ele;
  }

  async cancelAddingDeviceUser() {
    await (await $('#spinner-animation')).waitForDisplayed({ timeout: 30000, reverse: true });
    await (await this.addNewSiteBtn()).click();
    await (await this.selectDeviceUser()).click();
    await (await (await this.selectDeviceUser()).$$('.ng-option'))[0].click();
    await (await this.siteAssignBtnSaveCancel()).click();
  }

  public async selectFolder(numberPosition: number) {
    await (await this.folderSelectorLabel()).click();
    await (await this.folderTreeName()).waitForDisplayed({ timeout: 20000 });
    await (await $$('#folderTreeName'))[numberPosition].click();
    await (await $('#spinner-animation')).waitForDisplayed({ timeout: 30000, reverse: true });
  }

  public async folderSelectorLabel(): Promise<WebdriverIO.Element> {
    const ele = await $('#folderSelectorLabel');
    await ele.waitForDisplayed({ timeout: 60000 });
    return ele;
  }

  public async folderTreeName(): Promise<WebdriverIO.Element> {
    const ele = await $('#folderTreeName');
    await ele.waitForDisplayed({ timeout: 60000 });
    return ele;
  }
}

const workOrdersPage = new WorkOrdersPage();
export default workOrdersPage;
