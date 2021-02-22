certbot-test:
	@chmod +x ./nginx/register_ssl.sh
	@sudo ./nginx/register_ssl.sh \
                            --domains "$(DOMAINS)" \
                            --email $(EMAIL) \
                            --data-path ./certbot \
                            --staging 1

certbot-prod:
	@chmod +x ./nginx/register_ssl.sh
	@sudo ./nginx/register_ssl.sh \
								--domains "$(DOMAINS)" \
								--email $(EMAIL) \
								--data-path ./certbot \
								--staging 0

deploy-prod:
	@mkdir -p ./pgadmin4 ./odoo/web-data
	@chown -R 101:101 ./odoo/web-data
	@chown -R 5050:5050 ./pgadmin4
	@docker-compose \
					-f docker-compose.yml \
					-f docker-compose.prod.yml \
					up -d --build --force-recreate --remove-orphans

deploy-dev:
	@mkdir -p ./pgadmin4 ./odoo/web-data
	@chown -R 101:101 ./odoo/web-data
	@chown -R 5050:5050 ./pgadmin4
	@docker-compose \
					-f docker-compose.yml \
					-f docker-compose.dev.yml \
					up -d --build --force-recreate --remove-orphans