# ThingSpeak Add-on

**Complete step-by-step guide for integrating Modbus Monitor XPF with ThingSpeak cloud platform**

## Overview

ThingSpeak is a cloud-based Internet of Things (IoT) platform that provides data collection, visualization, and analytics services. When integrated with Modbus Monitor XPF, you can:

- **Log industrial data to the cloud** for remote monitoring
- **Create real-time dashboards** accessible from anywhere
- **Analyze trends** using ThingSpeak's MATLAB integration  
- **Set up alerts** based on data thresholds
- **Export data** for compliance and reporting

## Prerequisites

Before starting, ensure you have:

- [ ] Active ThingSpeak account (free at [thingspeak.com](https://thingspeak.com))
- [ ] Modbus Monitor XPF installed and configured
- [ ] Monitor points configured for the data you want to log
- [ ] Internet connection for cloud communication

## Part 1: ThingSpeak Channel Creation

### Step-by-Step Channel Setup

Follow these detailed steps to create a new ThingSpeak channel for your Modbus Monitor XPF data:

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
   - Note your Channel ID from the resulting URL (e.g., 3148861)

7. **Get API Keys**
   - Click the "API Keys" tab after channel creation
   - Double-click and copy your **Write API Key** (Ctrl+C)
   - Store this key securely - you'll need it for XPF MQTT configuration

!!! success "Channel Created Successfully"
    Your ThingSpeak channel is now ready! You should see:
    
    - Channel ID in the URL (e.g., `/channels/3148861/private_show`)
    - 8 configured data fields matching your Modbus registers
    - Write API Key for data publishing
    
    Next step: Configure XPF to connect and publish data to your new channel.

### Field Configuration Best Practices

- **Descriptive Names**: Use clear names that match your Modbus register functions
- **Register References**: Include HEX register addresses for easy XPF mapping  
- **Units**: Consider adding units in field names (°C, Hz, %, ON/OFF, etc.)
- **Future Planning**: Enable only active fields but plan for expansion
- **Data Types**: Match ThingSpeak field types with your Modbus data formats

## Part 2: XPF Configuration for ThingSpeak

### MQTT Connection Setup

Configure XPF to connect to ThingSpeak's MQTT broker:

```yaml
Host: mqtt3.thingspeak.com
Port: 1883 (non-secure) or 8883 (TLS secure)
Client ID: (unique identifier - can be any string)
Username: (your ThingSpeak MQTT username)
Password: (your ThingSpeak MQTT API key)
Keep Alive: 60 seconds
```

### Topic Configuration

**Publishing Topic Format:**
```
channels/<CHANNEL_ID>/publish
```

**Message Format (JSON):**
```json
{
  "field1": 23.5,
  "field2": 65.2,
  "field3": 1,
  "status": "MQTTPUBLISH"
}
```

### XPF MQTT Setup Steps

1. **Open XPF MQTT Configuration**
   - Navigate to Client tab → MQTT group
   - Click MQTT settings button

2. **Enter ThingSpeak Broker Details**
   - Host: `mqtt3.thingspeak.com`
   - Port: `1883`
   - Enter your ThingSpeak credentials

3. **Configure Publishing Topic**
   - Topic: `channels/YOUR_CHANNEL_ID/publish`
   - Replace `YOUR_CHANNEL_ID` with your actual channel ID

4. **Map Monitor Points to Fields**
   - Configure which monitor points map to which ThingSpeak fields
   - Set appropriate data formatting

## Part 3: Data Mapping and Testing

### Field Mapping Strategy

**Recommended mapping approach:**

| ThingSpeak Field | Monitor Point Example | Data Type | Description |
|------------------|----------------------|-----------|-------------|
| **field1** | Temperature (°C) | FLOAT32 | Process temperature |
| **field2** | Pressure (PSI) | FLOAT32 | System pressure |
| **field3** | Flow Rate (GPM) | FLOAT32 | Flow measurement |
| **field4** | Status | UINT16 | Equipment status code |
| **field5** | Setpoint | FLOAT32 | Control setpoint |
| **field6** | Output (%) | FLOAT32 | Control output percentage |

### Testing Data Flow

1. **Start XPF Client**
   - Ensure monitor points are collecting data
   - Verify MQTT connection is established

2. **Enable MQTT Publishing**
   - Start MQTT publishing in XPF
   - Monitor connection status

3. **Verify Data in ThingSpeak**
   - Check your ThingSpeak channel
   - Confirm data is appearing in real-time
   - Verify field mappings are correct

## Part 4: Advanced Configuration

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

## Part 5: Visualization and Analytics

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
| MQTT connection fails | Incorrect credentials | Verify username/password in ThingSpeak |
| Data not appearing | Wrong channel ID | Check channel ID in topic string |
| Intermittent updates | Rate limiting | Increase update interval to >15 seconds |
| Authentication errors | Expired API key | Regenerate MQTT API key in ThingSpeak |

**Data Quality Issues:**

| Issue | Cause | Solution |
|-------|-------|----------|
| Missing data points | Network interruptions | Enable XPF auto-reconnect |
| Incorrect values | Field mapping errors | Verify monitor point to field assignments |
| Timestamp issues | Time zone differences | Configure proper time zone settings |

### Diagnostic Tools

**XPF Diagnostics:**
- MQTT connection status indicator
- Message send/receive counters
- Error logging and reporting

**ThingSpeak Diagnostics:**
- Channel activity logs
- API usage statistics
- Message success/failure rates

## Best Practices

### Security Recommendations

1. **Use TLS/SSL**: Enable secure connections (port 8883)
2. **Rotate API Keys**: Regularly update MQTT credentials
3. **Limit Permissions**: Use read-only keys where possible
4. **Monitor Access**: Review channel access logs regularly

### Performance Optimization

1. **Batch Updates**: Group multiple values in single message
2. **Efficient Polling**: Set appropriate monitor point update rates
3. **Error Handling**: Implement robust reconnection logic
4. **Data Validation**: Verify data quality before publishing

### Maintenance Procedures

1. **Regular Monitoring**: Check data flow daily
2. **Backup Configuration**: Save XPF and ThingSpeak settings
3. **Update Management**: Keep API keys and settings current
4. **Documentation**: Maintain field mapping documentation

## Support and Resources

### Official Documentation

- **ThingSpeak Documentation**: [mathworks.com/help/thingspeak](https://www.mathworks.com/help/thingspeak/)
- **MQTT API Guide**: ThingSpeak MQTT API reference
- **XPF MQTT Guide**: [Reference main user guide MQTT section](../user-guide.md#mqtt-integration)

### Community Resources

- **ThingSpeak Community**: Official support forums
- **Modbus Monitor Community**: User discussions and examples
- **GitHub Examples**: Integration code samples and templates

---

**Next Steps:**
- Return to [main user guide](../user-guide.md) for other XPF features
- Explore [advanced MQTT configurations](../user-guide.md#advanced-mqtt-features)
- Check out [other cloud integrations](../user-guide.md#cloud-integrations)