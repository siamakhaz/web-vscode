# runme.sh Analysis

The `runme.sh` file is a Unix shell script that mirrors the functionality of `runme.bat` for Unix-like systems.

## Actions Performed:

- Creates a `project` directory in `/data`.
- Starts the Docker services defined in `docker-compose.yml` in detached mode.
- Displays the Docker containers' resource usage statistics with `docker stats`.

This script is intended for use in Unix-like environments, such as Linux or macOS, to streamline the Docker setup and execution process.
