!!! note "Navigation"
    **📚 [Documentation Home](../../) → [XPF User Guide](../products/xpf/user-guide.md) → ThingSpeak Add-on**

# ThingSpeak Add-on

**Cloud data logging and visualization add-on for Modbus Monitor XPF**

![ThingSpeak Channel](../assets/screenshots/xpf-iot-thingspeak.webp)

## Overview

The ThingSpeak Add-on enables Modbus Monitor XPF to automatically log your industrial data to ThingSpeak's cloud platform. This add-on provides:

- **Automatic Cloud Logging**: Send monitor point data directly to ThingSpeak channels
- **Real-time Dashboards**: Create professional visualizations accessible from anywhere
- **Historical Analysis**: Long-term data storage with trend analysis capabilities
- **MATLAB Integration**: Advanced analytics and machine learning on your industrial data
- **Alert Systems**: Automated notifications based on data thresholds
- **Export Capabilities**: Download data in multiple formats for reporting

!!! info "Add-on vs Core Features"
    **ThingSpeak Add-on** is separate from the core MQTT functionality. While MQTT is a general messaging protocol, this add-on specifically handles ThingSpeak cloud integration with dedicated features for channel management and data publishing.

## Quick Start

### 1. Purchase Add-on

You need both a ThingSpeak account (for the cloud platform) and the XPF ThingSpeak Add-on (for the integration):

