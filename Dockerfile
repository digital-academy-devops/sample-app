FROM python:3.11.3-slim
WORKDIR /opt/app

RUN apt update && \
    apt upgrade && \
    python -m pip install --upgrade pip 

RUN apt install -y \
    wget && \
    rm -rf /var/lib/apt/lists/*	

RUN pip install \
    poetry

COPY pyproject.toml pyproject.toml
COPY poetry.lock poetry.lock
COPY poetry.toml poetry.toml

COPY sampleapp sampleapp
COPY sampleproject sampleproject
COPY manage.py manage.py

RUN poetry install

EXPOSE 8000

COPY entrypoint.sh entrypoint.sh
RUN chmod u+x entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
