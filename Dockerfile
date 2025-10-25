FROM python:3.9-slim

WORKDIR /app

COPY app.py requirements.txt /app/
COPY artifacts/ /app/artifacts/
COPY src/ /app/src/
COPY static/ /app/static/
COPY templates/ /app/templates/

RUN pip install --no-cache-dir -r requirements.txt

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
