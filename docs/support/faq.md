# FAQ

Beginner‑friendly answers to common questions across Windows (XPF), Android (Advanced & Free), Mapper Pro, licensing, purchasing, connectivity and troubleshooting.

---
## General

### What is Modbus Monitor XPF?
Windows desktop application for professional Modbus TCP/RTU/ASCII monitoring, diagnostics, logging, charting and cloud publishing (MQTT / ThingSpeak).

### What is Modbus Monitor Advanced (Android)?
Full‑featured mobile client supporting TCP/IP, USB‑OTG serial, Bluetooth Classic / BLE, data logging, server modes, cloud add‑ons (MQTT, Google Sheets, ThingSpeak).

### What is Modbus Console (Free)?
Lightweight Android tool for quick read/write tests. Ideal for simple field device checks. No cloud or advanced logging.

### What is Mapper Pro?
Protocol sniffer and analyzer for discovering devices, decoding traffic, building maps and troubleshooting network issues.

### Where do I download products?
Windows XPF & Mapper Pro: directly via the online shop. Android apps: Google Play Store. Links are provided in the product sections and below under Purchasing.

---
## Purchasing & Licensing

### How can I purchase XPF?
Two common flows:
    1. Microsoft Store (if available) – provides automatic updates and simplified license management.
    2. Online Shop (preferred for bundles): https://quantumbitsolutions.com/shop

### What license type do I get via the shop?
Perpetual usage with version updates within a defined maintenance window (see invoice details). Renewal extends update eligibility; the software continues functioning after maintenance expiry.

### How do I activate an XPF license?

1. Install XPF.
2. Open the License/Activation dialog.
3. Paste or enter the license key from your purchase email.
4. Click Activate (internet required on first activation). Offline fallback usually requires a request/response file (see user guide).

### Can I transfer my license to another PC?
Yes. Deactivate on the old machine (License dialog) then activate on the new machine using the same key. If hardware change blocks activation, contact support.

### Microsoft Store vs Online Shop – which should I choose?
Store: seamless updates & simplified install. Shop: bundles, promotions, and complementary tools (Mapper Pro). Choose the store for convenience; the shop for package deals.

### Where can I find invoices or download links?
Online Shop order confirmation email + account dashboard. Microsoft Store order history inside your Microsoft account.

---
## Installation & Setup

### Windows prerequisites

• .NET Desktop Runtime (if not bundled)
• Stable network or serial adapter driver installed
• Administrative rights for driver/port access where required

### Android Advanced initial setup
1. Install from Play Store.
2. Grant USB and Bluetooth permissions when prompted.
3. Configure connection (TCP host:port or serial parameters).
4. Add points or import a map (see Import/Export guide).

### USB‑OTG Serial not detected on Android – what to check?
• Use a quality OTG adapter/hub.
• Confirm chipset supported (FTDI, CH340, CP210x, Prolific, etc.).
• Grant permission dialog (tap Allow). If it never appears, replug and reopen app.
• Some phones restrict power output; try powered hub for multiple devices.

### Bluetooth Classic vs BLE?
Classic (SPP) offers virtual serial streams; BLE requires defined service/characteristics with limited throughput. Use Classic for full Modbus serial bridging when possible.

---
## Modbus Basics

### Difference between Modbus TCP and RTU?
TCP: Ethernet encapsulation, easier routing, no timing gaps. RTU: serial frame timing critical, lower overhead in closed wiring environments.

### What is 6‑digit addressing?
Normalization of function + register base into a unified 6‑digit address scheme for simpler map management. See the dedicated guide for conversion examples.

### When do I use Modbus ASCII?
Legacy environments or noisy lines where printable characters aid diagnostics. Higher overhead than RTU; use only when required.

---
## Data Logging & Export

### How do I log data?
XPF: configure logging profile (interval, format) and destination folder; enable session. Android Advanced: enable logging in session settings (CSV or integrated cloud plugin).

### Export formats available?
CSV, JSON (maps & data); cloud integrations stream directly to MQTT, Google Sheets, ThingSpeak.

### Large logs performance tips

• Split sessions by device group.
• Compress archives periodically.
• Use filters to reduce row volume.

---
## Cloud & Integrations

### MQTT setup basics

