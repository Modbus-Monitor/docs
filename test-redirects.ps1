# Test All Redirects - PowerShell Script
# This script tests all 18 redirects to ensure they're working correctly

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Testing Cloudflare Redirects" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Define all redirects to test
$redirects = @(
    @{Old = "https://quantumbitsolutions.com/help/"; New = "https://docs.quantumbitsolutions.com/support/"; Name = "Main Help Page"},
    @{Old = "https://quantumbitsolutions.com/guide/"; New = "https://docs.quantumbitsolutions.com/products/android/advanced-guide/"; Name = "Android Advanced Guide"},
    @{Old = "https://quantumbitsolutions.com/sniff-help/"; New = "https://docs.quantumbitsolutions.com/products/mapper/user-manual/"; Name = "Mapper User Manual"},
    @{Old = "https://quantumbitsolutions.com/xpf-help/"; New = "https://docs.quantumbitsolutions.com/products/xpf/user-guide/"; Name = "XPF User Guide"},
    @{Old = "https://quantumbitsolutions.com/modbus-mapper-pro-quick-start-demo/"; New = "https://docs.quantumbitsolutions.com/products/mapper/quick-start/"; Name = "Mapper Quick Start"},
    @{Old = "https://quantumbitsolutions.com/mmhelp/"; New = "https://docs.quantumbitsolutions.com/products/android/free-guide/"; Name = "Android Free Guide"},
    @{Old = "https://quantumbitsolutions.com/arduino-modbus-server/"; New = "https://docs.quantumbitsolutions.com/technical/server-setup/"; Name = "Arduino Server"},
    @{Old = "https://quantumbitsolutions.com/sheets/"; New = "https://docs.quantumbitsolutions.com/guides/android-sheets-addon/"; Name = "Sheets Integration"},
    @{Old = "https://quantumbitsolutions.com/hardware/"; New = "https://docs.quantumbitsolutions.com/technical/hardware/"; Name = "Hardware Setup"},
    @{Old = "https://quantumbitsolutions.com/address/"; New = "https://docs.quantumbitsolutions.com/guides/6-digit-addressing/"; Name = "6-Digit Addressing"},
    @{Old = "https://quantumbitsolutions.com/bluetooth/"; New = "https://docs.quantumbitsolutions.com/guides/android-hardware/"; Name = "Bluetooth Guide"},
    @{Old = "https://quantumbitsolutions.com/faq/"; New = "https://docs.quantumbitsolutions.com/support/faq/"; Name = "FAQ"},
    @{Old = "https://quantumbitsolutions.com/importexport/"; New = "https://docs.quantumbitsolutions.com/technical/import-export/"; Name = "Import/Export"},
    @{Old = "https://quantumbitsolutions.com/errors/"; New = "https://docs.quantumbitsolutions.com/technical/error-codes/"; Name = "Error Codes"},
    @{Old = "https://quantumbitsolutions.com/server/"; New = "https://docs.quantumbitsolutions.com/technical/server-setup/"; Name = "Modbus Server"},
    @{Old = "https://quantumbitsolutions.com/sensor-1/"; New = "https://docs.quantumbitsolutions.com/technical/server-setup/"; Name = "Sensor Server"},
    @{Old = "https://quantumbitsolutions.com/serialport/"; New = "https://docs.quantumbitsolutions.com/technical/serial-ports/"; Name = "Serial Ports"},
    @{Old = "https://quantumbitsolutions.com/help-test/"; New = "https://docs.quantumbitsolutions.com/support/"; Name = "Help Test Page"}
)

$passed = 0
$failed = 0
$failedUrls = @()

foreach ($redirect in $redirects) {
    Write-Host "Testing: " -NoNewline
    Write-Host $redirect.Name -ForegroundColor Yellow
    Write-Host "  Old: $($redirect.Old)" -ForegroundColor Gray
    
    try {
        $response = Invoke-WebRequest -Uri $redirect.Old -Method Head -MaximumRedirection 0 -UseBasicParsing -ErrorAction Stop
    }
    catch {
        $response = $_.Exception.Response
    }
    
    $statusCode = [int]$response.StatusCode
    $location = $response.Headers.Location
    
    if ($statusCode -eq 301 -and $location -eq $redirect.New) {
        Write-Host "  ✓ PASS" -ForegroundColor Green
        Write-Host "  Status: 301 | Target: $location" -ForegroundColor Gray
        $passed++
    }
    elseif ($statusCode -eq 301) {
        Write-Host "  ✗ FAIL - Wrong Target" -ForegroundColor Red
        Write-Host "  Status: 301 | Target: $location" -ForegroundColor Gray
        Write-Host "  Expected: $($redirect.New)" -ForegroundColor Gray
        $failed++
        $failedUrls += $redirect.Old
    }
    else {
        Write-Host "  ✗ FAIL - Wrong Status Code" -ForegroundColor Red
        Write-Host "  Status: $statusCode | Target: $location" -ForegroundColor Gray
        $failed++
        $failedUrls += $redirect.Old
    }
    
    Write-Host ""
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Test Results" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Total: $($redirects.Count) | " -NoNewline
Write-Host "Passed: $passed | " -NoNewline -ForegroundColor Green
Write-Host "Failed: $failed" -ForegroundColor $(if ($failed -eq 0) { "Green" } else { "Red" })

if ($failed -gt 0) {
    Write-Host ""
    Write-Host "Failed URLs:" -ForegroundColor Red
    foreach ($url in $failedUrls) {
        Write-Host "  - $url" -ForegroundColor Red
    }
}
else {
    Write-Host ""
    Write-Host "🎉 All redirects are working perfectly!" -ForegroundColor Green
    Write-Host "Your migration is ready to go!" -ForegroundColor Green
}

Write-Host ""
Write-Host "Note: If redirects are failing, wait 1-2 minutes for Cloudflare propagation" -ForegroundColor Yellow
Write-Host "and run this script again." -ForegroundColor Yellow
