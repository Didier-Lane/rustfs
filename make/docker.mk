COMPOSE_PROJECT_NAME		?= rustfs

# https://hub.docker.com/r/rustfs/rustfs
RUSTFS_VERSION				?= 1.0.0-alpha.97
RUSTFS_DIGEST				?= sha256:50f3bbc09c81bb3a21f869668031c2b082e5b21ad786be0726c7bcf87500ee92

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
