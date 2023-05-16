FROM python:3.11.3-slim AS builder
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

EXPOSE 8000

COPY sampleapp sampleapp
COPY sampleproject sampleproject

COPY Taskfile.container.yaml Taskfile.yaml
COPY manage.py manage.py

ENTRYPOINT ["task"]

FROM builder AS tests

CMD ["test"]


FROM builder AS prod

CMD ["run-prod-server"]


FROM builder as dev

CMD ["run-dev-server"]

