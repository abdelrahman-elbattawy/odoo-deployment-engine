# 🚀 Odoo SaaS Engine v2 (Traefik Based)

Advanced multi-tenant Odoo deployment engine with:

- Dynamic reverse proxy (Traefik v3)
- Auto SSL (Let's Encrypt)
- Fully automated routing
- Environment-driven provisioning
- Isolated per-tenant stacks

---

# 🧠 Architecture

Each client includes:

- Odoo container
- PostgreSQL container
- Docker network isolation
- Traefik labels for routing
- Auto HTTPS certificate

---

# ⚙️ Requirements

- Docker
- Docker Compose
- Traefik v3 running as global proxy

---

# 🌐 Global Proxy (Traefik)

Traefik handles:

- Routing
- SSL certificates
- Load balancing
- Service discovery via Docker labels

---

# 🚀 Deploy Client

```bash
./nx.sh deploy client1 client1.example.com
