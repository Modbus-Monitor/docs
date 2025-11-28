# New Documentation Site - Available Pages

## Your New Docs Site Structure

Base URL: `https://docs.quantumbitsolutions.com/`

### Main Pages
- Home: `/`
- Support Center: `/support/`
- Technical Resources: `/technical/`
- Products: `/products/`

### Support & Help Pages
- `/support/` - Help Center
- `/support/faq/` - FAQ
- `/support/videos/` - Video Tutorials

### Product Documentation
- `/products/xpf/user-guide/` - XPF User Guide
- `/products/xpf/quick-start/` - XPF Quick Start
- `/products/mapper/user-manual/` - Mapper User Manual
- `/products/mapper/quick-start/` - Mapper Quick Start
- `/products/android/free-guide/` - Android Free Guide
- `/products/android/advanced-guide/` - Android Advanced Guide
- `/products/custom/overview/` - Custom Solutions

### Guides & Tutorials
- `/guides/6-digit-addressing/` - 6-Digit Addressing Guide
- `/guides/android-mqtt-addon/` - Android MQTT Add-on
- `/guides/android-sheets-addon/` - Android Sheets Add-on
- `/guides/android-thingspeak-addon/` - Android ThingSpeak Add-on
- `/guides/mqtt-addon/` - MQTT Add-on (Windows)
- `/guides/thingspeak-addon/` - ThingSpeak Add-on
- `/guides/assets-guide/` - Assets Guide
- `/guides/content-migration/` - Content Migration
- `/guides/features-demo/` - Features Demo
- `/guides/real-time-editing-help/` - Real-Time Editing Help
- `/guides/mermaid-showcase/` - Mermaid Diagrams

### Technical Resources
- `/technical/` - Technical Overview
- `/technical/error-codes/` - Error Codes
- `/technical/hardware/` - Hardware Setup
- `/technical/import-export/` - Import/Export
- `/technical/serial-ports/` - Serial Ports
- `/technical/server-setup/` - Server Setup

### Imported Content (Legacy)
- `/imported/xpf-help/` - Imported XPF Help
- `/imported/android-help/` - Imported Android Help
- `/imported/mapper-help/` - Imported Mapper Help
- `/imported/advanced-help/` - Imported Advanced Help

---

## Next Steps:

### Step 1: Get Your Old WordPress URLs
You need to get all URLs from `https://quantumbitsolutions.com/help/`

**Choose ONE method:**

#### Method 1: WordPress Sitemap (Easiest)
1. Visit: `https://quantumbitsolutions.com/sitemap.xml`
2. Look for sitemap files like `https://quantumbitsolutions.com/page-sitemap.xml`
3. Open them and find all URLs containing `/help/`
4. Copy them to a list

#### Method 2: WordPress Admin
1. Log into WordPress Dashboard
2. Go to **Pages** (or **Posts**, depending on where help content lives)
3. Export list of all pages/posts
4. Filter for anything in `/help/` section

#### Method 3: Google Search Console (Most Accurate - RECOMMENDED)
This shows you exactly what Google has indexed, which is what matters for SEO.

**Step-by-Step:**

1. **Log into Google Search Console**
   - Visit: https://search.google.com/search-console
   - Select your property: `quantumbitsolutions.com`

2. **Go to Pages Report**
   - In the left sidebar, click **Indexing → Pages**
   - You'll see a list of all indexed pages

3. **Export the Data**
   - Click the **Export** button (top right corner)
   - Choose **Download as Google Sheets** or **Download CSV**
   - This gives you a list of all indexed URLs

4. **Filter for Help Pages**
   - Open the CSV/Sheet
   - Filter or search for URLs containing `/help/` or other help-related paths
   - These are the URLs you need to redirect

5. **Bonus: Check Coverage Issues**
   - In the same Pages report, scroll down to see any errors
   - These might be help pages that have issues and need special attention

**What the CSV will contain:**
- URL: The full page URL
- Last crawl: When Google last visited
- Status: Whether it's indexed or not

**Why this is most accurate:**
- Shows what Google actually knows about
- Includes pages that might not be in your sitemap
- Shows crawl status and any issues
- This is the data that matters for SEO migration

#### Method 4: Online Sitemap Crawler
1. Visit: https://www.xml-sitemaps.com/
2. Enter: `https://quantumbitsolutions.com/help/`
3. Click "Start"
4. Download the generated sitemap
5. Open sitemap.xml and extract URLs

### Step 2: Match Old to New URLs
Once you have your old URLs list, match each one to the appropriate new docs URL from the list above.

Example matching:
```
Old: https://quantumbitsolutions.com/help/xpf-user-manual
New: https://docs.quantumbitsolutions.com/products/xpf/user-guide/

Old: https://quantumbitsolutions.com/help/mqtt-setup
New: https://docs.quantumbitsolutions.com/guides/mqtt-addon/

Old: https://quantumbitsolutions.com/help/troubleshooting
New: https://docs.quantumbitsolutions.com/support/faq/
```

### Step 3: Fill in the CSV Template
Edit the file `redirect-mapping-template.csv` in this folder with your mappings.

Format:
```csv
Old WordPress URL,New Docs URL,Status Code,Notes
https://quantumbitsolutions.com/help/page1,https://docs.quantumbitsolutions.com/guides/page1,301,Description
```

### Step 4: Implement Redirects
After creating your CSV, you can:
- **Option A**: Use WordPress Redirection plugin (import the CSV)
- **Option B**: Use Cloudflare Bulk Redirects (upload the CSV)

---

## Tools to Help You

### Check if URLs are indexed in Google:
```
site:quantumbitsolutions.com/help/
```
Run this search in Google to see all indexed help pages.

### Test Redirects After Setup:
- https://redirect-checker.org/
- https://httpstatus.io/

### Monitor in Google Search Console:
- https://search.google.com/search-console

---

## Need Help?

Once you have your list of old WordPress URLs, I can help you:
1. Match them to the appropriate new docs URLs
2. Generate the complete CSV file
3. Set up the redirects in WordPress or Cloudflare
