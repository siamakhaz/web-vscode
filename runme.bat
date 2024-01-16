icacls "..\vscode\" /grant Everyone:F /t

mkdir .\data\project
set DOCKERFILE_PATH=./dockerfile/node.dockerfile
docker compose up -d 
start http://localhost:1988
docker stats 