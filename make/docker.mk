COMPOSE_PROJECT_NAME		?= rustfs

# https://hub.docker.com/r/rustfs/rustfs
RUSTFS_VERSION				?= 1.0.6
RUSTFS_DIGEST				?= sha256:0dff1515b3c52b5ce8c5df2263420c7f93ae1c5d07cca79e19e57cff86b84c85

# Docker container restart policy
RESTART_POLICY				?= unless-stopped

RUSTFS_OBS_LOGGER_LEVEL		?= info

RUSTFS_REGION				?= eu-west-3

RUSTFS_ACCESS_KEY			?= $(shell $(random_hash))
RUSTFS_SECRET_KEY			?= $(shell $(random_hash))

RUSTFS_TLS_KEY				?= ~/.ssl/rustfs/rustfs.key
RUSTFS_TLS_CERT				?= ~/.ssl/rustfs/rustfs.crt

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
