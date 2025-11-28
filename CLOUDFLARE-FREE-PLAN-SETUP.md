# Cloudflare Page Rules Setup (Free Plan)

**Perfect for Cloudflare Free Plan - No Workers Needed!**

---

## 🎯 You're Using Page Rules - Here's How

I see you're on the **Page Rules** screen. This is perfect! Let's set it up.

---

## Step-by-Step: Using Page Rules

### Step 1: Create Your First Page Rule

You're already here! Now fill in the form:

### Redirect 1: Main Help Page

**In the form you're seeing:**

1. **URL (required)** field, enter:
   ```
   quantumbitsolutions.com/help/*
   ```
   
2. Click **"+ Add a Setting"** button

3. **Pick a Setting** dropdown:
   - Select: **"Forwarding URL"**

4. **Then you'll see:**
   - **Status Code** dropdown: Select **"301 - Permanent Redirect"**
   - **Destination URL** field: Enter:
     ```
     https://docs.quantumbitsolutions.com/support/$1
     ```

5. Click **"Save and Deploy Page Rule"**

---

## 🎉 That's Your First Redirect Done!

The wildcard `*` and `$1` mean:
- `/help/` → redirects to `/support/`
- `/help/anything` → redirects to `/support/anything`

---

## Step 2: Create More Page Rules

Click **"Create Page Rule"** again and repeat for each URL:

### Redirect 2: XPF Help
- **URL**: `quantumbitsolutions.com/xpf-help/*`
- **Setting**: Forwarding URL
- **Status**: 301
- **Destination**: `https://docs.quantumbitsolutions.com/products/xpf/user-guide/$1`

### Redirect 3: Android Advanced Guide
- **URL**: `quantumbitsolutions.com/guide/*`
- **Setting**: Forwarding URL
- **Status**: 301
- **Destination**: `https://docs.quantumbitsolutions.com/products/android/advanced-guide/$1`

### Redirect 4: Mapper Help
- **URL**: `quantumbitsolutions.com/sniff-help/*`
- **Setting**: Forwarding URL
- **Status**: 301
- **Destination**: `https://docs.quantumbitsolutions.com/products/mapper/user-manual/$1`

### Redirect 5: FAQ
- **URL**: `quantumbitsolutions.com/faq/*`
- **Setting**: Forwarding URL
- **Status**: 301
- **Destination**: `https://docs.quantumbitsolutions.com/support/faq/$1`

---

## Step 3: Create Remaining Critical Redirects

Repeat the process for these important pages:

### Redirect 2: XPF Help
- **When**: `URI Path` equals `/xpf-help/`
- **Then**: Redirect to `https://docs.quantumbitsolutions.com/products/xpf/user-guide/` (301)

### Redirect 3: Android Advanced Guide
- **When**: `URI Path` equals `/guide/`
- **Then**: Redirect to `https://docs.quantumbitsolutions.com/products/android/advanced-guide/` (301)

### Redirect 4: Mapper Help
- **When**: `URI Path` equals `/sniff-help/`
- **Then**: Redirect to `https://docs.quantumbitsolutions.com/products/mapper/user-manual/` (301)

### Redirect 5: FAQ
- **When**: `URI Path` equals `/faq/`
- **Then**: Redirect to `https://docs.quantumbitsolutions.com/support/faq/` (301)

### Redirect 6: Error Codes
- **When**: `URI Path` equals `/errors/`
- **Then**: Redirect to `https://docs.quantumbitsolutions.com/technical/error-codes/` (301)

### Redirect 7: Hardware
- **When**: `URI Path` equals `/hardware/`
- **Then**: Redirect to `https://docs.quantumbitsolutions.com/technical/hardware/` (301)

### Redirect 8: Serial Ports
- **When**: `URI Path` equals `/serialport/`
- **Then**: Redirect to `https://docs.quantumbitsolutions.com/technical/serial-ports/` (301)

### Redirect 9: Import/Export
- **When**: `URI Path` equals `/importexport/`
- **Then**: Redirect to `https://docs.quantumbitsolutions.com/technical/import-export/` (301)

