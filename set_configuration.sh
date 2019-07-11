#!/bin/bash

set -x

docker cp ./onlyoffice app-server:/var/www/owncloud/custom/

docker exec app-server chown -R www-data:www-data /var/www/owncloud/custom/onlyoffice

docker exec -it app-server occ --no-warnings app:enable onlyoffice

docker exec -it app-server occ --no-warnings config:system:set onlyoffice DocumentServerUrl --value="/ds-vpath/"
docker exec -it app-server occ --no-warnings config:system:set onlyoffice DocumentServerInternalUrl --value="http://onlyoffice-document-server/"
docker exec -it app-server occ --no-warnings config:system:set onlyoffice StorageUrl --value="http://nginx-server/"
