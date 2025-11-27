!!! note "Navigation"
    **📚 [Documentation Home](../index.md) → [Guides](index.md) → ThingSpeak for Android**

# ThingSpeak Add-on for Android

**Mobile IoT data logging to ThingSpeak. Cloud charts, MATLAB analytics, real-time alerts.**

![ThingSpeak Integration](../assets/screenshots/android-advanced/mma-thingspeak-overview.webp){ .screenshot-center loading="lazy" }

⬆️ **New to ThingSpeak?** [← See Overview Guide](thingspeak-overview.md) for platform-agnostic concepts, use cases, initial setup, and FAQ.

---

## Quick Start (5 Minutes)
A fast, practical guide to get Android uploading data to ThingSpeak with minimal setup. Ideal for first-time users.

### Prerequisites
Everything your Android device and account must have before enabling ThingSpeak integration.

- ✅ Modbus Monitor Advanced installed  
- ✅ ThingSpeak Add-on purchased  
- ✅ **ThingSpeak channel created** - [Overview Guide](thingspeak-overview.md#getting-started-all-platforms) for detailed channel creation and field setup instructions

### Step 1: Enable ThingSpeak in App
Turn on the integration and enter your authentication keys so the app can communicate with the ThingSpeak API and automatically send data after each polling cycle. See the [Modbus Monitor Advanced Guide](../products/android/advanced-guide.md) to adjust polling intervals and timing settings.

1. Open **Hamburger Menu** → **Settings** → **ThingSpeak**
2. Toggle **Enable ThingSpeak** ON
3. Enter **Write API Key**: Paste from ThingSpeak channel. [See Overview Guide, Steps 1–2](thingspeak-overview.md#getting-started-all-platforms).


![Android ThingSpeak Setup](../assets/screenshots/android-advanced/mma-thingspeak-setup.webp){ .screenshot-center loading="lazy" }


### Step 2: Start Logging
Begin polling your Modbus device and watch values stream into ThingSpeak automatically.

1. Return to main screen
2. Tap **Link icon** to start Client Mode
3. App automatically uploads data every interval
4. Open your ThingSpeak channel to see charts update

**Done!** Your Modbus data is now logging to the cloud.

---

## Android Configuration
Detailed explanation of each ThingSpeak setting inside the Android app and how they affect data uploads.

### App Configuration

**Required Setting:**

| Field | Value | Purpose |
|-------|-------|---------|
| **Write API Key** | `ABCDEFG1234567890` | Copy from ThingSpeak → API Keys tab |

**Optional Settings:**

| Field | Purpose |
|-------|---------|
| **Use ThingSpeak** | Toggle On/Off to enable/disable automatic data uploads |
| **Write Sample Data** | Send test data to verify your API key works |


### Monitor Point Mapping

Monitor points from your Modbus configuration automatically map to ThingSpeak Fields 1–8 **in the order they appear in your app**.

**Automatic Mapping:**

```
Your Monitor Points:    ThingSpeak Channel:
1. Tank Level      →    Field 1
2. Motor Speed     →    Field 2
3. Temperature     →    Field 3
4. Pressure        →    Field 4
5. Flow Rate       →    Field 5
6. Humidity        →    Field 6
7. Voltage         →    Field 7
8. Current         →    Field 8
```

**⚠️ Important Limits:**
- Maximum 8 fields per ThingSpeak channel
- Only the first 8 monitor points upload
- Additional monitor points are ignored

**To change what uploads:**
- Reorder your monitor points in the app
- The new order takes effect on the next upload cycle
- Fields in ThingSpeak will update with the reordered data

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
Feature comparison between Android and Windows versions of the ThingSpeak Add-on.

| Feature | Android | Windows |
|---------|---------|---------|
| **Basic Setup** | [← You are here] | [Windows Setup](thingspeak-addon.md) |
| **ThingSpeak Concepts** | [Overview Guide](thingspeak-overview.md) | [Overview Guide](thingspeak-overview.md) |
| **MATLAB Integration** | Supported | Supported |
| **Max Fields** | 8 | 8 |
| **Min Update Interval** | 15s (free) | 15s (free) |

---

## FAQ
Short answers to practical, real-world questions—rate limits, mapping, offline use, sensors, and alerts.

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
Official links for further reading, MATLAB integration, community help, and support.

- **ThingSpeak Docs**: [thingspeak.com/docs](https://thingspeak.com/docs)
- **MATLAB Integration**: [mathworks.com/thingspeak](https://www.mathworks.com/help/thingspeak/)
- **Community**: [community.thingspeak.com](https://community.thingspeak.com/)
- **Support**: [support@quantumbitsolutions.com](mailto:support@quantumbitsolutions.com)

---

[:octicons-arrow-left-24: Back to Advanced Guide](../products/android/advanced-guide.md#add-ons-integration)
