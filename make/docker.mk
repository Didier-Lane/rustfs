COMPOSE_PROJECT_NAME		?= rustfs

# https://hub.docker.com/r/rustfs/rustfs
RUSTFS_VERSION				?= 1.0.0-beta.11
RUSTFS_DIGEST				?= sha256:e4151ec4728f4d39a714a2c5f6e1f4bc8e0789fe5af4874b95121bae39c6cd12

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
