FROM python:3.9-alpine

RUN python -m pip install --upgrade pip
RUN pip install poetry

RUN apk add -U --no-cache \
    postgresql -dev \
    gcc \
    python3-dev \
    musl-dev

WORKDIR /opt/app

COPY . .
RUN poetry install
RUN chmod u+x entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["./entrypoint.sh"]
