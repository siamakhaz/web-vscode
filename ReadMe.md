# Web-Based VSCode Development Environment

This repository contains all the necessary files to set up a web-based Visual Studio Code (VSCode) environment running inside a Docker container. It is designed to be easily deployable on any system that has Docker installed, providing a consistent and isolated development environment.

## Overview

The repository includes the following key components:

- `.dockerfile`: Defines the Docker image for the VSCode environment, preloaded with Python and data analysis tools.
- `.gitignore`: A list of files and directories to be ignored by Git, tailored for Python projects.
- `Docker-compose.yml`: Docker Compose configuration to build and run the VSCode server with the correct settings and volumes.
- `runme.bat`: A Windows batch script for setting up the environment and running the Docker container.
- `runme.sh`: A Unix shell script that performs similar actions as `runme.bat` for Unix-like systems.
- `data/.config and data/code-server` : Kepps you configuration files like setting and ... .
- `data/project` : Is the actual workspace for your projects

## Prerequisites

- [Docker installed](https://docs.docker.com/engine/install/) on your system.

## Setup

To set up the environment, clone the repository:

```sh
git clone https://github.com/your-username/web-vscode.git
cd web-vscode
```

## Running the Environment

Depending on your operating system, use one of the following scripts to start the environment:

### Windows

Run `runme.bat` by double-clicking on it or executing it in a Command Prompt window:

```bat
.\runme.bat
```

### Unix-like Systems (Linux/macOS)

Make `runme.sh` executable and run it:

```sh
chmod +x runme.sh
./runme.sh
```

Or use Docker Compose directly:

```sh
docker-compose up -d
```

## Accessing VSCode

Once the environment is running, open your web browser and go to `http://localhost:1988`. When prompted, enter the password:

- **URI**: `http://localhost:1988`
- **Password**: `imdragon`

## Customizing the Environment

Modify the `.dockerfile` to change the Docker image, the `.gitignore` to update files ignored by Git, or the `Docker-compose.yml` to adjust the Docker Compose configuration.

## Support

If you encounter any issues or have questions, please open an issue in the repository.

## Contributing

Feel free to contribute to this project by submitting pull requests or by reporting bugs and features through the issue tracker.

## License
This project is released under the [MIT LICENSE](LICENSE).


## Contact
For questions and feedback, please open an issue in the repository, and we will get back to you.


Enjoy coding in your web-based VSCode environment!
