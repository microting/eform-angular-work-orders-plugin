#!/bin/bash
while getopts s: flag
do
    case "${flag}" in
        s) SKIP_REBUILD=${OPTARG};;
    esac
done

if [ ! -d "/var/www/microting/eform-angular-work-orders-plugin" ]; then
  cd /var/www/microting
  su ubuntu -c \
  "git clone https://github.com/microting/eform-angular-work-orders-plugin.git -b stable"
fi

cd /var/www/microting/eform-angular-work-orders-plugin
su ubuntu -c \
"dotnet restore eFormAPI/Plugins/WorkOrders.Pn/WorkOrders.Pn.sln"

echo "################## START GITVERSION ##################"
export GITVERSION=`git describe --abbrev=0 --tags | cut -d "v" -f 2`
echo $GITVERSION
echo "################## END GITVERSION ##################"
su ubuntu -c \
"dotnet publish eFormAPI/Plugins/WorkOrders.Pn/WorkOrders.Pn.sln -o out /p:Version=$GITVERSION --runtime linux-x64 --configuration Release"

su ubuntu -c \
"rm -fR /var/www/microting/eform-angular-frontend/eform-client/src/app/plugins/modules/workorders-pn"

su ubuntu -c \
"cp -av /var/www/microting/eform-angular-work-orders-plugin/eform-client/src/app/plugins/modules/workorders-pn /var/www/microting/eform-angular-frontend/eform-client/src/app/plugins/modules/workorders-pn"
su ubuntu -c \
"mkdir -p /var/www/microting/eform-angular-frontend/eFormAPI/eFormAPI.Web/out/Plugins/"

su ubuntu -c \
"rm -fR /var/www/microting/eform-angular-frontend/eFormAPI/eFormAPI.Web/out/Plugins/WorkOrders"

su ubuntu -c \
"cp -av /var/www/microting/eform-angular-work-orders-plugin/out /var/www/microting/eform-angular-frontend/eFormAPI/eFormAPI.Web/out/Plugins/WorkOrders"


echo "Recompile angular"
cd /var/www/microting/eform-angular-frontend/eform-client
su ubuntu -c \
"/var/www/microting/eform-angular-work-orders-plugin/testinginstallpn.sh"
if [[ -z $SKIP_REBUILD ]]; then
  su ubuntu -c \
  "export NODE_OPTIONS=--max_old_space_size=8192 && GENERATE_SOURCEMAP=false npm run build"
fi
echo "Recompiling angular done"
/root/rabbitmqadmin declare queue name=eform-angular-work-orders-plugin durable=true
