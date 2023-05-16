# Тестовое приложения для развертывания 

## Установка

Может осуществляться при помощи:
- [poetry](https://python-poetry.org)
- [pip](https://pip.pypa.io/en/stable/) + [virtualenv](https://virtualenv.pypa.io/en/latest/)


Если необхоодимо, обновите `pip`:
```shell
python -m pip install --upgrade pip
```

### Poetry

Если необходимо, установите `poetry`:
`pip install poetry`

Установите зависимости приложения:
```shell
poetry install
```

### Pip

Установите `virtualenv`:
```shell
pip install virtualenv
```

Создайте `virtualenv` и активируйте его:
```shell
virtualenv ve
source ve/bin/activate
```

Установите зависимости приложения:
```shell
pip install -r requirements.txt
```



## Локальный запуск

### Системные команды и тесты
```shell
python manage.py migrate
python manage.py collectstatic
python manage.py test
```

### Запуск development сервера:
```shell
python manage.py runserver
```

### Запуск gunicorn

```shell
gunicorn sampleproject.wsgi
```
### Сборка docker-контейнера с помощью Taskfile
```shell
task build
```

### Запуск docker-контейнера с помощью Taskfile
```shell
// Запуск unit-тестов
task run-test TAG=YOUR_TAG

// Запуск сбора статистики
task run-collectstatic TAG=YOUR_TAG 

 // Запуск миграции
task run-migrate TAG=YOUR_TAG

// Запуск dev-сервера
task run-server TAG=YOUR_TAG
```


