FROM python:3.12
ENV PYTHONUNBUFFERED 1
WORKDIR /CloudRun
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . ./
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app