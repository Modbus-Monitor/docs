!!! note "Navigation"
    **📚 [Documentation Home](../../) → [Guides](index.md) → ThingSpeak for Windows XPF**

# ThingSpeak Add-on for Windows XPF

**Desktop IoT logging. Cloud charts, MATLAB analytics, real-time alerts from Modbus Monitor XPF.**

![ThingSpeak Integration](../assets/screenshots/windows-xpf/thingspeak-example.webp){ .screenshot-center loading="lazy" }

⬆️ **New to ThingSpeak?** [← See Overview Guide](thingspeak-overview.md) for platform-agnostic concepts, use cases, and general setup.

---

## Quick Start (5 Minutes)

### Prerequisites

✅ Modbus Monitor XPF installed  
✅ ThingSpeak Add-on license key  
✅ ThingSpeak account at [thingspeak.com](https://thingspeak.com)

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

### Step 2: Configure in XPF

1. **Tools** → **Add-Ons** → **ThingSpeak**
2. Check **Enable ThingSpeak Add-On**
3. Paste:
   - **Write API Key**: From ThingSpeak
   - **Channel ID**: From ThingSpeak channel details
   - **Update Interval**: 30 seconds (min 15s for free tier)
4. Click **Apply** → **OK**

### Step 3: Start Monitoring

1. **Connect** to your Modbus device
2. Click **Start Polling** (or use Modbus Monitor's auto-poll)
3. App automatically uploads data every interval
4. Open your ThingSpeak channel to see charts update

**Done!** Your Modbus data is now in the cloud.

---

## Windows XPF Configuration

### Add-On Settings

![ThingSpeak Add-On Settings](../assets/screenshots/windows-xpf/thingspeak-addon-settings.webp){ .screenshot-center loading="lazy" }

**Required Settings:**

| Setting | Value | Source |
|---------|-------|--------|
| **Write API Key** | `ABCDEFG1234567890` | ThingSpeak → Your Channel → API Keys |
| **Channel ID** | `123456` | ThingSpeak channel details page |
| **Update Interval (sec)** | `30` | Min 15s (free), 1s (paid); recommend 30-60s |

**Optional Settings:**

| Setting | Purpose |
|---------|---------|
| **Include Device Status** | Upload XPF app status/connectivity |
| **Device Name** | Identifier for status field |
| **Proxy Settings** | If behind corporate firewall |

### Monitor Point Mapping

XPF automatically maps monitor points to ThingSpeak fields **in order**:

```
Your Monitor List (XPF):    ThingSpeak Channel:
1. Tank Level        →      Field 1
2. Motor Speed       →      Field 2
3. Temperature       →      Field 3
4. Pressure          →      Field 4
...
8. Flow Rate         →      Field 8
```

**⚠️ Limit**: Only 8 fields per channel (first 8 monitor points upload)

**To change what uploads:**
- Reorder monitor points in **Project** → **Modbus Points** → Use drag handle
- Changes take effect on next upload cycle

---

## Advanced Configuration

### Custom Interval Based on Device

**Upload different data at different rates:**

!!! warning "Limitation"
    ThingSpeak channels use single update interval. If you need different rates for different points, use separate channels or MQTT add-on.

**Workaround - Multiple Channels:**
1. Create Channel 1 for critical data (30s interval)
2. Create Channel 2 for non-critical data (5min interval)
3. Configure separate XPF instances or use MQTT

### Handling Device Disconnections

**Automatic Reconnect:**
- XPF retries failed uploads automatically
- Failed entries queue locally and retry next cycle
- Check **Connection Status** in Add-On settings

**Manual Recovery:**
1. Right-click XPF tray icon
2. Select **Reconnect Add-Ons**
3. Or restart XPF application

### Data Quality & Validation

**Before Upload:**
- XPF validates all monitor point reads
- Skips bad/null readings automatically
- Logs validation issues to event log

**Check Event Log:**
- **View** → **Event Log**
- Filter by "ThingSpeak" to see upload history
- Check for read errors or network issues

---

## Verification & Testing

### Manual Test Setup

1. **Create test channel** in ThingSpeak (separate from production)
2. **Add 3-4 simple monitor points** in XPF
3. **Configure add-on** with test channel details
4. **Start polling** for 2 cycles
5. **Check ThingSpeak**:
   - Private View should show 2+ recent timestamps
   - Values should match XPF readings

### Troubleshooting

| Problem | Solution |
|---------|----------|
| **"Invalid API Key" error** | Verify key matches ThingSpeak Write API Key exactly |
| **"Channel not found" error** | Confirm Channel ID is numeric and matches ThingSpeak |
| **Uploads rate-limited** | Increase interval to ≥15 seconds |
| **Partial data uploaded** | Check that first 8 points are readable; skip bad points |
| **No uploads occurring** | Is internet connected? Check Event Log for errors |

**Enable Debug Logging:**
- Add-On Settings → Advanced → **Enable Verbose Logging**
- Check Event Log for detailed upload diagnostics

---

## Common Tasks

**How do I view uploaded data?**  
ThingSpeak → Your Channel → Private View (or Public View)

**Can multiple PCs upload to same channel?**  
Yes, but coordinate Channel ID and API Key. Data from all sources merges chronologically.

**How do I back up my data?**  
ThingSpeak → Data Import/Export → Download as CSV/JSON

**Can I analyze data with MATLAB?**  
Yes: ThingSpeak has built-in MATLAB integration. See [Overview Guide](thingspeak-overview.md#matlab-analytics)

**Do I need paid ThingSpeak?**  
Free tier works for most uses. Limits:
- 8 fields per channel
- 15-second minimum update interval
- 3 months data history

---

## XPF-Specific Features

### Working with Projects

**Create Project for ThingSpeak:**
1. **File** → **New Project**
2. Add monitor points for all data you want to log
3. **Tools** → **Add-Ons** → **ThingSpeak**
4. Enable and configure
5. **Save Project** with descriptive name

**Load Project Later:**
1. **File** → **Recent** or **Open**
2. XPF remembers your ThingSpeak settings
3. Click **Start Polling** to resume logging

### Exporting from XPF

**Local CSV Export:**
- **Tools** → **Export Data** → Select date range
- Export to CSV before uploading to ThingSpeak
- Useful for backup or analysis in Excel

**Combined Workflow:**
1. Poll device and collect local data in XPF
2. Simultaneously upload to ThingSpeak via add-on
3. Export CSV for backup/compliance

### Scheduled Polling

**Automatic Polling with Task Scheduler:**
- Configure Windows Task Scheduler to launch XPF at intervals
- XPF opens, polls, uploads, then closes
- Useful for continuous 24/7 monitoring

**Example Schedule:**
```
Trigger: Every 30 minutes
Run: "C:\Program Files\Modbus Monitor XPF\ModbusMonitor.exe" myproject.xpf
```

---

## Troubleshooting

### Upload Failures

**Issue**: "Device Not Connected"
- **Check**: Is Modbus device online?
- **Check**: Is network connection active?
- Solution: Verify device IP/port in connection settings

**Issue**: "Invalid License for Add-On"
- **Check**: Is ThingSpeak license key activated?
- Solution: Tools → License Management → Activate

**Issue**: "Channel Quota Exceeded"
- **Check**: Update interval too short
- Solution: Increase to minimum 15 seconds

### Network Issues

**Firewall Blocking:**
- Check Windows Firewall → Allow App through firewall
- Add XPF to whitelist

**Corporate Proxy:**
- Configure in Add-On Settings → Proxy
- Enter proxy server and port

**Intermittent Connectivity:**
- XPF automatically retries failed uploads
- Check Event Log for detailed error messages

---

## Cross-Platform Reference

| Feature | Windows XPF | Android |
|---------|-------------|---------|
| **Basic Setup** | [← You are here] | [Android Setup](android-thingspeak-addon.md) |
| **ThingSpeak Concepts** | [Overview Guide](thingspeak-overview.md) | [Overview Guide](thingspeak-overview.md) |
| **MATLAB Integration** | Supported | Supported |
| **Max Fields** | 8 | 8 |
| **Min Update Interval** | 15s (free) | 15s (free) |
| **Scheduled Polling** | Via Windows Task Scheduler | Via Android alarms |

---

## Resources

- **ThingSpeak Docs**: [thingspeak.com/docs](https://thingspeak.com/docs)
- **XPF Help**: Tools → Help (built-in documentation)
- **MATLAB Integration**: [mathworks.com/thingspeak](https://www.mathworks.com/help/thingspeak/)
- **Community**: [community.thingspeak.com](https://community.thingspeak.com/)
- **Support**: [support@quantumbitsolutions.com](mailto:support@quantumbitsolutions.com)

---

[:octicons-arrow-left-24: Back to Add-Ons Guide](index.md#add-ons-reference)
