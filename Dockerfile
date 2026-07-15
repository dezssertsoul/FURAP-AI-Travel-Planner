FROM python:3.11-slim
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV TF_ENABLE_ONEDNN_OPTS=0
COPY requirements.txt .
RUN python -m pip install --upgrade pip setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 8501
EXPOSE 8000
CMD ["streamlit", "run", "app.py", "--server.address=0.0.0.0", "--server.port=8501"]