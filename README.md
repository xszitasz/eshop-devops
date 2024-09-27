# Multi-VM Infrastructure Setup for Full-Stack Application

This project sets up a multi-VM infrastructure designed to host and deploy both backend and frontend components for a full-stack application. Each VM serves a different purpose in the architecture, from deploying backend and frontend services to acting as a simple web server for a static Angular application.

## Table of Contents
- [Project Overview](#project-overview)
- [VM Architecture](#vm-architecture)
- [Prerequisites](#prerequisites)
- [VM1: Linux Mint (Docker + Jenkins)](#vm1-linux-mint-docker--jenkins)
  - [1. Install Docker](#1-install-docker)
  - [2. Set Up Jenkins for CI/CD](#2-set-up-jenkins-for-cicd)
  - [3. Deploy Backend and Frontend Services](#3-deploy-backend-and-frontend-services)
- [VM2: Alpine Linux (Web Server)](#vm2-alpine-linux-web-server)
  - [1. Set Up the Alpine Web Server](#1-set-up-the-alpine-web-server)
  - [2. Serve the Angular Application](#2-serve-the-angular-application)
  - [3. Email Notification on IP Change](#3-email-notification-on-ip-change)
- [VM3: TBD Linux Distribution](#vm3-tbd-linux-distribution)
- [Automating Tasks with Cron](#automating-tasks-with-cron)
- [Networking and Security](#networking-and-security)
- [Future Plans](#future-plans)

---

## Project Overview

The project leverages multiple virtual machines (VMs) to build and serve a complete application stack:

- **VM1 (Linux Mint):** Acts as the CI/CD pipeline using Jenkins to deploy both the frontend (Angular) and backend services (e.g., Node.js) via Docker containers. It will also run PostgreSQL as the database service.
- **VM2 (Alpine Linux):** A lightweight VM used as a web server, hosting and serving a static Angular frontend without Docker.
- **VM3 (TBD):** A third VM, potentially configured for additional services such as security or load balancing, or for hosting microservices in the future.

---

## VM Architecture

1. **VM1 (Linux Mint)**
   - Purpose: Host Docker containers for the backend, frontend, and database services. Jenkins will be used for automated deployment.
   - Services: 
     - Jenkins (CI/CD)
     - Docker (Backend, Frontend, PostgreSQL)
     - Keycloak (optional)

2. **VM2 (Alpine Linux)**
   - Purpose: Serve the static frontend (Angular) without Docker, acting as a lightweight web server.
   - Services:
     - Static Web Server (nginx or similar)
     - Monitoring IP changes and notifying via email.

3. **VM3**
   - Purpose: To be determined based on project requirements, possibly acting as a load balancer, additional microservices host, or security gateway.

---

## Prerequisites

- A basic understanding of Linux command line usage.
- SSH access to all VMs.
- Root or `sudo` access on all VMs.
- A Gmail account with "Less Secure Apps" enabled or an App Password for email notifications.

---