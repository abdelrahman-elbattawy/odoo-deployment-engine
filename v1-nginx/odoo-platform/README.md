# 🚀 Odoo SaaS Engine v1 (Nginx Based)

This version is a **manual multi-tenant Odoo deployment system** using:

- Docker Compose per client
- PostgreSQL per client
- Manual Nginx reverse proxy configuration
- Template-based deployment engine

---

# 🧠 Architecture

Each client requires FULL manual setup:

## Per Client:

- Odoo container
- PostgreSQL container
- Docker Compose file
- .env file
- Nginx server block (MANUAL)
- Domain mapping

---

# ⚙️ Requirements

- Docker
- Docker Compose
- Nginx installed on host server
- Linux VPS (Ubuntu recommended)

---

# 🚀 Deploy a New Client

```bash
./deploy.sh client1 client1.example.com
