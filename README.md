<!-- to run this code first run "python .\setup_database.py"
<!-- then run streamlit run .\app.py -->



🔍 Natural Language Search for PostgreSQL

This project lets you query a PostgreSQL database using normal language, so you don’t have to write SQL.
You can ask questions in English or simple Hindi, and the app converts them into SQL queries and shows the results.

I built this project to understand how LLMs, databases, and real-world data querying work together.

✨ What this project does

Ask questions in English or Hindi

Automatically converts questions into SQL

Runs queries on a PostgreSQL database

Shows the generated SQL for transparency

Displays results in a simple web UI

Allows downloading results as CSV

Uses environment variables properly (see .env.example)

Uses uv for fast Python package installation

🧰 Tools & Technologies

Python

Streamlit

PostgreSQL

Docker

pgvector

SQLAlchemy

OpenAI / LangChain

uv (Python package installer)

📁 Project Structure
.
├── app.py
├── services/
├── config.py
├── logger_config.py
├── .env.example
├── pyproject.toml
├── requirements.txt
└── README.md

⚙️ How to run the project
1. Clone the repo
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name

2. Install dependencies
uv sync

3. Environment setup
cp .env.example .env


Refer to .env.example for required variables.

▶️ Start the app
streamlit run app.py


Open in browser:

http://localhost:8501

🐳 PostgreSQL + pgvector using Docker (WSL friendly)

PostgreSQL runs using Docker with pgvector, which keeps the setup clean and makes the project ready for future AI or vector search use cases.

docker run -d \
  --name pg_database \
  -e POSTGRES_PASSWORD=your_password \
  -p 5433:5432 \
  pgvector/pgvector:pg17-trixie


Enable pgvector once:

CREATE EXTENSION IF NOT EXISTS vector;

🧠 Why uv, Docker, and pgvector?

uv makes dependency installation very fast

Docker avoids local setup issues

pgvector allows semantic and similarity search later

This setup is commonly used in LLM-based applications

📝 Example questions

Show all employees in engineering

List top 5 highest salaries

Find products priced above 1000

Show similar records using embeddings

🔐 Security notes

.env is ignored using .gitignore

.env.example documents required variables

Secrets are never committed to GitHub

📄 License

MIT License

👤 Author

Rahul Pathak

💬 Interview-friendly line

“The app supports both English and Hindi questions and converts them into SQL, making database access easier for non-technical users.”

If you want, I can now:

Tighten this further for ATS screening

Add one-page architecture explanation

Help you prepare interview answers from this project

Just say 👍 -->