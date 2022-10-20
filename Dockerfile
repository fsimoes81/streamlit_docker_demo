FROM python:3.8.15-slim

EXPOSE 8501

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/fsimoes81/streamlit_docker_demo .

RUN pip3 install -r requirements.txt

WORKDIR /app/example-app-ab-testing

ENTRYPOINT ["streamlit", "run", "streamlit_app.py", "--server.port=8501", "--server.address=0.0.0.0"]