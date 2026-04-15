# Talium-tech Care Management App
Version: 1.0.0
# Talium-tech Care Management App

Ttech is redefining person centred care management for the modern world. We provide intelligent, accessible solutions that empower care homes to deliver safer, more coordinated, and more personalised support — starting with our pilot rollout in the United Kingdom and scaling globally.
Our platform creates a holistic healthcare ecosystem where every authorised party involved in a person’s care — families, clinicians, support workers, and providers — can securely access the relevant, real time information they need to make better decisions.
Our flagship care management application delivers a comprehensive, individualised overview of each person supported, while streamlining coordination, appointment scheduling, documentation, and staff workflows for care providers. Ttech is building the future of global care, one person at a time.


---

## Vision

Named after Talia — built for the future. Talium-tech exists to close the gap between outdated care management systems and
 the technology that modern healthcare deserves.

---

## Flagship Product — Care Management App

A backend API platform that enables care providers to:

- Manage patient records and care plans
- Schedule and track appointments
- Coordinate staff assignments
- Generate automated reports and health summaries
- Monitor system health in real time
- Medication administartion 
- Medication stock count

---

## Tech Stack

| Layer | Technology |
|---|---|
| Runtime | Node.js |
| Containerisation | Docker |
| Orchestration | Docker Compose |
| Web Server | Nginx (reverse proxy) |
| Cloud | AWS EC2 |
| OS | Ubuntu Linux |
| Version Control | Git / GitHub |
| Scripting | Bash |

---

## Project Structure
talium-tech/
├── care-app/           # Core application
│   ├── app.js          # Main server
│   ├── api/            # API routes
│   ├── db/             # Database migrations and seeds
│   ├── docs/           # API documentation
│   └── Dockerfile      # Container definition
├── scripts/            # Automation scripts
│   ├── health.sh       # Server health report
│   ├── backup.sh       # Automated database backup
│   ├── cleanup.sh      # Log cleanup
│   ├── deploy.sh       # Deployment script
│   └── log-report.sh   # Log analysis report
├── config/             # Environment configuration
├── logs/               # Application logs
├── database/           # Data and backups
└── docker-compose.yml  # Multi-container setup

---

## Getting Started

**Prerequisites:**
- Docker and Docker Compose installed
- Node.js 18+

**Run with Docker:**

```bash
git clone git@github.com:3nityGitHub/talium-tech.git
cd talium-tech
docker-compose up -d
```

**Test the app:**

```bash
curl http://localhost:3000
curl http://localhost:3000/health
```

---

## Automated Scripts

| Script | Purpose | Schedule |
|---|---|---|
| `health.sh` | Server health report | Every 5 minutes |
| `backup.sh` | Database backup | Daily at 2am |
| `cleanup.sh` | Remove old log files | Every Sunday at 3am |
| `log-report.sh` | Parse and analyse logs | On demand |

---

## Founder

**Rapheal** — AWS DevOps certified engineer and founder of Talium-tech.
Building real-world technology products that solve genuine problems in the healthcare sector.

---

## Status

Active development — V1.0.0
