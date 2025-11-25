# Fix emoji encoding in advanced-guide.md
$file = 'docs\products\android\advanced-guide.md'
$encoding = [System.Text.UTF8Encoding]::new($false)

# Read with UTF8 BOM detection
$content = [System.IO.File]::ReadAllText($file, [System.Text.UTF8Encoding]::new($true))

# Replace mojibake patterns with proper emojis
$content = $content.Replace('ðŸ"Š', '📊')
$content = $content.Replace('ðŸ"¡', '📡')  
$content = $content.Replace('˜¸', '☁️')
$content = $content.Replace('â˜¸', '☁️')

# Write without BOM
[System.IO.File]::WriteAllText($file, $content, $encoding)

Write-Host "Fixed emoji encoding in $file" -ForegroundColor Green
