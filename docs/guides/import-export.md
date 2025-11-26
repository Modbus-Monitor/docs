# Import & Export Guide for Modbus Monitor Advanced

**Move configurations and data between devices quickly and safely**

This guide explains how to import and export monitor points, settings, and logged data in Modbus Monitor Advanced. It consolidates legacy instructions from the old site and adds Android-focused steps.

---

## What You Can Import/Export

- Monitor points and configurations (channels, addresses, data types)
- CSV logs for historical data analysis
- App templates and common defaults for rapid setup

---

## Export from Android

- Main Menu → Data → Export and Email
- Creates a CSV in the `Downloads` folder with monitor point definitions
- Optionally opens your email client to share the file

---

## Import into Android

- Place your CSV in the `Downloads` folder
- Main Menu → Data → Import
- Select the CSV; monitor points are created automatically

Tip: Importing overwrites existing points with matching names. Use distinct names per device/site.

---

## Desktop ↔ Android Workflow

- Export from Modbus Monitor XPF (Windows) to CSV
- Transfer the CSV to Android `Downloads`
- Import via Main Menu → Data → Import

This is ideal for complex setups (dozens of points) configured on desktop first.

---

## Reference

For the original, detailed workflow and format examples, see:

- Import/Export (legacy site): https://quantumbitsolutions.com/importexport/

If you need help converting older formats, contact support.

---

## Troubleshooting

- CSV not found: Ensure the file is in `Downloads` and readable
- Wrong columns: Use the export template from the app to match expected headers
- Partial import: Check for invalid rows or missing required fields

---

## Best Practices

- Keep a versioned archive of exported CSVs
- Use descriptive names and units in monitor point labels
- Validate a small subset before bulk importing large configurations