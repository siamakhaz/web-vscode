$port = 1988
$appport = 3000


# Function to check if the port is in use
function Test-PortInUse {
    param($port)
    $ip = [System.Net.IPAddress]::Loopback
    $tcpClient = New-Object System.Net.Sockets.TcpClient

    try {
        $tcpClient.Connect($ip, $port)
        return $true
    } catch {
        return $false
    } finally {
        $tcpClient.Close()
    }
}

# Grant folder permission
icacls "..\vscode\" /grant Everyone:F /t


# Select Dockerfile
Write-Host "Select a Dockerfile:"
$dockerfiles = Get-ChildItem -Path "./dockerfile" -Filter "*.dockerfile"
for ($i = 0; $i -lt $dockerfiles.Count; $i++) {
    $fileNameWithoutExtension = [System.IO.Path]::GetFileNameWithoutExtension($dockerfiles[$i].Name)
    Write-Host "$($i+1): $fileNameWithoutExtension"
}

[int]$selection = Read-Host -Prompt "Enter selection (number)"
if ($selection -ge 1 -and $selection -le $dockerfiles.Count) {
    $selectedDockerfile = $dockerfiles[$selection - 1].FullName
    $Env:DOCKERFILE_PATH = $selectedDockerfile
    Write-Host "Selected Dockerfile: $selectedDockerfile"

     # Extract the base path from the Dockerfile name
     $basePath = [System.IO.Path]::GetFileNameWithoutExtension($dockerfiles[$selection - 1].Name)
     Write-Host "Base Path for Volumes: $basePath"
 

    # User input for service and container names
    # $serviceName = Read-Host -Prompt "Enter the service name"
    # $containerName = Read-Host -Prompt "Enter the container name"
    $serviceName = "vscode-"+$basePath
    $containerName = "vscode-"+$basePath+"-image"
    # $basePath = Read-Host -Prompt "Enter the base path for volumes"

    # Increment port number until an unused one is found
    while (Test-PortInUse -port $port) {
        $port++
    }
    while (Test-PortInUse -port $appport) {
        $appport++
    }
    Write-Host "Using port $port and $appport"
    # create the project folders
    New-Item -Path ".\data\$basePath\project" -ItemType Directory -Force
    New-Item -Path ".\data\$basePath\.config" -ItemType Directory -Force
    New-Item -Path ".\data\$basePath\code-server" -ItemType Directory -Force
    # Set environment variables
    $env:DOCKER_PORT = $port
    $env:SERVICE_NAME = $serviceName
    $env:CONTAINER_NAME = $containerName
    $env:BASE_PATH = $basePath
    

    # Generate docker-compose.yml from template
    $templateContent = Get-Content "docker-compose.template.yml" -Raw
    $updatedContent = $templateContent -replace '\{\{SERVICE_NAME\}\}', $serviceName `
                                      -replace '\{\{CONTAINER_NAME\}\}', $containerName `
                                      -replace '\{\{DOCKERFILE_PATH\}\}', $selectedDockerfile `
                                      -replace '\{\{DOCKER_PORT\}\}', $port `
                                      -replace '\{\{APP_PORT\}\}', $appport `
                                      -replace '\{\{BASE_PATH\}\}', $basePath
    $updatedContent | Out-File -FilePath "docker-compose.yml"

    # Run docker-compose
    docker-compose up -d --build
} else {
    Write-Host "Invalid selection. Exiting."
}

Start-Process "http://localhost:$port"
docker stats
