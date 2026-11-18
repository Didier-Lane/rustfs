# RustFS

> Local [RustFS] container with docker-compose

## Requirements

- [Docker]
- [Docker Compose]
- [GNU Make]

## Usage

Operations are organized as make recipes, just run `make` to see the list of available targets.

```shell
$ make
Usage

# To run and execute a target
make <target>

Available Targets

config          🐋 Renders the Docker Compose file
up              🐋 Runs The RustFS container
down            🐋 Stops The RustFS container
destroy         🐋 Removes The RustFS container and volumes
check           🔄 Checks for newer versions of dependencies
help            💡 Shows this help menu
clean           ✨ Cleans the working copy
```

### The `.env` file

The `.env` file holds persisted [environment variables], it is automatically created on each invocation of `make`.

It can be removed either manually or with the `make clean` command.

### Environment variables

Those are the variables being persisted to the [`.env`] file when running `make`

| Name                      | Description                                                   | Default value
|:--                        |:--                                                            |:--
| `COMPOSE_PROJECT_NAME`    | The name of the Docker Compose project                        | `rustfs`
| `RUSTFS_VERSION`          | The tag of the [RustFS image]                                 | `1.0.6`
| `RUSTFS_DIGEST`           | The digest of the [RustFS image] tag                          | `sha256:0dff1515b3c52b5ce8c5df2263420c7f93ae1c5d07cca79e19e57cff86b84c85`
| `RESTART_POLICY`          | The [restart policy] of the container                         | `unless-stopped`
| `RUSTFS_OBS_LOGGER_LEVEL` | The [RustFS] log level                                        | `info`
| `RUSTFS_REGION`           | The [RustFS] S3 API region                                    | `eu-west-3`
| `RUSTFS_ACCESS_KEY`       | The [RustFS Credentials] access key                           | random hash
| `RUSTFS_SECRET_KEY`       | The [RustFS Credentials] secret key                           | random hash
| `RUSTFS_TLS_KEY`          | The [RustFS TLS] key                                          | `~/.ssl/rustfs/rustfs.key`
| `RUSTFS_TLS_CERT`         | The [RustFS TLS] certificate                                  | `~/.ssl/rustfs/rustfs.crt`

[RustFS]: https://github.com/rustfs/rustfs
[Docker]: https://www.docker.com/
[Docker Compose]: https://docs.docker.com/compose/
[GNU Make]: https://www.gnu.org/software/make/
[`.env`]: #the-env-file
[environment variables]: #environment-variables
[RustFS image]: https://hub.docker.com/r/rustfs/rustfs
[restart policy]: https://docs.docker.com/reference/compose-file/services/#restart
[RustFS TLS]: https://docs.rustfs.com/en/integration/tls-configured
[RustFS Credentials]: https://docs.rustfs.com/en/reference/environment-variables#credentials--internal
