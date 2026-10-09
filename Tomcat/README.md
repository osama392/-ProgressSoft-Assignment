# Tomcat Assignment

## 1. What is JVM?
JVM (Java Virtual Machine) is like a translator. It takes the Java code that developers write and translates it into machine language so the computer can understand and run it.

## 2. What is an Application Server?
An application server is a software that provides an environment to run web applications. It does the heavy lifting like handling business logic and connecting the website to the database.

## 3. What is a WAR file?
WAR stands for Web Application Archive. It is just a zipped file that contains all the files of a Java web project (like Java classes, HTML, and images). 
- **How Tomcat handles it:** Tomcat reads the WAR file and extracts it to run the website.
- **Where to deploy it:** We put the WAR file inside a folder called `webapps` in the Tomcat directory.
