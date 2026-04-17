COMPOSE_PROJECT_NAME		?= rustfs

# Ensure BuildKit is enabled for Docker Engine version earlier than 23.0
# https://docs.docker.com/build/buildkit/#getting-started
DOCKER_BUILDKIT            	:= 1

# https://docs.docker.com/build/building/variables/#buildkit_progress
BUILDKIT_PROGRESS          	?= auto

# https://hub.docker.com/r/rustfs/rustfs
RUSTFS_VERSION				?= 1.0.0-alpha.94
RUSTFS_DIGEST				?= sha256:4923778d3abd83c8dff66904c6eba39c171ec2bca987dee3bd8d6cb4d72b491e

# https://hub.docker.com/_/alpine
ALPINE_VERSION				?= 3.23.4
ALPINE_DIGEST				?= sha256:4d889c14e7d5a73929ab00be2ef8ff22437e7cbc545931e52554a7b00e123d8b

DOCKER_IMAGE				?= $(COMPOSE_PROJECT_NAME):$(RUSTFS_VERSION)

RUSTFS_ACCESS_KEY			?= $(shell $(random_hash))
RUSTFS_SECRET_KEY			?= $(shell $(random_hash))
RUSTFS_OBS_LOGGER_LEVEL		?= info

TLS_CA						?= ~/.ssl/local.io/CA.crt
TLS_KEY						?= ~/.ssl/local.io/rustfs.key
TLS_CERT					?= ~/.ssl/local.io/rustfs.crt

# Docker container restart policy
RESTART_POLICY				?= unless-stopped

define get_docker_image
docker images --format "{{.Repository}}:{{.Tag}}" | grep -E '^$(DOCKER_IMAGE)$$' 2>/dev/null
endef

.PHONY: build
build: # 🐋 Builds The RustFS image
	if [[ -z "$$( $(get_docker_image) )" || "$(BUILD)" =~ ^(true|yes|1)$$ ]]; then
		docker compose build \
			--build-arg TLS_CA="$$( cat $(TLS_CA) )"
	fi

.PHONY: config
config: # 🐋 Renders the Docker Compose file
	docker compose config

.PHONY: up
up: build # 🐋 Runs The RustFS container
	docker compose up --detach

.PHONY: down
down: # 🐋 Stops The RustFS container
	docker compose down
