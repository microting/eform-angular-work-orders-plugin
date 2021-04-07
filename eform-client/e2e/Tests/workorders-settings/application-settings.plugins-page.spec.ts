import loginPage from '../../Page objects/Login.page';
import myEformsPage from '../../Page objects/MyEforms.page';
import pluginPage from '../../Page objects/Plugin.page';

import { expect } from 'chai';

describe('Application settings page - site header section', function () {
  before(function () {
    loginPage.open('/auth');
  });
  it('should go to plugin settings page', function () {
    loginPage.login();
    myEformsPage.Navbar.goToPluginsPage();
    $('#plugin-name').waitForDisplayed({ timeout: 50000 });
    $('#spinner-animation').waitForDisplayed({ timeout: 90000, reverse: true });

    const plugin = pluginPage.getFirstPluginRowObj();
    expect(plugin.name, 'name is not equal').equal(
      'Microting Work Orders Plugin'
    );
    expect(plugin.version, 'version is not equal').equal('1.0.0.0');
    expect(plugin.status, 'status is not equal').eq(false);
  });
  it('should activate the plugin', function () {
    let plugin = pluginPage.getFirstPluginRowObj();
    plugin.enableOrDisablePlugin();

    plugin = pluginPage.getFirstPluginRowObj();
    expect(plugin.name, 'name is not equal').equal(
      'Microting Work Orders Plugin'
    );
    expect(plugin.version, 'version is not equal').equal('1.0.0.0');
    expect(plugin.status, 'status is not equal').eq(true);
  });
});
