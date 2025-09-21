# 🔧 Auto-Heal Services

## 📌 Objective
Automatically detect and recover from service failures (IIS on Windows and nginx on Linux) to ensure high availability and reliability without manual intervention.  

This project demonstrates **Site Reliability Engineering (SRE) practices**:
- Service monitoring  
- Automated self-healing  
- Logging & alerting  
- Runbooks for manual remediation  
- Postmortems for incident analysis  

---

## 🏗️ Tech Stack
- **PowerShell** → Windows IIS monitoring & restart  
- **Bash (Shell script)** → Linux nginx monitoring & restart  
- **Task Scheduler (Windows)** → scheduled watchdog  
- **cron (Linux)** → scheduled watchdog  
- **Slack/MS Teams Webhook** (optional) → alert notifications  
- **GitHub** → version control & documentation  

---

## 📂 Repository Structure

