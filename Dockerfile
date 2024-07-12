
FROM python:3.8-slim
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
WORKDIR /code
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install python-dotenv
CMD ["python", "app.py"] 