### Redirect 10: Sheets Integration
- **When**: `URI Path` equals `/sheets/`
- **Then**: Redirect to `https://docs.quantumbitsolutions.com/guides/android-sheets-addon/` (301)

---

## ⚠️ Important: Free Plan Page Rule Limit

**Cloudflare Free Plan includes only 3 Page Rules!**

So you need to choose wisely. Here's the strategy:

---

## 🎯 Best 3 Page Rules to Create

### Rule 1: Main Help Page (MOST IMPORTANT)
- **URL**: `quantumbitsolutions.com/help/*`
- **Destination**: `https://docs.quantumbitsolutions.com/support/$1`

### Rule 2: XPF Help (Popular Product)
- **URL**: `quantumbitsolutions.com/xpf-help/*`
- **Destination**: `https://docs.quantumbitsolutions.com/products/xpf/user-guide/$1`

### Rule 3: FAQ
- **URL**: `quantumbitsolutions.com/faq/*`
- **Destination**: `https://docs.quantumbitsolutions.com/support/faq/$1`

---

## 📋 For the Remaining 15 URLs

Use **WordPress Redirection Plugin**:

### Complete List of All 18 URLs

| URL Path | Redirect To | Method |
|----------|-------------|---------|
| `/help/*` | `https://docs.quantumbitsolutions.com/support/$1` | ✅ Cloudflare Page Rule #1 |
| `/xpf-help/*` | `https://docs.quantumbitsolutions.com/products/xpf/user-guide/$1` | ✅ Cloudflare Page Rule #2 |
| `/faq/*` | `https://docs.quantumbitsolutions.com/support/faq/$1` | ✅ Cloudflare Page Rule #3 |
| `/guide/` | `https://docs.quantumbitsolutions.com/products/android/advanced-guide/` | ⚙️ WordPress Plugin |
| `/sniff-help/` | `https://docs.quantumbitsolutions.com/products/mapper/user-manual/` | ⚙️ WordPress Plugin |
| `/modbus-mapper-pro-quick-start-demo/` | `https://docs.quantumbitsolutions.com/products/mapper/quick-start/` | ⚙️ WordPress Plugin |
| `/mmhelp/` | `https://docs.quantumbitsolutions.com/products/android/free-guide/` | ⚙️ WordPress Plugin |
| `/arduino-modbus-server/` | `https://docs.quantumbitsolutions.com/technical/server-setup/` | ⚙️ WordPress Plugin |
| `/sheets/` | `https://docs.quantumbitsolutions.com/guides/android-sheets-addon/` | ⚙️ WordPress Plugin |
| `/hardware/` | `https://docs.quantumbitsolutions.com/technical/hardware/` | ⚙️ WordPress Plugin |
| `/address/` | `https://docs.quantumbitsolutions.com/guides/6-digit-addressing/` | ⚙️ WordPress Plugin |
| `/bluetooth/` | `https://docs.quantumbitsolutions.com/guides/android-hardware/` | ⚙️ WordPress Plugin |
| `/importexport/` | `https://docs.quantumbitsolutions.com/technical/import-export/` | ⚙️ WordPress Plugin |
| `/errors/` | `https://docs.quantumbitsolutions.com/technical/error-codes/` | ⚙️ WordPress Plugin |
| `/server/` | `https://docs.quantumbitsolutions.com/technical/server-setup/` | ⚙️ WordPress Plugin |
| `/sensor-1/` | `https://docs.quantumbitsolutions.com/technical/server-setup/` | ⚙️ WordPress Plugin |
| `/serialport/` | `https://docs.quantumbitsolutions.com/technical/serial-ports/` | ⚙️ WordPress Plugin |
| `/help-test/` | `https://docs.quantumbitsolutions.com/support/` | ⚙️ WordPress Plugin |

---

## 🔧 Setting Up WordPress Redirection Plugin

For the remaining 15 URLs, use WordPress:

### Step 1: Install Plugin

