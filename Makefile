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

deploy-test:
	@docker-compose \
					-f docker-compose.yml \
					-f docker-compose.prod.yml \
					up --build --force-recreate

deploy-prod:
	@docker-compose \
					-f docker-compose.yml \
					-f docker-compose.prod.yml \
					up -d --build --force-recreate

deploy-dev:
	@docker-compose \
					-f docker-compose.yml \
					-f docker-compose.dev.yml \
					up -d --build --force-recreate