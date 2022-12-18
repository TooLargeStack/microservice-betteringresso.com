.PHONY: create_migration docker_stop docker_run docker_clean docker_logs

# ==============================================================================
# Go migrate postgresql
create_migration:
	migrate create -ext sql -dir migrations -seq $(migration_filename)

# ==============================================================================
# Docker commands
FILES := $(shell docker ps -aq)

docker_stop:
	docker stop $(FILES)
	docker rm $(FILES)

docker_run:
	docker compose up --build --force-recreate

docker_clean:
	docker system prune -f

docker_logs:
	docker logs -f $(FILES)