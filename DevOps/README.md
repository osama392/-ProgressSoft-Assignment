# DevOps Assignment Answers

```bash
# 1. Docker Tasks
# This is my Dockerfile:
# FROM tomcat:9.0-jdk8
# COPY sample.war /usr/local/tomcat/webapps/
# EXPOSE 8080

# The commands to run Nginx and Postgres:
docker run -d -p 80:80 --name my-nginx nginx
docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=1234 --name my-postgres postgres


# 2. Kubernetes Tasks
# What is Kubernetes? 
# It is a tool to manage many Docker containers easily.

# Master vs Worker: 
# The master gives the orders, and the worker does the actual work and runs the apps.

# Command to test deployment: 
microk8s kubectl create deployment nginx --image=nginx


# 3. Concepts
# RAID: putting many hard disks together so we don't lose data if one breaks.
# DevOps: Developers and IT Operations working together as one team.
# HA: High Availability (the server is always working and never goes down).
# DR: Disaster Recovery (having a backup if the data center is destroyed).

# Cloud types:
# - IaaS: renting just the bare server hardware.
# - PaaS: renting a ready place to put our code.
# - SaaS: ready software to use like Gmail.

# DNS: changes website names to IP numbers.
# Load Balancer: splits the users between servers so the server doesn't crash.
