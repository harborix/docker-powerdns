# accom/powerdns

Multi-architecture Docker image for the [PowerDNS Authoritative Server](https://doc.powerdns.com/authoritative/), packaged for use with MySQL/MariaDB as backend.

## 🧱 Image Features

- Based on `debian:bullseye-slim`
- Includes `pdns-server` and `pdns-backend-mysql`
- Supports environment-based configuration via `pdns.conf` template
- Compatible with `amd64` and `arm64` platforms (e.g. x86 servers & Raspberry Pi)

## 🚀 Usage

### Docker CLI

```bash
docker run --rm \
  -e DB_HOST=your-db-host \
  -e DB_USER=pdns \
  -e DB_PASSWORD=secret \
  -e DB_NAME=powerdns \
  -e API_KEY=changeme \
  -p 53:53/tcp -p 53:53/udp \
  accom/powerdns
```

### Helm Support

This image is intended to be used with a Helm chart that provides:
- ConfigMap templating
- Database connection secrets
- Pod/Service/Ingress configurations

## ⚙️ Environment Variables

| Variable       | Description                        |
|----------------|------------------------------------|
| `DB_HOST`      | Hostname of the MySQL/MariaDB DB   |
| `DB_USER`      | Database user                      |
| `DB_PASSWORD`  | Database password                  |
| `DB_NAME`      | Database name                      |
| `API_KEY`      | PowerDNS API key for HTTP access   |

These are injected into `pdns.conf` via `envsubst`.

## 📦 Image Tags

- `latest` – stable image with latest supported PowerDNS version
- Platform variants: `linux/amd64`, `linux/arm64`

## 📄 License

This project packages PowerDNS. For licensing, see [PowerDNS License](https://doc.powerdns.com/authoritative/introduction.html#license).

Custom image and Dockerfile are provided under the MIT License.
