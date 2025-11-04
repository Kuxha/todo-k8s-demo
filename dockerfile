FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV FLASK_ENV=production \
    PORT=5000 \
    MONGO_HOST=mongo \
    MONGO_PORT=27017

EXPOSE 5000

CMD ["python", "app.py"]
