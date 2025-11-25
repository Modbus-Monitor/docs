# ThingSpeak Add-on for Modbus Monitor Advanced

**IoT analytics and visualization platform integration for Android Modbus data**

![ThingSpeak Integration](../assets/screenshots/android-advanced/mma-thingspeak-overview.webp){ .screenshot-center loading="lazy" }

!!! success "Quick Links"
    [:material-rocket-launch-outline: **Quick Start**](#quick-start-setup) | [:material-chart-line: **Visualization**](#data-visualization) | [:material-frequently-asked-questions: **FAQ**](#frequently-asked-questions)

## Overview

The ThingSpeak Add-on enables automatic cloud logging and visualization of Modbus data from your Android device. ThingSpeak provides instant charts, MATLAB analytics, real-time alerts, and data export capabilities.

**Key Features:**

- ✅ **Instant Visualization** - Auto-generated charts for up to 8 data channels
- ✅ **Cloud Storage** - Free public channels, paid private channels
- ✅ **MATLAB Analytics** - Run analysis scripts on collected data
- ✅ **Real-time Alerts** - Email/SMS notifications based on thresholds
- ✅ **Public Sharing** - Embed charts on websites or share view links
- ✅ **Data Export** - CSV, JSON, XML download for offline analysis

---

## Quick Start Setup

### Prerequisites

- Modbus Monitor Advanced installed
- ThingSpeak Add-on purchased and activated
- ThingSpeak account (free at [thingspeak.com](https://thingspeak.com))
- Channel created with API key

### Create ThingSpeak Channel

1. **Sign up at ThingSpeak**
   - Visit [thingspeak.com](https://thingspeak.com) → Sign Up (free)

2. **Create New Channel**
   - Channels → New Channel
   - **Name**: e.g., "Factory Modbus Monitor"
   - **Description**: "Real-time Modbus data from Android"

3. **Configure Fields** (up to 8)
   - Field 1: `Tank Level` (units: Liters)
   - Field 2: `Motor Speed` (units: RPM)
   - Field 3: `Temperature` (units: °C)
   - Field 4-8: Additional monitor points

4. **Save and Get API Key**
   - API Keys tab → Copy **Write API Key**
   - Example: `ABCDEFG1234567890`

### App Configuration (5 Minutes)

1. **Enable ThingSpeak in App**
   - Hamburger Menu → Settings → ThingSpeak
   - Toggle "Enable ThingSpeak" ON

2. **Enter Channel Details**
   - **Write API Key**: Paste from ThingSpeak
   - **Channel ID**: Found in ThingSpeak channel details

3. **Set Update Interval**
   - **Minimum 15 seconds** (ThingSpeak free tier limit)
   - Recommended: 30-60 seconds for stable logging

4. **Map Monitor Points to Fields**
   - Monitor points are mapped in order:
     - 1st point → Field 1
     - 2nd point → Field 2
     - etc. (up to 8 points max)

5. **Start Logging**
   - Start Client Mode polling
   - Data uploads automatically after each cycle

**Verify Logging:**
- Open your ThingSpeak channel
- Go to "Private View" or "Public View" tab
- Charts should update every interval

---

## Detailed Configuration

### App Settings

![ThingSpeak Settings](../assets/screenshots/android-advanced/mma-thingspeak-settings.webp){ .screenshot-center loading="lazy" }

**Required Settings:**

| Setting | Description | Example | Notes |
|---------|-------------|---------|-------|
| **Write API Key** | ThingSpeak channel write key | `ABCDEFG1234567890` | Found in ThingSpeak → API Keys |
| **Channel ID** | ThingSpeak channel number | `123456` | Found in channel URL or details |
| **Update Interval** | Seconds between uploads | `30` | Min 15s for free tier, 1s for paid |

**Optional Settings:**

| Setting | Description | Default | When to Change |
|---------|-------------|---------|----------------|
| **Enable Status Updates** | Upload Android status fields | Disabled | Enable for debugging connectivity |
| **Latitude/Longitude** | GPS location in status | Empty | Enable for field location tracking |
| **Elevation** | Altitude in meters | Empty | Enable for elevation-dependent data |

### Field Mapping

**Automatic Sequential Mapping:**

Monitor points are uploaded in the order they appear in your list:

```
Monitor Point 1: "Tank Level"     → ThingSpeak Field 1
Monitor Point 2: "Motor Speed"    → ThingSpeak Field 2
Monitor Point 3: "Temperature"    → ThingSpeak Field 3
Monitor Point 4: "Pressure"       → ThingSpeak Field 4
...
Monitor Point 8: "Flow Rate"      → ThingSpeak Field 8
```

!!! warning "8-Field Limit"
    ThingSpeak channels support a maximum of 8 data fields. If you have more than 8 monitor points, only the first 8 will be uploaded. For >8 points, create multiple channels or use MQTT/Google Sheets add-ons.

**Reordering Points:**
- Drag to reorder monitor points in the app
- New order takes effect on next upload
- Field names in ThingSpeak should match new order

---

## Data Visualization

### ThingSpeak Dashboard

![ThingSpeak Charts](../assets/screenshots/android-advanced/mma-thingspeak-charts.webp){ .screenshot-center loading="lazy" }

**Built-in Visualizations:**

- **Line Charts**: Time-series trends for each field
- **Numeric Displays**: Current value widgets
- **Gauge Widgets**: Real-time analog displays
- **Custom Layouts**: Drag-and-drop dashboard builder

**Accessing Charts:**
1. ThingSpeak → Channels → Your Channel
2. **Private View**: Full dashboard with all features
3. **Public View**: Shareable view (if public channel)

### Chart Customization

**Field Chart Options:**
- **Time Range**: Last hour, day, week, month, custom
- **Aggregation**: Raw, Average, Median, Sum
- **Y-Axis**: Auto-scale, fixed range, log scale
- **Color**: Change line colors per field

**Adding Widgets:**
1. Click "Add Widgets" button
2. Choose widget type:
   - **Numeric Display** - Latest value
   - **Gauge** - Analog dial display
   - **Chart** - Time series line chart
3. Select field and configure appearance

### Public Sharing

**Make Channel Public:**
1. Channel Settings → Sharing
2. Select "Share channel view with everyone"
3. Copy public channel URL

**Embed in Website:**
```html
<iframe width="450" height="260" style="border: 1px solid #cccccc;" 
src="https://thingspeak.com/channels/123456/charts/1?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15">
</iframe>
```

---

## MATLAB Analytics

### Running Analysis Scripts

![ThingSpeak MATLAB](../assets/screenshots/android-advanced/mma-thingspeak-matlab.webp){ .screenshot-center loading="lazy" }

**ThingSpeak MATLAB Analytics** enables automated analysis:

**Example - Temperature Average:**
```matlab
% Read last 100 temperature values
data = thingSpeakRead(channelID, 'Fields', 3, 'NumPoints', 100);

% Calculate average
avgTemp = mean(data);

% Display result
disp(['Average Temperature: ' num2str(avgTemp) ' °C']);
```

**Example - Threshold Alert:**
```matlab
% Read latest tank level
level = thingSpeakRead(channelID, 'Fields', 1, 'NumPoints', 1);

% Send alert if below threshold
if level < 20
    sendEmail('alert@example.com', 'Low Tank Alert', ['Tank level: ' num2str(level)]);
end
```

**Schedule Scripts:**
- Apps → MATLAB Analysis → New → TimeControl
- Run every: 15 minutes, hourly, daily
- Execute custom analysis automatically

---

## Alerts & Notifications

### React App - Threshold Alerts

**Setup Alert:**
1. Apps → React → New
2. **Condition Type**: Numeric threshold
3. **Test Frequency**: How often to check (min 15s)
4. **Condition**: 
   - Field: Select field
   - Operator: `<`, `>`, `==`, etc.
   - Value: Threshold value
5. **Action**: Email, Tweet, ThingHTTP webhook
6. **Run**: Test and enable

**Example Alert:**
```
Name: Low Tank Alert
Condition: Field 1 (Tank Level) < 20
Action: Email to alerts@example.com
Frequency: Every 5 minutes
```

### Email Notifications

**Configure in Alert:**
- **Subject**: "Tank Level Alert"
- **Body**: "Tank level is below threshold: %%channel_123456_field_1%%"
- **Recipients**: Multiple emails comma-separated

---

## Use Cases & Examples

### Factory Production Monitor

**Monitor Points:**
- Field 1: Production line speed (units/min)
- Field 2: Defect rate (%)
- Field 3: Temperature (°C)
- Field 4: Power consumption (kW)

**MATLAB Analysis**: Calculate OEE (Overall Equipment Effectiveness)

**Alert**: Notify supervisor if defect rate > 5%

### Environmental Monitoring

**Monitor Points:**
- Field 1: Indoor temperature
- Field 2: Outdoor temperature
- Field 3: Humidity
- Field 4: CO2 level

**Public Dashboard**: Share data with building management

**Alert**: Email if CO2 > 1000 ppm

### Remote Asset Tracking

**Monitor Points:**
- Field 1: Tank level (%)
- Field 2: Battery voltage (V)
- Field 3: GPS latitude
- Field 4: GPS longitude
- Field 5: Signal strength

**Geolocation**: Plot device location on map

**Alert**: Low battery warning

---

## Troubleshooting

### Common Issues

| Problem | Cause | Solution |
|---------|-------|----------|
| **No Data Uploaded** | Wrong API key | Verify Write API Key from ThingSpeak |
| **Rate Limit Error** | Update interval too fast | Increase interval to ≥15s (free tier) |
| **Missing Fields** | More than 8 points configured | Only first 8 points upload; remove extras |
| **Charts Not Updating** | ThingSpeak service delay | Charts update every 15s; wait and refresh |
| **Invalid Channel** | Wrong Channel ID | Confirm ID matches ThingSpeak channel |

### Testing Upload

**Manual Test:**
1. Enable ThingSpeak in app
2. Start Client Mode with 1-2 monitor points
3. Wait for one polling cycle
4. Check ThingSpeak channel "Private View"
5. Verify latest entry timestamp is recent

**Check Upload Status:**
- Settings → ThingSpeak → Last Upload Status
- Shows success/failure timestamp
- Error messages if upload fails

---

## Frequently Asked Questions

??? question "How many monitor points can I upload?"
    ThingSpeak channels support up to **8 data fields**. The first 8 monitor points in your list will be uploaded. For more data, create multiple channels or use MQTT/Google Sheets add-ons.

??? question "What's the fastest update interval?"
    - **Free tier**: Minimum 15 seconds between updates
    - **Paid licenses**: Down to 1 second
    - Recommended: 30-60s for industrial data logging

??? question "Can I use ThingSpeak offline?"
    No, ThingSpeak requires internet connection to upload data. For offline logging, use the app's local CSV export feature, then upload later.

??? question "Does ThingSpeak work with Sensor Server mode?"
    Yes! Android sensor values (accelerometer, gyro, etc.) are uploaded just like Modbus monitor points. Map sensor fields to ThingSpeak fields in order.

??? question "How do I export data from ThingSpeak?"
    Channel → Data Import/Export → Export → Select format (CSV, JSON, XML) → Date range → Download

??? question "Can I share my channel publicly without API key exposure?"
    Yes. Set channel to "Public" in Sharing settings. The public URL shows read-only charts without exposing write API key.

??? question "What happens if I exceed 8 monitor points?"
    Only the first 8 points upload. Excess points are ignored. Reorder points to prioritize which 8 to log.

---

## Best Practices

**Channel Organization:**
- Create one channel per device or location
- Use descriptive field names matching monitor point names
- Add field units (L, RPM, °C) for clarity

**Update Intervals:**
- Industrial processes: 30-60 seconds
- Environmental: 5-15 minutes
- High-speed data: Use MQTT add-on instead

**Data Management:**
- Export and archive data monthly for long-term storage
- Free tier stores 3 months of data
- Use MATLAB for automated backups

**Security:**
- Keep Write API Key private
- Use Read API Key for public dashboards
- Regenerate keys if compromised

---

## Additional Resources

- **ThingSpeak Docs**: [thingspeak.com/docs](https://thingspeak.com/docs)
- **MATLAB Support**: [mathworks.com/thingspeak](https://www.mathworks.com/help/thingspeak/)
- **Community**: [community.thingspeak.com](https://community.thingspeak.com/)

**Need Help?** Contact [support@quantumbitsolutions.com](mailto:support@quantumbitsolutions.com)

---

[:octicons-arrow-left-24: Back to Advanced Guide](../products/android/advanced-guide.md#add-ons-integration)
