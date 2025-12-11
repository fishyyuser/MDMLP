# End-to-End Machine Learning Deployment — Lightweight, Containerized, Production-Ready ML Service

This project demonstrates how to convert a trained machine learning model into a fully deployable inference service using Docker and AWS EC2, optimized for low-resource cloud environments.

Unlike typical ML repositories that mix training and inference together, MDMLP (Minimum Deployable Machine Learning Project) intentionally separates them:

- Training happens offline (local / Colab / GPU)
- Only artifacts are deployed (preprocessor + model pickle)
- The Docker image contains inference-only dependencies
- This keeps the container small, fast, and cloud-efficient

This is the same deployment philosophy used in real-world ML production systems.



## Problem Statement

The model predicts student performance (final math score) from demographic and academic features such as:

gender  
race_ethnicity  
parental_level_of_education  
lunch  
test_preparation_course  
writing_score  
reading_score

Dataset used:  
https://www.kaggle.com/datasets/spscientist/students-performance-in-exams



## Model Selection Summary

Multiple regression models were trained and evaluated. Ridge Regression and Linear Regression scored almost identically, but Linear Regression had a smaller model size and faster inference time.

Final deployed model: Linear Regression  
Reason: Similar accuracy to Ridge Regression, but smaller storage size and more efficient inference.

Top test-set performance scores:

Linear Regression — R2: 0.8803  
Ridge Regression — R2: 0.8806  
CatBoost — R2: 0.8516  
AdaBoost — R2: 0.8488  
Random Forest — R2: 0.8473  
XGBoost — R2: 0.8278  
Lasso — R2: 0.8253  
KNN — R2: 0.7838  
Decision Tree — R2: 0.7206



## API Inputs

The app accepts 7 user inputs (numeric or dropdown fields):

gender  
race_ethnicity  
parental_level_of_education  
lunch  
test_preparation_course  
writing_score  
reading_score

The output is a predicted math score.



## Architecture (Training → Artifacts → Deployment)

Training happens offline  
↓  
Export serialized artifacts (model.pkl + preprocessor.pkl)  
↓  
Build Docker image with inference-only environment  
↓  
Run container on AWS EC2  
↓  
User inputs features via web form  
↓  
Model returns score prediction

Key design decisions:
- Training code is not packaged inside deployment container
- Only serialized artifacts are included
- Container stays lightweight and boots quickly even on free-tier EC2



## Cost Optimization (AWS Free Tier)

AWS Free Tier has a 720-hour/month limit.  
To avoid unnecessary billing, the EC2 instance is intentionally shut down when not in use.  
The container remains intact and can be restarted any time.

This reflects real-world cost-aware ML deployment practices used in startups.



## Docker Usage

Build image (optional)
docker build -t student-performance .

Run container locally
docker run -d -p 8080:8080 student-performance

Open in browser:
http://localhost:8080



## Deploy on AWS EC2 (Full Workflow)

1) SSH into EC2
   
```bash
ssh -i <your-key.pem> ubuntu@<your-ec2-public-ip>
```


2) List Docker images
```bash
docker images
```

3) Run container
```bash
docker run -d -p 8080:8080 <docker-image-name>
```

4) Confirm the container is running
```bash
docker ps
```

5) Access application from browser
```bash
http://<your-ec2-public-ip>:8080
```

6) Stop / restart container
```bash
docker stop <container-name>  
docker start <container-name>
```

IMPORTANT  
Ensure port 8080 is open in EC2 security group.



## Training Repository Link

This deployment repository intentionally contains inference-only code.

The full training pipeline including:
- model comparisons
- evaluation metrics
- hyperparameter tuning
- artifact generation (model.pkl and preprocessor.pkl)

…is available in the companion repository:

https://github.com/fishyyuser/ML-Project

MDMLP uses the exported artifacts generated from that repository.



## Tech Stack

Python  
Flask  
Scikit-Learn  
Docker  
AWS EC2  
HTML / CSS for simple UI



## License

MIT
