COMPOSE_PROJECT_NAME		?= rustfs

# https://hub.docker.com/r/rustfs/rustfs
RUSTFS_VERSION				?= 1.0.0-alpha.95
RUSTFS_DIGEST				?= sha256:f6941338f670de4f6c02c39d4d8f332c8ee210cbd75c0a6da38bf6df17591870

# https://hub.docker.com/_/alpine
ALPINE_VERSION				?= 3.23.4
ALPINE_DIGEST				?= sha256:4d889c14e7d5a73929ab00be2ef8ff22437e7cbc545931e52554a7b00e123d8b

# Docker container restart policy
RESTART_POLICY				?= unless-stopped

RUSTFS_OBS_LOGGER_LEVEL		?= info

.PHONY: config
config: # 🐋 Renders the Docker Compose file
	docker compose config

.PHONY: up
up: # 🐋 Runs The RustFS container
	docker compose up --detach

.PHONY: down
down: # 🐋 Stops The RustFS container
	docker compose down $(ARGS)

PHONY: destroy
destroy: # 🐋 Removes The RustFS container and volumes
	$(MAKE) down ARGS=--volumes
