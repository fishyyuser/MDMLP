# End-to-End Machine Learning Project

This project demonstrates an end-to-end machine learning workflow deployed via Docker on AWS EC2.

---

## Prerequisites

- AWS EC2 instance (t3.micro recommended for free tier)
- Docker installed on the instance
- The Docker image pushed to AWS ECR (or available locally)

---

## Workflow After Resuming the Server

After you start your AWS EC2 instance, follow these steps:

### 1. Connect to the EC2 Console

Use SSH to connect to your instance:

```bash
ssh -i <your-key.pem> ubuntu@<your-ec2-public-ip>
```

or

You can use aws console to connect, so that EC2 console opens in browse

### 2. List Docker Images

Get the name of the image available on your instance:

```bash
docker images
```

Copy the image name you want to run. ending with suffix **student-performance**

### 3. Run the Docker Container

Run the image in detached mode and map port 8080:

```bash
docker run -d -p 8080:8080 "<docker-image-name>"
```

> Replace "<docker-image-name>" with the actual name of your Docker image.

### 4. Check if the Container is Running

```bash
docker ps
```

You should see your container listed and running.

---

## Accessing the Application

Open a browser and go to:

"http://<your-ec2-public-ip>:8080"

You should see your application running.

---

## Stopping the Container

To stop the container without deleting it:

```bash
docker stop "<docker-container-name>"
```

To start it again later:

```bash
docker start "<docker-container-name>"
```

---

## Notes

- Make sure the EC2 security group allows inbound TCP traffic on port 8080.

---
