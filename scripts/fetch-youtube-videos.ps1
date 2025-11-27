param(
    [string]$ChannelId = "UCZViA1H735XlDMyp4jcGy0g",
    [string]$ApiKey = "",
    [int]$MaxResults = 15,
    [string]$OutputFile = "docs/support/videos-list.md",
    [string]$ConfigFile = ".youtube-api-key"
)

# Try to read API key from config file if not provided
if (-not $ApiKey) {
    if (Test-Path $ConfigFile) {
        $ApiKey = (Get-Content $ConfigFile -Raw).Trim()
        Write-Host "API Key loaded from $ConfigFile" -ForegroundColor Green
    }
}

# Final validation
if (-not $ApiKey) {
    Write-Host ""
    Write-Host "ERROR: YouTube API Key not found" -ForegroundColor Red
    Write-Host ""
    Write-Host "You can provide the API key in 3 ways:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "1. Command line parameter:"
    Write-Host "   .\fetch-youtube-videos.ps1 -ApiKey 'YOUR_API_KEY'" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "2. Store in .youtube-api-key file (recommended):"
    Write-Host "   echo 'YOUR_API_KEY' | Out-File -FilePath .youtube-api-key -Encoding UTF8" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Get API Key: https://console.cloud.google.com" -ForegroundColor Green
    Write-Host ""
    exit 1
}

$apiUrl = "https://www.googleapis.com/youtube/v3/search"
$params = @{
    key        = $ApiKey
    channelId  = $ChannelId
    part       = "snippet"
    order      = "date"
    type       = "video"
    maxResults = $MaxResults
}

Write-Host "Fetching videos from YouTube channel: $ChannelId" -ForegroundColor Cyan

try {
    $response = Invoke-RestMethod -Uri $apiUrl -Body $params -Method Get
    
    if ($response.items.Count -eq 0) {
        Write-Warning "No videos found for channel: $ChannelId"
        exit 1
    }
    
    Write-Host "Found $($response.items.Count) videos" -ForegroundColor Green
    
    $markdown = @"
# Modbus Monitor Video Tutorials

Latest videos from our channel.

| Video Title | Watch | Link |
|-------------|-------|------|
"@
    
    foreach ($item in $response.items) {
        $videoId = $item.id.videoId
        $title = $item.snippet.title
        $url = "https://www.youtube.com/watch?v=$videoId"
        $markdown += "`n| $title | [Watch]($url) | [$url]($url) |"
        Write-Host "  + $title" -ForegroundColor Yellow
    }
    
    $markdown += "`n`n---`n`n[Subscribe to YouTube](https://www.youtube.com/modbusmonitor){ .md-button target=`"_blank`" }`n"
    
    $markdown | Out-File -FilePath $OutputFile -Encoding UTF8 -Force
    
    Write-Host "`nSaved to: $OutputFile" -ForegroundColor Green
    
} catch {
    Write-Error "API Error: $($_.Exception.Message)"
    exit 1
}

$apiUrl = "https://www.googleapis.com/youtube/v3/search"
$params = @{
    key        = $ApiKey
    channelId  = $ChannelId
    part       = "snippet"
    order      = "date"
    type       = "video"
    maxResults = $MaxResults
}

Write-Host "Fetching videos from YouTube channel: $ChannelId" -ForegroundColor Cyan

try {
    $response = Invoke-RestMethod -Uri $apiUrl -Body $params -Method Get
    
    if ($response.items.Count -eq 0) {
        Write-Warning "No videos found for channel: $ChannelId"
        exit 1
    }
    
    Write-Host "Found $($response.items.Count) videos" -ForegroundColor Green
    
    $markdown = "# Modbus Monitor Video Tutorials`n`nLatest videos from our channel.`n`n| Video Title | Watch | Link |`n|-------------|-------|------|`n"
    
    foreach ($item in $response.items) {
        $videoId = $item.id.videoId
        $title = $item.snippet.title
        $url = "https://www.youtube.com/watch?v=$videoId"
        $markdown += "| $title | [Watch]($url) | [$url]($url) |`n"
        Write-Host "  + $title" -ForegroundColor Yellow
    }
    
    $markdown += "`n---`n`n[Subscribe to YouTube](https://www.youtube.com/modbusmonitor){ .md-button target=`"_blank`" }`n"
    
    $markdown | Out-File -FilePath $OutputFile -Encoding UTF8 -Force
    
    Write-Host "`nSaved to: $OutputFile" -ForegroundColor Green
    Write-Host "`nPreview:`n" -ForegroundColor Cyan
    Write-Host $markdown
    
} catch {
    Write-Error "API Error: $($_.Exception.Message)"
    exit 1
}
