icacls "..\vscode\" /grant Everyone:F /t

mkdir .\data\project
docker compose up -d 
docker stats 