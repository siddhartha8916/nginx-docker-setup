# 🐳 Full Stack Dockerized App with Load Balancing

A small, production-ready setup featuring:

* 🚀 **Node.js Express API** (3 instances)
* ⚙️ **Nginx Load Balancer** for backend routing
* 🗂️ **PostgreSQL** database
* 🎨 **React Frontend** served via Nginx
* ✅ Health checks & full REST API to manage users

---

## 📁 Project Structure

```
.
├── backend/                      # Node.js Express API
│   ├── index.js
│   └── ...
├── frontend/                    # React app (built with Vite)
│   └── ...
├── nginx/
│   ├── backend/nginx.conf       # Nginx config for backend load balancing
│   └── frontend/default.conf    # Nginx config for serving frontend
├── init.sql                     # SQL to create users table
├── docker-compose.yml           # Orchestrates all services
└── README.md
```

---

## ⚙️ Services Overview

### 🧠 `node-backend-[1,2,3]`

* Express app providing RESTful APIs:

  * `GET /api/users` – List all users
  * `POST /api/users` – Add user
  * `DELETE /api/users/:id` – Delete user
  * `GET /health` – Health check
* Connects to PostgreSQL using `pg`
* Configurable via `.env`

---

### 🧰 `backend-load-balancer`

* Nginx reverse proxy
* Load balances between 3 backend instances
* Default strategy: `round-robin`

---

### 🌐 `react-frontend`

* React Single Page App built with Vite
* Served by Nginx
* API calls (`/api/*`) proxied to backend load balancer

---

### 🛢️ `postgres-db`

* PostgreSQL 16.4
* Initializes using `init.sql`:

```sql
CREATE DATABASE users_db;
\c users_db;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL UNIQUE
);
```

---

## 🛠️ Getting Started

1. **Clone the repository**

```bash
git clone https://github.com/siddhartha8916/nginx-docker-setup.git
cd nginx-docker-setup
```

2. **Build and run with Docker Compose**

```bash
docker-compose up
```

> ⏳ First-time builds may take a few minutes due to image downloads.

3. **Access the application**

* Frontend: [http://localhost:3000](http://localhost:3000)

---

## 📦 API Endpoints

| Method | Endpoint         | Description           |
| ------ | ---------------- | --------------------- |
| GET    | `/api/users`     | List all users        |
| POST   | `/api/users`     | Add new user          |
| DELETE | `/api/users/:id` | Delete user by ID     |
| GET    | `/health`        | Health check (200 OK) |

---

## 💡 Features

* 🚦 Nginx load balancing (`round-robin`)
* 📦 Production-optimized Docker builds (multi-stage)
* 🔗 PostgreSQL database integration
* 🔄 Health-check endpoints on backend
* 🖥️ Full CRUD UI in React (Tailwind CSS optional)

---

## 🧼 Cleanup

To stop and remove containers, volumes, and networks:

```bash
docker-compose down -v
```

---

## 📝 License

**MIT** — Free to use and modify for personal or commercial projects.

---

## 🙌 Contributions

Pull requests are welcome! You can:

* Improve error handling
* Add authentication
* Much more

---
