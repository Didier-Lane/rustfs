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
| `COMPOSE_PROJECT_NAME`    | The name of the Docker Compose project                        | `1.0.0-alpha.99`
| `RUSTFS_VERSION`          | The tag of the [RustFS image]                                 | `rustfs`
| `RUSTFS_DIGEST`           | The digest of the [RustFS image] tag                          | `sha256:a92846f09d9f1ccc41aeb9a9f1e8049093cc23b055d2b5a144e77525c1de1b41`
| `RESTART_POLICY`          | The [restart policy] of the container                         | `unless-stopped`
| `RUSTFS_OBS_LOGGER_LEVEL` | The [RustFS] log level                                        | `info`
| `TLS_KEY`                 | The [RustFS TLS] key                                          | `~/.ssl/rustfs/rustfs.key`
| `TLS_CERT`                | The [RustFS TLS] certificate                                  | `~/.ssl/rustfs/rustfs.crt`

>[!IMPORTANT]
>The RustFS authentication relies on the following environment variables
>
>- `AWS_ACCESS_KEY_ID`
>- `AWS_SECRET_ACCESS_KEY`
>
>They **must be exported** in the current shell context to be used as Docker Compose secrets

[RustFS]: https://github.com/rustfs/rustfs
[Docker]: https://www.docker.com/
[Docker Compose]: https://docs.docker.com/compose/
[GNU Make]: https://www.gnu.org/software/make/
[`.env`]: #the-env-file
[environment variables]: #environment-variables
[RustFS image]: https://hub.docker.com/r/rustfs/rustfs
[restart policy]: https://docs.docker.com/reference/compose-file/services/#restart
[RustFS TLS]: https://docs.rustfs.com/integration/tls-configured.html
