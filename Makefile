start:
	docker compose up -d
stop:
	docker compose down
migrate:
	docker compose run migrate