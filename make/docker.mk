COMPOSE_PROJECT_NAME		?= rustfs

# https://hub.docker.com/r/rustfs/rustfs
RUSTFS_VERSION				?= 1.0.0-alpha.99
RUSTFS_DIGEST				?= sha256:a92846f09d9f1ccc41aeb9a9f1e8049093cc23b055d2b5a144e77525c1de1b41

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
