# IRIS Insight - Repository Analyzer

GitGrade Hackathon Submission - AI + Code Analysis + Developer Profiling

A tool that analyzes GitHub repositories and gives you a score, summary, and roadmap for improvement. Basically helps students see how their repos look to recruiters.

## What It Does

Paste a GitHub repo URL and get:
- A score from 0-100 (Beginner/Intermediate/Advanced)
- A summary of what's good and what needs work
- A roadmap with specific steps to improve

## Features

**Input:** Just paste any public GitHub repo URL

**What it checks:**
- Code quality (TODOs, complexity)
- Documentation (README, descriptions, license)
- Test coverage (test folders, coverage if available)
- Project structure (folder organization)
- Commit history (frequency, PRs, branches)
- Real-world stuff (CI/CD, Docker, usage examples)

**Output:**
- Score: 0-100 with category (Beginner < 50, Intermediate 50-79, Advanced ≥ 80)
- Summary: Lists strengths and weaknesses
- Roadmap: Actionable steps like "add README", "set up CI/CD", etc.

## Tech Stack

- Frontend: Next.js, React, TypeScript
- Backend: Fastify, TypeScript, Node.js
- GitHub API via Octokit

## Setup

1. Clone the repo
```bash
git clone <your-repo-url>
cd IRIS_AI
```

2. Install dependencies
```bash
# Backend
cd backend
npm install

# Frontend
cd ../frontend
npm install
```

3. Optional: Add GitHub token for higher rate limits
Create `backend/.env`:
```
GITHUB_TOKEN=your_token_here
PORT=3001
```

4. Run it
```bash
# Terminal 1 - Backend
cd backend
npm run dev

# Terminal 2 - Frontend
cd frontend
npm run dev
```

Open `http://localhost:3000` and paste a repo URL.

## How It Works

1. **Fetches repo data** - Gets metadata, commits, structure from GitHub API
2. **Analyzes different aspects:**
   - Code: Scans for TODOs, calculates complexity
   - Docs: Checks README sections, license, description
   - Structure: Looks for src/, tests/, nesting depth
   - Commits: Calculates frequency, checks PRs and branches
   - Relevance: Checks for usage examples, CI/CD, Docker
3. **Scores everything** - Weights: Code Quality 25%, Docs 20%, Tests 20%, Commits 15%, Structure 10%, Relevance 10%
4. **Generates roadmap** - Suggests improvements based on what's missing
