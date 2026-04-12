COMPOSE_PROJECT_NAME		?= rustfs

# Ensure BuildKit is enabled for Docker Engine version earlier than 23.0
# https://docs.docker.com/build/buildkit/#getting-started
DOCKER_BUILDKIT            	:= 1

# https://docs.docker.com/build/building/variables/#buildkit_progress
BUILDKIT_PROGRESS          	?= auto

# https://hub.docker.com/r/rustfs/rustfs
RUSTFS_VERSION				?= 1.0.0-alpha.93
RUSTFS_DIGEST				?= sha256:28bef1092e735427086d083d32b3e2d5eb125922fbd913cb8ef3d29c344cf546

# https://hub.docker.com/_/alpine
ALPINE_VERSION				?= 3.23.3
ALPINE_DIGEST				?= sha256:59855d3dceb3ae53991193bd03301e082b2a7faa56a514b03527ae0ec2ce3a95

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
