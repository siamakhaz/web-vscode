icacls "..\vscode\" /grant Everyone:F /t

mkdir .\data\project
docker compose up -d 
start http://localhost:1988
docker stats 