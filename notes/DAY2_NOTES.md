\# 📓 Day 2 — Auto-Heal Services Project (Linux + Runbook)



\## ✅ What I Accomplished

\- Expanded the project to cover \*\*Linux systems\*\*.  

\- Created a \*\*Linux auto-heal script\*\* (`ensure-nginx.sh`) for nginx.  

\- Wrote a \*\*runbook\*\* (`linux-nginx.md`) for manual troubleshooting.  

\- Committed and pushed both files to GitHub.  

\- Learned that Linux commands (`systemctl`, `journalctl`) don’t work in Git Bash on Windows — they only run on a real Linux system (VM, WSL, or server).  



---



\## 🛠 Commands I Ran



\### 1. Go into repo

```bash

cd ~/Documents/auto-heal-services


##Create Linux auto-heal script

notepad linux/ensure-nginx.sh



\##Script content:

\#!/bin/bash

\# ensure-nginx.sh

\# Script to auto-heal nginx service

\# Logs actions to ~/sre/autoheal.log



LOGFILE="$HOME/sre/autoheal.log"



\# Ensure log directory exists

mkdir -p "$HOME/sre"



\# Check nginx status

if ! systemctl is-active --quiet nginx; then

&nbsp;   systemctl restart nginx

&nbsp;   TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

&nbsp;   echo "$TIMESTAMP - nginx was down. Restarted automatically." >> "$LOGFILE"

fi


##Create nginx runbook

notepad runbooks/linux-nginx.md



\##Runbook content:
# 🛠 Runbook: nginx Service Recovery



\## 📌 Scenario

nginx web server is not responding.



---



\## 🔎 Step 1: Verify nginx status

```bash

systemctl status nginx



\##Restart service
sudo systemctl restart nginx



\##Check logs
journalctl -u nginx --since "10 minutes ago"



\##Verify Web server
curl -I http://localhost



✅ If all works → service restored.

❌ If not → escalate to SRE team.




\### 4. Add, Commit, and Push

```bash

git add linux/ensure-nginx.sh runbooks/linux-nginx.md

git commit -m "feat: add nginx auto-heal script and runbook"

git push origin main




