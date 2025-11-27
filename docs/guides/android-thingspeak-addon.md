!!! note "Navigation"
    **📚 [Documentation Home](../index.md) → [Guides](index.md) → ThingSpeak for Android**

# ThingSpeak Add-on for Android

**Mobile IoT data logging to ThingSpeak. Cloud charts, MATLAB analytics, real-time alerts.**

![ThingSpeak Integration](../assets/screenshots/android-advanced/mma-thingspeak-overview.webp){ .screenshot-center loading="lazy" }

⬆️ **New to ThingSpeak?** [← See Overview Guide](thingspeak-overview.md) for platform-agnostic concepts, use cases, initial setup, and FAQ.

---

## Quick Start (5 Minutes)

### Prerequisites

- ✅ Modbus Monitor Advanced installed  
- ✅ ThingSpeak Add-on purchased  
- ⬆️ Review the ThingSpeak Initial Setup Guide. See the [Overview Guide](thingspeak-overview.md) for platform-agnostic concepts, use cases, initial setup, and FAQs.

### Step 1: Create ThingSpeak Channel

1. Go to [thingspeak.com](https://thingspeak.com) → Sign up (free)
2. **Channels** → **New Channel**
3. **Name**: "Modbus Monitor" (or your project name)
4. **Create 8 Fields**:
   - Field 1: Tank Level
   - Field 2: Motor Speed
   - Field 3: Temperature
   - (Add more as needed)
5. **Save Channel**
6. **API Keys** tab → Copy **Write API Key**

### Step 2: Enable ThingSpeak in App

1. **Hamburger Menu** → **Settings** → **ThingSpeak**
2. Toggle **Enable ThingSpeak** ON
3. Enter:
   - **Write API Key**: Paste from ThingSpeak
   - **Channel ID**: Found in ThingSpeak channel URL or details
   - **Update Interval**: 30 seconds (min 15s for free tier)
4. Tap **Save**

### Step 3: Start Logging

1. Return to main screen
2. Tap **Link icon** to start Client Mode
3. App automatically uploads data every interval
4. Open your ThingSpeak channel to see charts update

**Done!** Your Modbus data is now logging to the cloud.

---

## Android Configuration

### App Settings

![ThingSpeak Settings](../assets/screenshots/android-advanced/mma-thingspeak-settings.webp){ .screenshot-center loading="lazy" }

**Required Fields:**

| Field | Value | Notes |
|-------|-------|-------|
| **Write API Key** | `ABCDEFG1234567890` | Copy from ThingSpeak → API Keys |
| **Channel ID** | `123456` | Your ThingSpeak channel number |
| **Update Interval** | `30` seconds | Minimum 15s (free tier), can be 1s (paid) |

**Optional Fields:**

| Field | Purpose |
|-------|---------|
| **Enable Status Updates** | Include Android app status/GPS |
| **Latitude/Longitude** | Geolocation tracking |
| **Elevation** | Altitude data |

### Monitor Point Mapping

Monitor points automatically map to ThingSpeak fields **in order**:

```
Your App List:          ThingSpeak:
1. Tank Level     →     Field 1
2. Motor Speed    →     Field 2
3. Temperature    →     Field 3
...
8. Flow Rate      →     Field 8
```

**⚠️ Limit**: Only 8 fields supported (first 8 monitor points upload)

**To change what uploads:**
- Reorder monitor points in your app
- Changes take effect next upload cycle

---

## Android-Specific Features

### Mobile Polling

**Start/Stop Logging:**
- Tap **Link icon** (play) to start polling
- Tap **Link icon** (stop) to halt
- Data uploads automatically after each poll cycle

**Polling Interval:**
- Configure in **Settings** → **Timing** → **Poll Interval**
- Example: 1000ms = data uploads every second
- ThingSpeak accepts minimum 15 seconds

**Battery Impact:**
- Frequent polling drains battery
- Recommended: 30-60 second intervals on battery
- Use USB power for continuous monitoring

### Background Monitoring

**Keep App Running:**
- Modbus Monitor continues uploading while app is in background
- Disable sleep timeout to keep device awake
- Or configure via Android Settings

**Network Requirements:**
- WiFi or mobile data connection required
- App pauses uploads when offline
- Resumes when connection returns

### Sensor Integration

**Android Sensors + Modbus Data:**

If using Sensor Server mode, sensor data also uploads:

```
Monitor Points:        ThingSpeak Fields:
Modbus value 1    →    Field 1
Modbus value 2    →    Field 2
Accelerometer X   →    Field 3
Gyro Y            →    Field 4
```

Use this for equipment + environmental monitoring.

---

## Verification & Testing

### Manual Verification

1. **Enable ThingSpeak** in app settings
2. **Create simple test**: 1-2 monitor points
3. **Start Client Mode** and run 1 polling cycle
4. **Check ThingSpeak**:
   - Open channel → Private View
   - Look for recent data point timestamp
   - Verify values match your Modbus data

### Troubleshooting

| Issue | Check |
|-------|-------|
| **No data uploaded** | Is Write API Key correct? Is internet connected? |
| **Rate limit error** | Increase update interval to ≥15 seconds |
| **Missing fields** | Only first 8 monitor points upload (max 8 fields) |
| **Wrong values** | Are monitor points reading correct Modbus addresses? |
| **No update timestamp** | Has polling cycle completed? Check interval ≥ 1 cycle |

---

## Common Tasks

**How do I view my data?**  
Open ThingSpeak → Your Channel → Private View (or Public View if shared)

**Can I make my data public?**  
Yes: Channel Settings → Sharing → "Share channel view with everyone"

**How do I export data?**  
ThingSpeak → Data Import/Export → Choose format (CSV, JSON, XML) → Download

**How many days of data does ThingSpeak keep?**  
Free tier: 3 months of history (rollover after 3 months)

**Can I see alerts?**  
Yes: Set up React Apps in ThingSpeak for email/SMS on threshold breach

---

## Cross-Platform Reference

| Feature | Android | Windows |
|---------|---------|---------|
| **Basic Setup** | [← You are here] | [Windows Setup](thingspeak-addon.md) |
| **ThingSpeak Concepts** | [Overview Guide](thingspeak-overview.md) | [Overview Guide](thingspeak-overview.md) |
| **MATLAB Integration** | Supported | Supported |
| **Max Fields** | 8 | 8 |
| **Min Update Interval** | 15s (free) | 15s (free) |

---

## FAQ

??? question "What if I have more than 8 monitor points?"
    ThingSpeak supports 8 fields max. Only the first 8 points upload. For more data:
    - Create multiple channels
    - Use MQTT or Google Sheets add-ons
    - Upgrade ThingSpeak plan

??? question "Does it work offline?"
    No—ThingSpeak requires internet. The app stores data locally, but you must upload later.

??? question "What's the battery impact?"
    Frequent uploads consume power. For battery devices, use 30-60 second intervals or connect USB power.

??? question "Can I change field mapping?"
    No automatic mapping. Fields are assigned by monitor point order. Reorder points to change mapping.

??? question "Does Android Sensor Server work?"
    Yes! Sensor values upload alongside Modbus data as long as you have free ThingSpeak fields.

??? question "Can I see real-time notifications?"
    Yes. Set up React Apps in ThingSpeak for email/SMS alerts when data exceeds thresholds.

---

## Resources

- **ThingSpeak Docs**: [thingspeak.com/docs](https://thingspeak.com/docs)
- **MATLAB Integration**: [mathworks.com/thingspeak](https://www.mathworks.com/help/thingspeak/)
- **Community**: [community.thingspeak.com](https://community.thingspeak.com/)
- **Support**: [support@quantumbitsolutions.com](mailto:support@quantumbitsolutions.com)

---

[:octicons-arrow-left-24: Back to Advanced Guide](../products/android/advanced-guide.md#add-ons-integration)
