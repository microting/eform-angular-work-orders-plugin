#!/bin/bash
cd ~
pwd

rm -fR Documents/workspace/microting/eform-angular-frontend/eform-client/src/app/plugins/modules/workorders-pn

cp -a Documents/workspace/microting/eform-angular-workorder-plugin/eform-client/src/app/plugins/modules/workorders-pn Documents/workspace/microting/eform-angular-frontend/eform-client/src/app/plugins/modules/workorders-pn

mkdir Documents/workspace/microting/eform-angular-frontend/eFormAPI/Plugins

rm -fR Documents/workspace/microting/eform-angular-frontend/eFormAPI/Plugins/WorkOrders.Pn

cp -a Documents/workspace/microting/eform-angular-workorders-plugin/eFormAPI/Plugins/WorkOrders.Pn Documents/workspace/microting/eform-angular-frontend/eFormAPI/Plugins/WorkOrders.Pn

# Test files rm
rm -fR Documents/workspace/microting/eform-angular-frontend/eform-client/e2e/Tests/workorders-settings
rm -fR Documents/workspace/microting/eform-angular-frontend/eform-client/e2e/Tests/workorders-general
rm -fR Documents/workspace/microting/eform-angular-frontend/eform-client/e2e/Page\ objects/WorkOrders
rm -fR Documents/workspace/microting/eform-angular-frontend/eform-client/wdio-plugin-step2.conf.js

# Test files cp
cp -a Documents/workspace/microting/eform-angular-workorder-plugin/eform-client/e2e/Tests/workorders-settings Documents/workspace/microting/eform-angular-frontend/eform-client/e2e/Tests/workorders-settings
cp -a Documents/workspace/microting/eform-angular-workorder-plugin/eform-client/e2e/Tests/workorders-general Documents/workspace/microting/eform-angular-frontend/eform-client/e2e/Tests/workorders-general
cp -a Documents/workspace/microting/eform-angular-workorder-plugin/eform-client/e2e/Page\ objects/WorkOrders Documents/workspace/microting/eform-angular-frontend/eform-client/e2e/Page\ objects/WorkOrders
cp -a Documents/workspace/microting/eform-angular-workorder-plugin/eform-client/wdio-headless-plugin-step2.conf.js Documents/workspace/microting/eform-angular-frontend/eform-client/wdio-plugin-step2.conf.js