#### A. ThingSpeak Account (Cloud Platform)
- **Free Account**: Create free ThingSpeak account at [thingspeak.com](https://thingspeak.com)
  - Includes free channel creation and API keys
  - Basic limits: 3 million messages/year, 1 message per 15 seconds
  - Perfect for testing and small deployments
- **Commercial License**: Upgrade at [ThingSpeak Pricing](https://thingspeak.com/prices) for higher limits

#### B. Modbus Monitor XPF ThingSpeak Add-on (Integration Software)
- **Purchase Required**: Buy ThingSpeak Add-on from [Quantum Bit Solutions Shop](https://quantumbitsolutions.com/shop/)
  - Search for "ThingSpeak Add-on" or "XPF ThingSpeak Integration"
  - Enables XPF to connect and publish data to ThingSpeak
  - Includes dedicated ThingSpeak configuration interface
- **Installation**: Follow add-on installation instructions after purchase

### 2. Configure Add-on
- [Create ThingSpeak channel](#step-1-create-thingspeak-channel) with your data fields
- [Configure XPF ThingSpeak settings](#step-2-configure-xpf-thingspeak-settings)
- [Map monitor points to channel fields](#step-3-field-mapping)

### 3. Configure Monitor Points
- **See**: [Monitor Points Configuration](../products/xpf/user-guide.md#7-monitor-points-configuration) in main user guide
- **Focus**: Ensure monitor points are collecting the data you want to log to ThingSpeak

### 4. Start Logging & Verify
- [Enable ThingSpeak logging](#step-4-enable-logging)
- [Verify data flow](#verification-checklist) to ThingSpeak dashboard
- [Monitor status](#monitoring-and-maintenance) and troubleshoot if needed

## Prerequisites

Before starting, ensure you have:

- [ ] **Modbus Monitor XPF** installed with ThingSpeak Add-on enabled
- [ ] **ThingSpeak account** (free at [thingspeak.com](https://thingspeak.com))
- [ ] **Monitor points configured** for the data you want to log
- [ ] **Internet connection** for cloud communication
- [ ] **Valid licensing** for commercial use (if applicable)

## Step 1: Create ThingSpeak Channel

### Channel Creation Process

Create your ThingSpeak data channel following these detailed steps:

1. **Navigate to ThingSpeak**
   - Go to [https://thingspeak.mathworks.com/channels](https://thingspeak.mathworks.com/channels)
   - Ensure you're logged into your ThingSpeak account

2. **Create New Channel**
   - Click the "New Channel" button on the main channels page

3. **Configure Channel Information**
   - **Name**: Enter a descriptive name (e.g., "Dixell - XRi77CH Controller")
   - **Description**: Add project description (e.g., "Modbus Monitor XPF IoT")

4. **Set Up Data Fields**
   Configure your field labels to match your Modbus registers:
   
   - **Field 1**: `Setpoint HEX 03B3 RW` ✅
   - **Field 2**: `Probe 1 Temperature HEX 108` ✅  
   - **Field 3**: `Probe 2 Temperature HEX 109` ✅
   - **Field 4**: `Probe 3 Temperature HEX 10A` ✅
   - **Field 5**: `Inverter Output Freq. HEX 010D` ✅
   - **Field 6**: `Compressor 1 HEX 021E` ✅
   - **Field 7**: `Compressor 2 HEX 021F` ✅
   - **Field 8**: `On-Off HEX 200` ✅

   !!! tip "Field Configuration"
       - Check the checkbox to enable each field you want to use
       - Include HEX register addresses in field labels for easy mapping
       - Use descriptive names that match your device parameters

5. **Additional Channel Settings**
   - **Metadata**: Enter "Modbus Monitor XPF IoT"
   - **Tags**: Add relevant tags like "modbus monitor xpf iot"
   - **Website**: Optional - your company/project URL (e.g., https://quantumbitsolutions.com/)
   - **GitHub**: Optional - link to your project repository (e.g., https://github.com/modbus-monitor)

6. **Save Channel**
   - Click "Save Channel" to create your new channel
   - Note your Channel ID from the resulting URL (e.g., 1103706)

7. **Get API Keys**
   - Click the "API Keys" tab after channel creation
   - Double-click and copy your **Write API Key** (Ctrl+C)
   - Store this key securely - you'll need it for XPF MQTT configuration

!!! success "Channel Created Successfully"
    Your ThingSpeak channel is now ready! You should see:
    
    - Channel ID in the URL (e.g., `/channels/1103706/`)
    - 8 configured data fields matching your Modbus registers
    - Write API Key for data publishing
    
    Next step: Configure XPF to connect and publish data to your new channel.

### Field Configuration Best Practices

- **Descriptive Names**: Use clear names that match your Modbus register functions
- **Register References**: Include HEX register addresses for easy XPF mapping  
- **Units**: Consider adding units in field names (°C, Hz, %, ON/OFF, etc.)
- **Future Planning**: Enable only active fields but plan for expansion
- **Data Types**: Match ThingSpeak field types with your Modbus data formats

## Step 2: Configure XPF ThingSpeak Settings

### ThingSpeak Add-on Configuration

Configure the ThingSpeak Add-on within Modbus Monitor XPF:

!!! note "ThingSpeak vs MQTT"
    The ThingSpeak Add-on has its own dedicated configuration separate from the general MQTT functionality. Don't confuse this with MQTT broker settings.

### XPF ThingSpeak Setup

1. **Open ThingSpeak Add-on Settings**
   - Navigate to **Add-ons** → **ThingSpeak** in XPF
   - Or go to **Client** tab → **ThingSpeak** group

![ThingSpeak API Key](../assets/screenshots/xpf-iot-thingspeak-api-key.webp)
2. **Enter ThingSpeak Connection Details**
   - **Channel ID**: Your ThingSpeak channel ID (e.g., 3148861)
   - **Write API Key**: The API key copied from ThingSpeak
   - **Update Rate**: How often to send data (minimum 15 seconds or 15000 for free accounts)
   - **Enable**: Toggle Enable to automatically push data to cloud based on the timer.

### Connection Parameters

| Setting | Value | Description |
|---------|-------|-------------|
| **Write API Key** | `XXXXXXXXXXXXXXXX` | 16-character API key from ThingSpeak |
| **Update Rate** | `30 seconds` | Minimum 15s for free accounts |

## Step 3: Field Mapping (Automatic Row-to-Field)

### How XPF Maps to ThingSpeak Fields

**XPF automatically maps monitor point rows to ThingSpeak fields:**

![Modbus Monitor XPF Thingspeak Configuration](../assets/screenshots/xpf-iot-thingspeak-samples.webp)

| XPF Monitor Point Row | ThingSpeak Field | Example Data | Description |
|----------------------|------------------|--------------|-------------|
| **Row 1** → | **field1** | Date (5) | First monitor point in your list |
| **Row 2** → | **field2** | Month (11) | Second monitor point in your list |
| **Row 3** → | **field3** | Year (2025) | Third monitor point in your list |
| **Row 4** → | **field4** | Hour (14) | Fourth monitor point in your list |
| **Row 5** → | **field5** | Min (25) | Fifth monitor point in your list |
| **Row 6** → | **field6** | Seconds (50) | Sixth monitor point in your list |
| **Row 7** → | **field7** | Ticks (27850906) | Seventh monitor point in your list |
| **Row 8** → | **field8** | ASCII ComputerName (16708) | Eighth monitor point in your list |

!!! warning "Row Order is Critical"
    **XPF maps by row position, not by name!** The first monitor point (Row 1) always goes to field1, the second (Row 2) goes to field2, etc.

### Configure Monitor Point Order

1. **Arrange Your Monitor Points**
   - **Move important data to the top rows** (1-8 for all ThingSpeak fields)
   - **Order matches your ThingSpeak field labels** for easy identification
   - **Only the first 8 rows** will be sent to ThingSpeak (field1-field8)

2. **Match ThingSpeak Channel Fields**
   - Ensure Row 1 data matches what you labeled as Field 1 in ThingSpeak
   - Ensure Row 2 data matches what you labeled as Field 2 in ThingSpeak
   - Continue for all 8 fields that you enabled in your ThingSpeak channel

3. **Test the Mapping**
   - Use **Communication Log** in XPF to monitor data transmission
   - Click **Send** to verify values are correctly mapped
   - Check ThingSpeak dashboard to confirm field1-8 show expected data

### Verify Field Mapping with Communication Log

1. **Open Communication Log**
   - In XPF, go to **View** → **Communication Log**
   - Enable logging to see ThingSpeak data transmission

2. **Send Sample Command**
   - Use XPF's **SEND** command feature to test data sending
   - Watch the communication log for ThingSpeak API calls
   - Verify the JSON payload shows correct field1-8 values

3. **Example Communication Log Output**
   ```
   11/5/2025 7:25:50 PM,Starting Sample Data to ThingSpeak
   11/5/2025 7:25:50 PM,field1 (Date)=5 field2(Month)=11 field3(Year)=2025 field4(Hour)=14 field5(Min)=25 field6(Seconds)=50 field7(Ticks)=27850906 field8(ASCII ComputerName)=16708 
   11/5/2025 7:25:51 PM,https://api.thingspeak.com/update.js    on?api_key=R3ERUXXXZ4I6XXXX&field1=11&field2=2025&field3=5&field4=14&field5=25&field6=50&field7=27850906&field8=16708&
   11/5/2025 7:25:51 PM,Response OK
   11/5/2025 7:25:51 PM,Sample Data Successfully Written
   ```

   **What this shows:**
   - **Field Mapping**: XPF automatically maps rows 1-8 to field1-8
   - **API Call**: Uses GET request with URL parameters (not JSON POST)
   - **Response**: "Response OK" confirms successful transmission
   - **Values**: Real data sent to each ThingSpeak field

!!! tip "Monitor Points Configuration"
    **Need to configure monitor points first?** See the comprehensive [Monitor Points Configuration](../products/xpf/user-guide.md#7-monitor-points-configuration) section in the main user guide.

## Step 4: Enable Logging & Verify

### Start ThingSpeak Logging

1. **Enable the Add-on**
   - ThingSpeak Add-on settings, check **Enable Logging**
   - **Start** the client to begin data transmission. The data is sent to cloud based on the interval set during configuration. 

2. **Monitor Connection Status**
   - Verify **Connected** status indicator is green
   - Check that **Messages Sent** counter is incrementing

3. **Verify Data Flow**
   - Open your ThingSpeak channel dashboard
   - Confirm data is appearing in real-time charts
   - Verify field values match your monitor point data

### Verification Checklist

- [x] **ThingSpeak channel** shows recent data updates
- [x] **Field values** match expected monitor point readings
- [x] **Timestamps** are current and correct
- [x] **Update rate** matches configured interval
- [x] **No error messages** in XPF status window

## Advanced Configuration

### Update Rates and Timing

**Recommended settings:**

| Application Type | Update Rate | Considerations |
|------------------|-------------|----------------|
| **Process Monitoring** | 30-60 seconds | Standard industrial monitoring |
| **Energy Monitoring** | 15 minutes | Power consumption tracking |
| **Environmental** | 5-10 minutes | Temperature, humidity monitoring |
| **Critical Alarms** | 10-30 seconds | Important status monitoring |

!!! warning "ThingSpeak Rate Limits"
    **Free accounts have limitations:**
    - Maximum 3 million messages per year
    - Rate limit: 1 message every 15 seconds
    - Plan your update rates accordingly

### Data Retention and Export

**ThingSpeak data management:**

- **Free accounts**: 1 year data retention
- **Licensed accounts**: Unlimited retention
- **Export options**: CSV, JSON, XML formats
- **API access**: Programmatic data retrieval

## Visualization and Analytics

### Creating Charts and Widgets

ThingSpeak provides several visualization options:

1. **Line Charts**: Time series data visualization
2. **Gauge Charts**: Real-time value displays  
3. **Digital Displays**: Numeric value widgets
4. **Maps**: GPS location data (if applicable)

### MATLAB Integration

ThingSpeak integrates with MATLAB for advanced analytics:

- **ThingSpeak Functions**: Built-in MATLAB functions
- **Data Analysis**: Statistical analysis and processing
- **Alerts**: Automated alert generation based on data patterns
- **Predictions**: Machine learning and forecasting

## Troubleshooting

### Common Issues and Solutions

**Connection Problems:**

| Issue | Cause | Solution |
|-------|-------|----------|
| ThingSpeak connection fails | Incorrect API key | Verify Write API Key in ThingSpeak channel |
| Data not appearing | Wrong channel ID | Check Channel ID in ThingSpeak add-on settings |
| Intermittent updates | Rate limiting | Increase update interval to >15 seconds |
| Authentication errors | Expired API key | Regenerate Write API Key in ThingSpeak |

**Data Quality Issues:**

| Issue | Cause | Solution |
|-------|-------|----------|
| Missing data points | Network interruptions | Enable ThingSpeak add-on auto-reconnect |
| Incorrect values | Field mapping errors | Verify monitor point to ThingSpeak field assignments |
| Timestamp issues | Time zone differences | Configure proper time zone in both XPF and ThingSpeak |
| Data format errors | Type mismatches | Check data type compatibility between monitor points and fields |

### Diagnostic Tools

**XPF ThingSpeak Add-on Diagnostics:**
- ThingSpeak connection status indicator
- Message transmission counters
- Field mapping validation
- Error logging and reporting

**ThingSpeak Platform Diagnostics:**
- Channel activity logs
- API usage statistics and limits
- Message success/failure rates
- Data visualization health checks

## Best Practices

### Security Recommendations

1. **Rotate API Keys**: Regularly update MQTT credentials
2. **Limit Permissions**: Use read-only keys where possible
3. **Monitor Access**: Review channel access logs regularly

### Performance Optimization

1. **Batch Updates**: Group multiple values in single message
2. **Efficient Polling**: Set appropriate monitor point update rates
3. **Error Handling**: Implement robust reconnection logic
4. **Data Validation**: Verify data quality before publishing

## Support and Resources

### Official Documentation

- **ThingSpeak Documentation**: [mathworks.com/help/thingspeak](https://www.mathworks.com/help/thingspeak/)
- **ThingSpeak REST API**: Official API reference for advanced integration
- **XPF User Guide**: [Main user guide](../products/xpf/user-guide.md) for core XPF functionality
- **Monitor Points**: [Configuration guide](../products/xpf/user-guide.md#7-monitor-points-configuration) for data source setup

### Community Resources

- **ThingSpeak Community**: Official support forums
- **Modbus Monitor Community**: User discussions and examples


---

## Additional Add-ons

This ThingSpeak Add-on is part of a growing ecosystem of XPF add-ons:

- **MQTT Add-on**: General MQTT broker connectivity (separate from ThingSpeak)


---

## Navigation

!!! tip "Return to Main Guide"
    **[← Back to XPF User Guide](../products/xpf/user-guide.md)**
    
    **Related Sections:**
    - [Monitor Points Configuration](../products/xpf/user-guide.md#7-monitor-points-configuration) - Configure data sources
    - [ThingSpeak Overview](../products/xpf/user-guide.md#thingspeak-add-on-cloud-logging) - Main guide ThingSpeak section
    - [Other Add-ons](../products/xpf/user-guide.md#add-ons-and-integrations) - Explore additional XPF add-ons

**Next Steps:**
- Return to [main user guide](../products/xpf/user-guide.md) for core XPF features
- Explore [Monitor Points configuration](../products/xpf/user-guide.md#7-monitor-points-configuration)
- Check out other available add-ons for XPF