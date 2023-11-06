# runme.bat Analysis

The `runme.bat` file is a Windows batch script for setting up and running the Docker environment.

## Actions Performed:

- Changes the permissions of the `vscode` directory to allow full access to everyone.
- Creates a new directory called `project` inside the `data` directory.
- Starts the Docker services defined in `docker-compose.yml` in detached mode.
- Displays the Docker containers' resource usage statistics with `docker stats`.

This script is meant to simplify the setup and running of the Docker environment on Windows systems.
