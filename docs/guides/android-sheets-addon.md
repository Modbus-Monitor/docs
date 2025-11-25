# Google Sheets Add-on for Modbus Monitor Advanced

**Real-time cloud spreadsheet logging for Android Modbus data**

![Google Sheets Integration](../assets/screenshots/android-advanced/mma-sheets-overview.webp){ .screenshot-center loading="lazy" }

!!! success "Quick Links"
    [:material-rocket-launch-outline: **Quick Start**](#quick-start-setup) | [:material-table: **Data Format**](#data-format) | [:material-frequently-asked-questions: **FAQ**](#frequently-asked-questions)

## Overview

The Google Sheets Add-on enables automatic real-time logging of Modbus data directly to Google Sheets. Perfect for data collection, reporting, team collaboration, and long-term archival with Excel-compatible exports.

**Key Features:**

- ✅ **Real-time Logging** - Automatic row append after each polling cycle
- ✅ **Cloud Storage** - Google Drive integration with unlimited retention
- ✅ **Team Collaboration** - Share spreadsheets with view/edit permissions
- ✅ **Excel Compatible** - Download as XLSX, CSV, PDF
- ✅ **Custom Formulas** - Use Google Sheets functions on live data
- ✅ **Charts & Pivot Tables** - Built-in visualization tools
- ✅ **Version History** - Track all changes with timestamps
- ✅ **Mobile & Desktop** - Access from any device

---

## Quick Start Setup

### Prerequisites

- Modbus Monitor Advanced installed
- Google Sheets Add-on purchased and activated
- Google account (free Gmail account works)
- Monitor points configured and polling

### Create Spreadsheet (3 Minutes)

1. **Open Google Sheets**
   - Visit [sheets.google.com](https://sheets.google.com)
   - Sign in with Google account

2. **Create New Spreadsheet**
   - Click "Blank" to create new sheet
   - **Name**: e.g., "Modbus Data Log - Factory Line 1"
   - Note the **Spreadsheet ID** from URL:
     ```
     https://docs.google.com/spreadsheets/d/SPREADSHEET_ID_HERE/edit
     ```

3. **Prepare First Sheet**
   - Rename "Sheet1" to a descriptive name (e.g., "Sensor Data")
   - Leave cells empty - app will auto-create headers

4. **Get Sharing Link**
   - Click "Share" button
   - Get shareable link (for reference only)

### App Configuration (5 Minutes)

1. **Enable Google Sheets in App**
   - Hamburger Menu → Settings → Google Sheets
   - Toggle "Enable Google Sheets" ON

2. **Authenticate Google Account**
   - Tap "Sign in with Google"
   - Select your Google account
   - Grant permissions:
     - ✓ View and manage spreadsheets
     - ✓ See your email address
   - App stores authentication token securely

3. **Enter Spreadsheet Details**
   - **Spreadsheet ID**: Paste from URL (just the ID part)
   - **Sheet Name**: Tab name (e.g., "Sensor Data", "Sheet1")

4. **Configure Logging Options**
   - **Append Mode**: New row for each cycle (recommended)
   - **Update Mode**: Overwrite last row (for dashboards)
   - **Include Timestamp**: Auto-add date/time column (recommended)

5. **Start Logging**
   - Start Client Mode polling
   - First cycle creates headers automatically
   - Subsequent cycles append data rows

**Verify Logging:**
- Open your Google Sheets spreadsheet
- Refresh page
- New rows should appear after each polling cycle

---

## Detailed Configuration

### App Settings

![Google Sheets Settings](../assets/screenshots/android-advanced/mma-sheets-settings.webp){ .screenshot-center loading="lazy" }

**Required Settings:**

| Setting | Description | Example | Notes |
|---------|-------------|---------|-------|
| **Spreadsheet ID** | Unique ID from Sheets URL | `1Abc2Def3Ghi4Jkl5Mno6Pqr` | Copy from browser address bar |
| **Sheet Name** | Tab name in spreadsheet | `Sensor Data` | Must match exactly (case-sensitive) |
| **Google Account** | Authenticated account email | `user@gmail.com` | Shown after sign-in |

**Optional Settings:**

| Setting | Description | Default | When to Use |
|---------|-------------|---------|-------------|
| **Include Timestamp** | Add date/time column | Enabled | For time-series logging |
| **Timestamp Format** | ISO 8601 or custom | `YYYY-MM-DD HH:MM:SS` | Adjust for locale |
| **Include Device ID** | Add device identifier column | Disabled | Multi-device logging |
| **Append Mode** | Insert new row each cycle | Enabled | Most common use case |
| **Update Mode** | Overwrite last row | Disabled | For live dashboards |

### Authentication

**First-Time Setup:**
1. Tap "Sign in with Google"
2. Browser opens with Google consent screen
3. Select account and grant permissions
4. Browser redirects back to app
5. "Authenticated as [email]" confirmation

**Token Management:**
- Token stored securely on device
- Auto-refreshes when expired
- Revoke via Google Account settings
- Re-authenticate if issues occur

**Permissions Required:**
- `spreadsheets`: Read and write to spreadsheets
- `drive.file`: Access spreadsheets created/opened by app
- `userinfo.email`: Display signed-in account

---

## Data Format

### Automatic Headers

**First Cycle Creates Headers:**

On the first data upload, the app automatically creates a header row:

| Timestamp | Device ID | Tank Level | Motor Speed | Temperature | Pressure |
|-----------|-----------|------------|-------------|-------------|----------|
| 2025-11-25 14:30:00 | android01 | 75.3 | 1450 | 68.2 | 101.3 |
| 2025-11-25 14:30:05 | android01 | 74.8 | 1448 | 68.4 | 101.2 |

**Header Format:**
- **Timestamp**: If enabled, first column
- **Device ID**: If enabled, second column
- **Monitor Point Names**: Remaining columns in order

### Data Types

**Column Data Types:**

| Monitor Point Data Type | Sheets Cell Format | Example |
|------------------------|-------------------|---------|
| **Integer (16-bit, 32-bit)** | Number | `1450` |
| **Float (32-bit, 64-bit)** | Number (2 decimals) | `75.30` |
| **Boolean** | TRUE/FALSE | `TRUE` |
| **String** | Text | `Running` |

**Timestamp Format:**
- **ISO 8601**: `2025-11-25T14:30:00Z` (UTC)
- **Local Time**: `2025-11-25 14:30:00` (device timezone)
- Google Sheets auto-detects as date/time

### Row Append Behavior

**Append Mode (Default):**
```
Cycle 1 → Row 2 (after header)
Cycle 2 → Row 3
Cycle 3 → Row 4
...
```

**Update Mode:**
```
Cycle 1 → Row 2
Cycle 2 → Row 2 (overwrite)
Cycle 3 → Row 2 (overwrite)
```

!!! tip "When to Use Update Mode"
    Update mode is ideal for live dashboards where you only need the latest value. For historical logging and analysis, use append mode (default).

---

## Spreadsheet Organization

### Single Sheet Layout

**Simple Time-Series Log:**
```
Sheet: Sensor Data
- Column A: Timestamp
- Column B-Z: Monitor point values
- New row every polling cycle
```

### Multi-Sheet Structure

**Organized by Category:**
```
Spreadsheet: Factory Monitoring
├─ Sheet: Line 1 Sensors
├─ Sheet: Line 2 Sensors
├─ Sheet: Power Meters
└─ Sheet: Summary Dashboard
```

**Configuration:**
- Use different sheet names for each Android device/location
- Point each app instance to its own sheet
- Create summary sheet with references

### Dashboard Sheet

**Live Status Board:**
```
Sheet: Dashboard (Update Mode)
- Column A: Parameter Name (static)
- Column B: Current Value (updated)
- Column C: Units (static)
- Column D: Status (formula: =IF(B2>100,"High","Normal"))
```

**Charts:**
- Insert → Chart
- Data range: `Sensor Data!A:Z`
- Chart type: Line, Column, Gauge
- Auto-updates as data appends

---

## Use Cases & Examples

### Industrial Data Logging

**Monitor Points:**
- Timestamp, Tank Level, Pressure, Flow Rate, Temperature

**Logging:**
- Append mode with 30-second intervals
- Long-term archival for compliance
- Weekly export to CSV for analysis

**Formulas:**
```
=AVERAGE(B2:B1000)  // Average tank level
=MAX(D:D)           // Peak flow rate
=COUNTIF(E:E,">80") // Temperature over 80°C
```

### Multi-Device Fleet

**Setup:**
- Each Android device logs to separate sheet
- Include Device ID column
- Master sheet with IMPORTRANGE

**Master Sheet Formula:**
```
=QUERY({
  IMPORTRANGE("ID1","Sheet1!A:F");
  IMPORTRANGE("ID2","Sheet1!A:F");
  IMPORTRANGE("ID3","Sheet1!A:F")
}, "SELECT * ORDER BY Col1 DESC")
```

### Shift Reports

**Configuration:**
- Append mode with 5-minute intervals
- Timestamp column enabled
- Units in monitor point names

**Daily Summary:**
```
=QUERY(A:F, "SELECT A, AVG(B), MAX(C), MIN(D) 
WHERE A >= date '"&TEXT(TODAY(),"yyyy-mm-dd")&"' 
GROUP BY A")
```

### Quality Control

**Monitor Points:**
- Production count, Defect count, Cycle time

**Calculated Columns:**
```
Column F: =IF(D2>0, B2/D2, 0)  // Defect rate
Column G: =IF(C2<60, "Pass", "Fail")  // Cycle time check
```

**Conditional Formatting:**
- Red if defect rate > 5%
- Green if cycle time < 50s

---

## Advanced Features

### Google Sheets Formulas

**Real-time Calculations:**
```
// Running average of last 100 rows
=AVERAGE(INDIRECT("B"&MAX(2,ROW()-100)&":B"&ROW()))

// Count values above threshold today
=COUNTIFS(A:A,">="&TODAY(), C:C,">100")

// Conditional sum by device
=SUMIF(B:B,"android01",D:D)
```

### Pivot Tables

**Summarize Data:**
1. Data → Pivot table
2. Rows: Date (group by day)
3. Values: Average(Tank Level), Max(Pressure)
4. Filters: Device ID

### Charts & Graphs

**Time Series Chart:**
1. Select data range: `A1:F1000`
2. Insert → Chart → Line chart
3. X-axis: Timestamp
4. Y-axis: Multiple monitor points
5. Enable "Aggregate" for smooth lines

**Gauge Dashboard:**
1. Insert → Chart → Gauge chart
2. Data range: Last row only
3. Set min/max/threshold colors
4. Update mode keeps gauge live

### Sharing & Permissions

**Collaboration:**
- Share → Add email addresses
- **Viewer**: Read-only access
- **Commenter**: Can add comments
- **Editor**: Can modify data

**Public Link:**
- Share → Get link → Anyone with link
- Useful for public dashboards
- Viewers can't see authentication

### Apps Script Automation

**Auto-Export to PDF:**
```javascript
function dailyExport() {
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getSheetByName("Sensor Data");
  var pdf = sheet.getAs('application/pdf');
  
  GmailApp.sendEmail(
    "report@example.com",
    "Daily Sensor Report",
    "Attached is today's data",
    {attachments: [pdf]}
  );
}
```

**Trigger:** Daily at 11pm

---

## Troubleshooting

### Common Issues

| Problem | Cause | Solution |
|---------|-------|----------|
| **Authentication Failed** | Expired token | Re-authenticate via Settings → Google Sheets |
| **Spreadsheet Not Found** | Wrong ID or no access | Verify ID; check sharing permissions |
| **Sheet Not Found** | Typo in sheet name | Ensure exact match (case-sensitive) |
| **No Rows Appended** | Google Sheets disabled | Enable toggle in Settings |
| **Duplicate Headers** | Re-starting without clearing | Manually delete duplicate header rows |
| **Rate Limit Error** | Too many rapid writes | Increase polling interval to ≥5s |

### Testing Upload

**Manual Test:**
1. Configure spreadsheet with valid ID
2. Start Client Mode with 1-2 monitor points
3. Wait for one polling cycle
4. Refresh Google Sheets in browser
5. Verify new row with timestamp

**Check Upload Status:**
- Settings → Google Sheets → Last Upload Status
- Shows success/failure and timestamp
- Error messages if upload fails

### Quota Limits

**Google Sheets API Limits:**
- **Free tier**: 300 write requests per minute per project
- **Typical impact**: ~5s minimum between updates safe
- **Exceeding**: Temporary throttle, resume after cooldown

**Mitigation:**
- Increase polling interval (30-60s recommended)
- Use batch mode if available
- Avoid multiple devices writing to same sheet rapidly

---

## Frequently Asked Questions

??? question "How many monitor points can I log?"
    Google Sheets supports up to **18,278 columns** per sheet. Practically, keep under 50 monitor points per sheet for performance. For more data, use multiple sheets or consider MQTT add-on.

??? question "How often can I update the spreadsheet?"
    **Recommended minimum: 5 seconds** between updates to respect API rate limits. For industrial logging, 30-60 second intervals are typical and efficient.

??? question "Can I log to multiple spreadsheets?"
    No, each Android device logs to one spreadsheet. To aggregate multiple devices, use separate sheets in one spreadsheet or use IMPORTRANGE formulas to combine data.

??? question "Does Google Sheets work offline?"
    No, internet connection required to upload data. For offline logging, use local CSV export, then manually import to Sheets later.

??? question "Can I use Google Sheets with Sensor Server mode?"
    Yes! Android sensor values (accelerometer, gyro, etc.) are logged just like Modbus monitor points, with sensor names as column headers.

??? question "How do I export historical data?"
    File → Download → Microsoft Excel (.xlsx) or CSV. Alternatively, use QUERY or FILTER functions to export specific date ranges.

??? question "What happens if the spreadsheet is deleted?"
    Logging fails and errors appear in Settings. Create a new spreadsheet and update the Spreadsheet ID in app settings.

??? question "Can I share the spreadsheet without giving app access?"
    Yes. Share the spreadsheet normally via Google Sheets sharing. The app uses your authentication, not per-viewer permissions.

---

## Best Practices

**Spreadsheet Organization:**
- One sheet per device or location
- Descriptive sheet names (avoid generic "Sheet1")
- Include timestamp and device ID columns
- Archive old data periodically to new sheets

**Performance:**
- Keep active sheets under 100,000 rows
- Use separate sheets for historical data
- Avoid complex formulas in large datasets
- Consider monthly or yearly sheet rotation

**Data Management:**
- Export and archive data quarterly
- Use freeze rows/columns for headers
- Apply conditional formatting for alerts
- Document formulas and data sources

**Security:**
- Share with specific emails, not "anyone with link"
- Use Viewer permissions for non-editors
- Revoke app access if device is lost
- Regularly review Google Account permissions

---

## Additional Resources

- **Google Sheets Help**: [support.google.com/docs/topic/9054603](https://support.google.com/docs/topic/9054603)
- **Apps Script Docs**: [developers.google.com/apps-script](https://developers.google.com/apps-script)
- **API Reference**: [developers.google.com/sheets/api](https://developers.google.com/sheets/api)

**Need Help?** Contact [support@quantumbitsolutions.com](mailto:support@quantumbitsolutions.com)

---

[:octicons-arrow-left-24: Back to Advanced Guide](../products/android/advanced-guide.md#add-ons-integration)
