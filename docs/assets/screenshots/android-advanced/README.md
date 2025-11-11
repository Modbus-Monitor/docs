# Android Advanced Screenshots Capture Guide

This directory contains placeholder files for the **13 required screenshots** for the Modbus Monitor Advanced documentation. Each placeholder file includes detailed instructions on what to capture.

## 📱 Screenshots Required

### Figure 1: Main Interface
**File**: `main-interface.png`  
**Size**: 400px width  
**Content**: Main app screen showing:
- Header with hamburger menu and app title
- Quick access control buttons (Server, Client, Bluetooth, USB, IoT)
- Good/Bad packet counters
- Server IP and port information (when server active)
- Monitor points list with live data values
- Floating + button for adding new points

### Figure 2: Main Window Annotated
**File**: `main-window-annotated.png`  
**Size**: 500px width  
**Content**: Same as Figure 1 but with numbered annotations [1], [2], [3], etc. showing:
- [1] Hamburger menu button
- [2] Server mode status/start/stop
- [3] Client mode status/start/stop  
- [7] Packet counters
- [9] Monitor point data with response times
- [10] Add monitor point button

### Figure 3: Main Menu
**File**: `main-menu.png`  
**Size**: 350px width  
**Content**: Side navigation menu showing all options:
- Home, Modbus Console, Settings
- Purchases, Transform, Import, Export
- Google Sheets, ThingSpeak, MQTT
- Factory Reset, Reset counters, Reset statistics

### Figure 4: Monitor Points List  
**File**: `monitor-points-list.png`  
**Size**: 450px width  
**Content**: Main screen with multiple configured monitor points showing:
- Different device configurations
- Live data values
- Configuration details (if visible)
- Mix of TCP/IP and serial connections

### Figure 5: Monitor Point Management
**File**: `monitor-point-management.png`  
**Size**: 400px width  
**Content**: Context menu that appears when tapping a monitor point:
- Communications, Add, Remove, Change options
- Copy, Paste, Write, Write Preset Value
- Hide/Unhide Configuration option

### Figure 6: Monitor Point Configuration
**File**: `monitor-point-configuration.png`  
**Size**: 500px width  
**Content**: Configuration dialog showing expandable sections:
- Channel Settings (expanded)
- Modbus Configuration (expanded)  
- Sensor Server settings
- Math and Coded Message sections

### Figure 7: Client Mode Interface
**File**: `client-mode-interface.png`  
**Size**: 500px width  
**Content**: Main interface during active client polling:
- Client status indicator active/green
- Monitor points showing live polled data
- Communication status indicators
- Link icons in active state

### Figure 8: Write Dialog
**File**: `write-dialog.png`  
**Size**: 400px width  
**Content**: Write dialog box showing:
- Monitor point name and data type in header
- Value input field
- Change/Cancel buttons
- Current value display

### Figure 9: Server Mode Interface  
**File**: `server-mode-interface.png`  
**Size**: 500px width  
**Content**: Main interface with server active:
- Server status indicator active/green
- Server IP address and port displayed
- Connected client count in parentheses
- Monitor points configured for serving

### Figure 10: Server Configuration
**File**: `server-configuration.png`  
**Size**: 450px width  
**Content**: Settings screen → Server settings showing:
- Server/Listen Port configuration
- Modbus Server enable/disable toggle
- Auto Start option
- Port number input field

### Figure 11: Server Monitor Point
**File**: `server-monitor-point.png`  
**Size**: 500px width  
**Content**: Monitor point configuration for server mode:
- Protocol set to Modbus TCP
- Address field (e.g., 0 for 40001)
- Count field for multiple registers
- Channel set to TCP/IP

### Figure 12: Sensor Server Config
**File**: `sensor-server-config.png`  
**Size**: 500px width  
**Content**: Monitor point configuration with sensor selected:
- Sensor dropdown showing available sensors
- Automatic configuration fields populated
- Sensor information displayed

### Figure 13: Sensor Info Display
**File**: `sensor-info-display.png`  
**Size**: 600px width  
**Content**: Monitor point showing detailed sensor information:
- Register name filled with sensor specifications
- Power, resolution, range, vendor information
- Real-time sensor data in [0][1][2] format
- Count automatically set to 6 words

## 📸 Capture Instructions

### Setup Requirements
1. **Install Modbus Monitor Advanced** on Android device
2. **Configure test monitor points** for different scenarios
3. **Use Android screen capture** or screenshot tools
4. **Ensure high resolution** - minimum 300 DPI for print quality

### Capture Tips
- **Clean interface**: Remove notifications, ensure good battery level
- **Consistent styling**: Use same Android theme throughout
- **Clear content**: Use readable test data, realistic IP addresses
- **Proper sizing**: Maintain aspect ratios, crop unnecessary borders
- **File format**: Save as PNG for best quality and transparency

### File Naming Convention
- Use descriptive names matching the content
- Keep consistent with figure captions
- Use lowercase with hyphens for spaces
- Include version numbers if multiple versions needed

### Post-Processing
- **Crop appropriately**: Remove unnecessary interface elements
- **Resize to specified widths**: Maintain aspect ratio
- **Optimize file size**: Balance quality vs. file size
- **Add annotations if needed**: Use consistent style for numbered callouts

## 🔄 Replacement Process

1. **Capture actual screenshots** following above guidelines
2. **Save with exact filenames** as listed above  
3. **Replace placeholder files** in this directory
4. **Test documentation build** to ensure images display correctly
5. **Verify responsive design** on different screen sizes

## 📝 Notes

- **Placeholder files** currently show gray boxes with descriptive text
- **Real screenshots** will be automatically used when files are replaced
- **Figure numbers** correspond to documentation order
- **Sizes are maximum widths** - images will scale responsively
- **Quality is important** - these images represent your product professionally

---

**Status**: ✅ **COMPLETE** - All screenshots imported from WordPress uploads and properly named for documentation integration.