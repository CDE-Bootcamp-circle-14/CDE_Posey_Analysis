
### Team Setup Guide – Posey Database Project

This guide will help each team member set up the project environment, run the Posey PostgreSQL database locally, and collaborate effectively on GitHub.
It’s tailored to the  `docker-compose.yml` and `load_posey_pg.sh` files so all team members can get the Posey database up and running quickly.

### Prerequisites

Before starting, make sure you have:

* **Docker** (v20+ recommended) → [Install Guide](https://docs.docker.com/get-docker/)
* **Docker Compose** (v2+) → usually included with Docker Desktop
* **Git** → [Install Guide](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* **psql (PostgreSQL client)** → optional but useful for running queries
* **Adminer** (already included in setup via Docker) – web interface to view database.

### Clone the Repository

```bash
# Clone using SSH 
git clone git@github.com:<TEAM-ORG>/<REPO-NAME>.git

# Or clone with HTTPS
git clone https://github.com/<TEAM-ORG>/<REPO-NAME>.git

cd cde_posey_analysis
```
### Environment Variables

Copy to `.env` and update values as needed.

Example values:

```env
POSTGRES_CONTAINER=posey_postgres
POSTGRES_DB=posey
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_PORT=5433

ADMINER_CONTAINER=posey_adminer
ADMINER_PORT=8080
```
### Start the Database

Run the following:

```bash
docker-compose up -d
```
* This starts a PostgreSQL 16 database and Adminer.
* The `posey_data/` folder (already in repo) is automatically mounted, so data loads on startup.

Check containers are running:

```bash
docker ps
```
You should see something like:

* `posey_postgres`
* `posey_adminer`

### Load Posey Data (Optional)

If you want to **reload data manually**, run:

```bash
./load_posey_pg.sh
```
This script downloads CSVs and loads them into the Posey database.
Ensure it has execute permissions first:

```bash
chmod +x load_posey_pg.sh
```
### Accessing the Database

* **Adminer UI:** Open [http://localhost:8080](http://localhost:8080)

  * System: PostgreSQL
  * Server: `postgres` 
  * Username: `postgres`
  * Password: `postgres`
  * Database: `posey`

* **psql CLI:**

  ```bash
  psql -h localhost -p 5433 -U postgres -d posey
  ```
  
### GitHub Collaboration Workflow

We’ll use **branches + pull requests** for collaboration.

1. **Create your branch**
2. 
   ```bash
   git checkout -b feature/<your-name-or-task>
   ```
3. **Make changes** → e.g. analysis notebooks, SQL queries, slides, docs

4. **Commit & push**

   ```bash
   git add .
   git commit -m "initial analysis for sales trends"
   git push -u origin my-feature-branch

   ```
5. **Open Pull Request (PR)** → Merge via review

Each team member should contribute via their branch.

### Next Steps

* Run exploratory analysis on Posey tables
* Share findings as images, SQL outputs, and charts
* Add contributions to repo via branches
* Create and upload the PowerPoint presentation
* Write detailed and comprehensive Read me
