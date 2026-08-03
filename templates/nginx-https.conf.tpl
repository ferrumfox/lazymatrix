server {
  listen 80;
  server_name ${MATRIX_DOMAIN};
  location = /healthz { return 200 'ok'; add_header Content-Type text/plain; }
  location ^~ /.well-known/acme-challenge/ { root /var/www/certbot; default_type text/plain; }
  location / { return 301 https://$host$request_uri; }
}
server {
  listen 443 ssl http2; server_name ${MATRIX_DOMAIN};
  ssl_certificate /etc/letsencrypt/live/${MATRIX_DOMAIN}/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/${MATRIX_DOMAIN}/privkey.pem;
  location /.well-known/matrix/server { return 200 '{"m.server":"${MATRIX_DOMAIN}:443"}'; add_header Content-Type application/json; }
  location /.well-known/matrix/client { return 200 '{"m.homeserver":{"base_url":"https://${MATRIX_DOMAIN}"}}'; add_header Content-Type application/json; add_header Access-Control-Allow-Origin *; }
  location /_matrix { proxy_pass http://synapse:8008; proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for; proxy_set_header X-Forwarded-Proto https; proxy_set_header Host $host; client_max_body_size 100M; }
  location /_synapse/client { proxy_pass http://synapse:8008; proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for; proxy_set_header X-Forwarded-Proto https; proxy_set_header Host $host; }
  location / { proxy_pass http://element:80; proxy_set_header Host $host; }
}
server { listen 8448 ssl http2; server_name ${MATRIX_DOMAIN}; ssl_certificate /etc/letsencrypt/live/${MATRIX_DOMAIN}/fullchain.pem; ssl_certificate_key /etc/letsencrypt/live/${MATRIX_DOMAIN}/privkey.pem; location / { proxy_pass http://synapse:8008; proxy_set_header Host $host; proxy_set_header X-Forwarded-Proto https; } }