1. Broker host:port + TLS options.
2. Authentication (user/password or certificates).
3. Topic strategy: use per‑device prefix + measurement suffix.
4. Test with a subscriber before production.

### Google Sheets integration (Android)
Provide spreadsheet ID + sheet name; authorize account; ensure rate within Sheets API limits.

### ThingSpeak integration
Channel API key + field mapping; validate update interval against channel rate limits; use MATLAB for analytics post‑ingestion.

### Can I publish Modbus RTU data to cloud from Android?
Yes. Poll via USB serial or Bluetooth → transform values → push via MQTT/Sheets/ThingSpeak add‑on.

---
## Server & Sensor Modes

### What is Server Mode (Android)?
Device acts as a Modbus slave/server exposing registers populated from internal sensors or acquired external sources.

### What is Sensor Server?
Extends server mode adding structured sensor data mapping (e.g., environmental readings) for quick field integration.

### When to use Android as a server?
Rapid prototyping, edge aggregation, or simulation when physical PLC/RTU devices aren’t available.

---
## Hardware & Connectivity

### Common connection errors

• Incorrect COM port or baud rate (RTU)
• Firewall blocking TCP port
• Device address mismatch (unit ID)
• Cable wiring (A/B swapped) for RS‑485

### Improving unreliable RTU communication
Shorter bus length, proper termination, shielded twisted pair, stable power supply, correct biasing resistors.

### Does Mapper Pro alter traffic?
No. It passively observes packets (mirrored or sniffed) unless actively configured in injection/test mode.

---
## Troubleshooting & Error Codes

### How do I interpret error codes?
Use the Error Codes guide for mapping exceptions (ILLEGAL FUNCTION, ILLEGAL DATA ADDRESS, CRC failures). Patterns help isolate wiring vs addressing vs device faults.

### Frequent timeout causes

• Wrong slave ID
• Baud/Parity mismatch
• RF/EMI noise or unshielded cabling
• Overloaded device (poll interval too aggressive)

### Best first diagnostic step
Reduce point count to a single known good register; confirm stable reads before scaling.

---
## Performance & Optimization

### How many devices can I poll simultaneously?
Depends on channel latency and interval. Start conservative (1–2 polls/sec per device) and raise while monitoring error rate.

### Reducing Android battery drain
Lower poll frequency, disable unused transports (Bluetooth when on USB), minimize screen brightness, stop logging when not needed.

### Windows performance tips
Run on SSD, enable application logging rotation, avoid polling extremely large blocks if mostly sparse data.

---
## Security

### Is Modbus secure?
Classic Modbus lacks encryption/authentication. Use network segmentation + VPN/TLS tunnels where possible.

### Securing MQTT publishes
Enable TLS, unique credentials per deployment, least privilege topic access, periodic key rotation.

### Protecting maps and logs
Store exports in access‑controlled directories; sanitize sensitive device naming before sharing.

---
## Documentation & Support

### Where do I get help?

• Documentation Hub home page
• Community Forum (peer Q&A)
• Email / contact form for licensing issues
• YouTube channel for walkthrough videos

### What information should I include in a support request?
Product version, platform (Windows/Android), connection type, error codes/messages, log snippet, device model, steps already tried.

### Response times?
Email: 24–48h; forum: community dependent; urgent licensing: mark subject accordingly.

---
## Commerce & CTA Links

| Action | Link |
|--------|------|
| Purchase / Shop | https://quantumbitsolutions.com/shop |
| License / Activation Help | (See product user guide) |
| Download Android Advanced | Google Play Store (User Guide page) |
| Download Android Free | Google Play Store (Free Guide page) |
| Mapper Pro Info | Product manual & quick start |

---
## Best Practices Summary

1. Keep purchasing on main domain for credibility & SEO continuity.
2. Use docs for education, deep linking & structured FAQ answers.
3. Add clear CTA buttons (Purchase, Try Free, Learn More) without replicating checkout.
4. Stabilize slugs; add redirects only when strategic keyword opportunity is validated.
5. Monitor GA4 redirect vs organic traffic to refine prominent FAQ entries.

---
## Still Need Help?
See the Support Center index or contact support directly: [support@quantumbitsolutions.com](mailto:support@quantumbitsolutions.com)

*Last updated: November 29, 2025*