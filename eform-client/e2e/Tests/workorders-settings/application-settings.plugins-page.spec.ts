import loginPage from '../../Page objects/Login.page';
import myEformsPage from '../../Page objects/MyEforms.page';
import pluginPage from '../../Page objects/Plugin.page';

import { expect } from 'chai';

describe('Application settings page - site header section', function () {
  before(async () => {
    await loginPage.open('/auth');
  });
  it('should go to plugin settings page', async () => {
    await loginPage.login();
    await myEformsPage.Navbar.goToPluginsPage();
    await $('#plugin-name').waitForDisplayed({ timeout: 50000 });
    await $('#spinner-animation').waitForDisplayed({ timeout: 90000, reverse: true });

    const plugin = await pluginPage.getFirstPluginRowObj();
    expect(plugin.name, 'name is not equal').equal(
      'Microting Work Orders Plugin'
    );
    expect(plugin.version, 'version is not equal').equal('1.0.0.0');
    expect(plugin.status, 'status is not equal').eq(false);
  });
  it('should activate the plugin', async () => {
    let plugin = await pluginPage.getFirstPluginRowObj();
    await plugin.enableOrDisablePlugin();

    plugin = await pluginPage.getFirstPluginRowObj();
    expect(plugin.name, 'name is not equal').equal(
      'Microting Work Orders Plugin'
    );
    expect(plugin.version, 'version is not equal').equal('1.0.0.0');
    expect(plugin.status, 'status is not equal').eq(true);
  });
});
