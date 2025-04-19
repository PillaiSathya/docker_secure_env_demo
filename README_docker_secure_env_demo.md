# 🔐 Docker Secure ENV Demo

This project demonstrates a **secure Docker setup** using:

- ✅ `.env` file for non-sensitive configuration
- ✅ Docker Secrets for real secret management (e.g., API token)
- ✅ Non-root user for security best practices
- ✅ Multi-stage build to reduce image size
- ✅ Docker Swarm for real-world production simulation

---

## 📁 Project Structure

```
docker_secure_env_demo/
├── app/
│   └── start.sh            # Main script that echoes ENV & secret
├── secret.txt              # Secret file (token/password)
├── .env                    # Environment variables (non-sensitive)
├── Dockerfile              # Multi-stage Dockerfile
└── docker-compose.yml      # Docker Swarm-compatible deployment
```

---

## 🚀 Steps to Run

### 1️⃣ Build the image locally

```bash
docker build -t secure_env_demo .
```

### 2️⃣ Update `docker-compose.yml`

Replace `build:` with:

```yaml
image: secure_env_demo
```

### 3️⃣ Initialize Docker Swarm (if not already)

```bash
docker swarm init
```

### 4️⃣ Deploy the stack

```bash
docker stack deploy -c docker-compose.yml secure_stack
```

### 5️⃣ Check logs

```bash
docker service logs secure_stack_secure_app
```

✅ Output:
```
Hello from Sathya!
Your role is: Docker Defender
🔐 Secret token: shobi_secret_token@123
```

---

## 💡 Why This Project Matters

This project simulates **secure container practices** in production:

- `.env` keeps config outside code
- Secrets are mounted securely inside `/run/secrets/...`
- No root user is used (we add a user via `adduser`)
- Multi-stage build = image size ~5MB

---

## 🐳 Technologies Used

- Docker (Compose, Secrets, Swarm)
- Alpine Linux (lightweight base)
- Shell scripting (POSIX `sh`)
- Git + GitHub

---

## 👩‍💻 Author

Made with ❤️ by [Sathya](https://github.com/PillaiSathya) — Future DevOps Engineer 👩‍💻

---

## 🧼 Clean Up

```bash
docker stack rm secure_stack
docker secret rm secure_stack_app_token
```

---

> This is a production-style Docker challenge showcasing real-world best practices!