1. Log into WordPress Admin
2. Go to **Plugins → Add New**
3. Search for **"Redirection"** by John Godley
4. Click **Install Now**
5. Click **Activate**

### Step 2: Import Redirects

1. Go to **Tools → Redirection**
2. Complete the setup wizard (just click through)
3. Click **Import/Export** tab
4. Click **Import from file**
5. Upload `redirect-mapping-template.csv` from this folder
6. Click **Import**

### Step 3: Verify

Check that all 15 URLs are listed in the Redirection plugin dashboard.

---

## 📝 CSV File for WordPress

The file `redirect-mapping-template.csv` already has all 18 mappings. After you import it:
- The 3 handled by Cloudflare will be redundant (but harmless)
- The other 15 will work via WordPress
- All redirect properly!

---

## ⚡ Why This Mixed Approach is Best

**Cloudflare (3 rules):**
- ✅ Fastest (CDN-level)
- ✅ Works even if WordPress crashes
- ✅ Handles your most important pages

**WordPress Plugin (15 rules):**
- ✅ No limits
- ✅ Easy to manage
- ✅ Handles less-critical pages

**Together:** You get 100% coverage with optimal performance!

---

## Testing Your Redirects

After creating rules:

### Test in Browser
1. Open incognito/private window
2. Visit: `https://quantumbitsolutions.com/help/`
3. Should automatically go to: `https://docs.quantumbitsolutions.com/support/`

### Test with Online Tool
1. Visit: https://redirect-checker.org/
2. Enter old URL
3. Should show: **301** redirect to new URL

### Test with PowerShell
```powershell
.\test-redirects.ps1
```

---

## Priority Order (If Limited on Rules)

If you can't create all 18 rules, start with these in order:

1. ✅ `/help/` - Main help page
2. ✅ `/xpf-help/` - Most popular product
3. ✅ `/guide/` - Android guide
4. ✅ `/sniff-help/` - Mapper guide
5. ✅ `/faq/` - Common questions
6. ✅ `/errors/` - Error codes
7. ✅ `/hardware/` - Hardware setup
8. ✅ `/serialport/` - Serial ports
9. ✅ `/importexport/` - Import/export
10. ✅ `/sheets/` - Sheets addon

Then use **WordPress Redirection plugin** for the remaining 8 URLs.

---

## Mixed Approach (Best Balance)

**For Maximum Coverage:**

1. **Cloudflare Redirect Rules** (Top 10 most important pages)
   - Uses Cloudflare for speed
   - SEO-safe 301 redirects

2. **WordPress Redirection Plugin** (Remaining 8 pages)
   - Install "Redirection" plugin
   - Import `redirect-mapping-template.csv`
   - Handles the rest

This way you get the benefits of both!

---

## Troubleshooting

### Can't Find "Redirect Rules"?
- Try looking for **"Page Rules"** instead
- Or check under **"Rules"** → **"Transform Rules"** → **"URL Redirect"**

### Rules Not Working?
1. Check that DNS has orange cloud (proxy enabled)
2. Clear Cloudflare cache: **Caching** → **Configuration** → **Purge Everything**
3. Wait 1-2 minutes for propagation
4. Test in incognito mode

### Hit Rule Limit?
- Use mixed approach (Cloudflare + WordPress plugin)
- Focus on highest-traffic pages in Cloudflare
- Use WordPress plugin for the rest

---

## What About Workers?

**Workers are still available on Free plan**, but harder to find:

If you still want to try Workers:
1. Go to: https://dash.cloudflare.com/
2. In the top navigation, look for **"Workers & Pages"** tab
3. Or visit directly: https://workers.cloudflare.com/

**But Redirect Rules are easier for your use case!**

---

## Summary

✅ **Use Redirect Rules** - Easier, built into dashboard  
✅ **Create 10-18 rules** - One per URL  
✅ **Status code: 301** - Always use permanent redirect  
✅ **Test after setup** - Use `test-redirects.ps1`  
✅ **Mix with WordPress** - If you hit rule limits  

**Start with Redirect Rules - it's the easiest path forward!**
