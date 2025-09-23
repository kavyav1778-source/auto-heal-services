\# 📓 Day 1 — Auto-Heal Services Project Setup



\## ✅ What I Accomplished

\- Set up my first GitHub repo for SRE project: \*\*auto-heal-services\*\*.

\- Installed and configured Git on my local machine.

\- Learned how to use `git clone`, `git add`, `git commit`, and `git push`.

\- Created project folder structure (`windows`, `linux`, `runbooks`, `postmortems`).

\- Wrote my first \*\*PowerShell auto-heal script\*\* (`ensure-iis.ps1`).

\- Fixed file naming issues in Git Bash/nano.

\- Successfully pushed my first script to GitHub.



---



\## 🛠 Commands I Ran



\### 1. Clone GitHub Repo

```bash

cd ~/Documents

git clone https://github.com/kavyav1778-source/auto-heal-services.git

cd auto-heal-services


## Create project folder

mkdir windows linux runbooks postmortems



\##Stage \& Commit Folder Structure

git add .

git commit -m "chore: add initial project folder structure"

git push origin main



\##Configure Git Identity

git config --global user.name "Kavya V"

git config --global user.email "kavyav1778@gmail.com"



\##Verify Files

ls windows/

cat windows/ensure-iis.ps1



\##Commit \& Push First Script

git add windows/ensure-iis.ps1

git commit -m "feat: add IIS auto-heal PowerShell script"

git push origin main



\##My First Script (ensure-iis.ps1)

\# ensure-iis.ps1

\# Script to auto-heal IIS service (W3SVC)

\# Logs actions to C:\\sre\\autoheal.log



$logFile = "C:\\sre\\autoheal.log"



\# Ensure log directory exists

if (!(Test-Path "C:\\sre")) {

&nbsp;   New-Item -ItemType Directory -Path "C:\\sre" | Out-Null

}



\# Check IIS service status

$service = Get-Service W3SVC -ErrorAction SilentlyContinue

if ($service.Status -ne "Running") {

&nbsp;   Restart-Service W3SVC

&nbsp;   $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

&nbsp;   Add-Content -Path $logFile -Value "$timestamp - IIS was down. Restarted automatically."

}



