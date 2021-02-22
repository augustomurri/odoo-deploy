FROM odoo:14.0

ENV ODOO_UID 5151
ENV ODOO_GID 5151

RUN usermod -u $ODOO_UID odoo; groupmod -g $ODOO_GID odoo;
RUN chown -R odoo:odoo /var/lib/odoo
