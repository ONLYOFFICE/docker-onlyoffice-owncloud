#!/bin/bash

set -x

cp -r /tmp/onlyoffice /var/www/owncloud/custom/
chown -R www-data:www-data /var/www/owncloud/custom/onlyoffice
occ --no-warnings app:enable onlyoffice
occ --no-warnings config:system:set onlyoffice DocumentServerUrl --value="/ds-vpath/"
occ --no-warnings config:system:set onlyoffice DocumentServerInternalUrl --value="http://onlyoffice-document-server/"
occ --no-warnings config:system:set onlyoffice StorageUrl --value="http://nginx-server/"
