# Load the JSON structure
$structure = Get-Content -Path "structure.json" -Raw | ConvertFrom-Json

# Set the root directory
$root_dir = $structure.root_dir

# Handle empty or "." root directory
if ([string]::IsNullOrEmpty($root_dir) -or $root_dir -eq ".") {
    $root_dir = Get-Location
} else {
    $root_dir = Convert-Path -Path $root_dir
}

# Create directories
Write-Host "Creating directories..."
foreach ($dir in $structure.directories) {
    $dirPath = Join-Path -Path $root_dir -ChildPath $dir
    if (-not (Test-Path -Path $dirPath)) {
        New-Item -ItemType Directory -Path $dirPath | Out-Null
        Write-Host "Created directory: $dirPath"
    } else {
        Write-Host "Directory already exists: $dirPath"
    }
}

# Create files
Write-Host "Creating files..."
if ($structure.files) { #check if the files object exists.
    foreach ($key in $structure.files.PSObject.Properties.Name) { #loop through the names of the properties.
        $filePath = Join-Path -Path $root_dir -ChildPath $key
        if (-not (Test-Path -Path $filePath)) {
            $structure.files.$key | Out-File -FilePath $filePath -Force
            Write-Host "Created file: $filePath"
        } else {
            Write-Host "File already exists: $filePath"
        }
    }
} else {
    Write-Host "The 'files' property in structure.json is missing."
}

Write-Host "Structure creation complete."