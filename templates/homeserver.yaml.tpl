server_name: "${MATRIX_SERVER_NAME}"
pid_file: /data/homeserver.pid
public_baseurl: "${PUBLIC_BASE_URL}"
listeners:
  - port: 8008
    tls: false
    type: http
    x_forwarded: true
    resources:
      - names: [client, federation]
        compress: false
database:
  name: psycopg2
  args:
    user: "${POSTGRES_USER}"
    password: "${POSTGRES_PASSWORD}"
    database: "${POSTGRES_DB}"
    host: postgres
    cp_min: 5
    cp_max: 10
redis:
  enabled: true
  host: redis
  password: "${REDIS_PASSWORD}"
media_store_path: /data/media_store
uploads_path: /data/uploads
registration_shared_secret: "${SYNAPSE_REGISTRATION_SHARED_SECRET}"
macaroon_secret_key: "${SYNAPSE_MACAROON_SECRET_KEY}"
form_secret: "${SYNAPSE_FORM_SECRET}"
signing_key_path: /data/${MATRIX_SERVER_NAME}.signing.key
trusted_key_servers:
  - server_name: matrix.org
turn_uris:
  - "turn:${MATRIX_DOMAIN}:3478?transport=udp"
  - "turn:${MATRIX_DOMAIN}:3478?transport=tcp"
  - "turns:${MATRIX_DOMAIN}:5349?transport=tcp"
turn_shared_secret: "${TURN_SHARED_SECRET}"
turn_user_lifetime: 86400000
turn_allow_guests: true
enable_registration: false
report_stats: false
url_preview_enabled: true
max_upload_size: 100M
