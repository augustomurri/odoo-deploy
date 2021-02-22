#!/bin/bash

# vars
BACKUP_DIR=/BACKUP
ODOO_DATABASE=postgres
ADMIN_PASSWORD=odoo

# create a backup directory
mkdir -p ${BACKUP_DIR}

# create a backup
curl -X POST \
    -F "master_pwd=${ADMIN_PASSWORD}" \
    -F "name=${ODOO_DATABASE}" \
    -F "backup_format=zip" \
    -o ${BACKUP_DIR}/${ODOO_DATABASE}.$(date +"%F_%T").zip \
    http://odoo-app:8069/web/database/backup


# delete old backups
find ${BACKUP_DIR} -type f -mtime +30 -name "${ODOO_DATABASE}.*.zip" -delete
