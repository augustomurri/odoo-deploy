## Requirements

- Docker `18.x+`
- Docker Compose `1.27.x+`

## Usage

- Clone this repository and go to folder:

```console
git clone https://github.com/augustomurri/odoo-deploy.git
cd odoo-deploy
```

- Change `site.com` to your domain at files:

```console
./docker-compose.prod.yml
./nginx/nginx/default.conf
./nginx/nginx/site.com.conf
```

- Push configured project to your own git repository.
- Connect via SSH to your server instance and `git clone` your repo.
- Check configuration of `Certbot`, start the process of obtaining SSL certificate in test mode:

```console
make certbot-test DOMAINS="site.com www.site.com" EMAIL=mail@site.com
```

- If you see `Congratulations!`, all okay; start the process of obtaining SSL in production mode:

```console
make certbot-prod DOMAINS="site.com www.site.com" EMAIL=mail@site.com
```

- And now, check Nginx config:

```console
make deploy-test
```
- No errors? Deploy your Odoo instance:

```console
make deploy-prod
```

## Local development

- For local development just use
```console
make deploy-dev
```

You will have:

    * Odoo14 on http://localhost:8069
    * Adminer on http://localhost:8083
    * MailHog web UI on http://localhost:8025/

     

    
