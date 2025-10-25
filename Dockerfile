FROM python:3.9-alpine
WORKDIR /app

# Copy only required files and folders
COPY app.py /app/
COPY requirements.txt /app/
COPY artifacts/ /app/artifacts/
COPY src/ /app/src/
COPY static/ /app/static/
COPY templates/ /app/templates/

# Install OS dependencies
RUN apk update && apk add --no-cache ffmpeg libsm6 libxext6 unzip aws-cli

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]
