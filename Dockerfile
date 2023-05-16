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

RUN poetry install

RUN wget https://taskfile.dev/install.sh && \
    chmod +x install.sh && \
    sh ./install.sh -b /usr/bin && \
    PATH="$PATH:/usr/bin/task" && \
    rm ./install.sh

COPY sampleapp sampleapp
COPY sampleproject sampleproject

COPY Container-taskfile.yaml Taskfile.yaml
COPY manage.py manage.py

ENTRYPOINT ["task"]

CMD ["test"]
