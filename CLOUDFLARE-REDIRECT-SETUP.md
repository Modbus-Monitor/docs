# Cloudflare Redirect Setup Guide

Complete guide to set up 301 redirects from your old WordPress help pages to the new GitHub Pages docs site using Cloudflare.

---

## Why Use Cloudflare for Redirects?

✅ **Advantages:**
- Faster (redirects happen at CDN level, before hitting your server)
- More reliable (doesn't depend on WordPress being up)
- No plugin overhead on WordPress
- Works even if WordPress crashes
- Better for performance

❌ **Disadvantages:**
- Slightly more complex setup (but I'll walk you through it)
- Need Cloudflare account with your domain

---

## Prerequisites

Before starting, make sure you have:
- [x] Cloudflare account set up
- [x] `quantumbitsolutions.com` domain added to Cloudflare
- [x] DNS managed by Cloudflare
- [x] The CSV file ready (`redirect-mapping-template.csv`)

---

## Method 1: Cloudflare Bulk Redirects (RECOMMENDED)

**Best for:** 10+ redirects (you have 18)

### Step 1: Prepare Your Redirect List

Your CSV is almost ready, but Cloudflare Bulk Redirects need a specific format. Let me create the proper format for you.

**Cloudflare Format Requirements:**
```csv
source_url,target_url,status_code
https://quantumbitsolutions.com/help/,https://docs.quantumbitsolutions.com/support/,301
```

### Step 2: Log into Cloudflare Dashboard

1. Go to: https://dash.cloudflare.com/
2. Log in with your credentials
3. Click on your domain: **quantumbitsolutions.com**

### Step 3: Navigate to Bulk Redirects

1. In the left sidebar, scroll down to **Rules** section
2. Click **Redirect Rules** (or **Lists** → **Bulk Redirects** depending on your plan)

**For Free/Pro Plans:**
- Go to **Rules → Redirect Rules**
- You'll create redirect rules one at a time or use Transform Rules

**For Business/Enterprise Plans:**
- Go to **Rules → Lists**
- You can upload CSV with bulk redirects

### Step 4: Create Redirect Rules

#### Option A: Using Redirect Rules (All Plans)

**For each redirect, you'll create a rule:**

1. Click **Create Redirect Rule**
2. **Rule name**: `Help Page Migration - [Page Name]`
3. **When incoming requests match:**
   ```
   Field: URI Path
   Operator: equals
   Value: /help/
   ```
4. **Then:**
   - **Type**: Dynamic or Static
   - **URL**: `https://docs.quantumbitsolutions.com/support/`
   - **Status Code**: 301 (Permanent Redirect)
5. Click **Save**

**Repeat for all 18 URLs** (or group similar ones with wildcards - see below)

#### Option B: Using Bulk Redirects (Business+ Plans Only)

If you have a Business or Enterprise plan:

1. Go to **Rules → Lists**
2. Click **Create new list**
3. **List name**: `Help Page Redirects`
4. **Content type**: Redirect
5. Click **Create**
6. Click **Upload CSV**
7. Upload the Cloudflare-formatted CSV (I'll create this for you below)
8. Click **Upload**

Then create a Bulk Redirect Rule:
1. Go to **Rules → Bulk Redirects**
2. Click **Create Bulk Redirect**
3. Select your list: `Help Page Redirects`
4. Click **Save**

---

## Method 2: Using Page Rules (Legacy Method)

**Best for:** Small number of critical redirects (max 3-5 on free plan)

### Limitations:
- Free plan: 3 Page Rules total
- Pro plan: 20 Page Rules
- Business plan: 50 Page Rules

### Setup:

1. In Cloudflare dashboard, go to **Rules → Page Rules**
2. Click **Create Page Rule**
3. **URL Pattern**: `quantumbitsolutions.com/help/*`
4. **Setting**: Forwarding URL
5. **Status Code**: 301 - Permanent Redirect
6. **Destination URL**: `https://docs.quantumbitsolutions.com/support/$1`
7. Click **Save and Deploy**

**Note:** This creates a catch-all redirect for anything under `/help/`

---

## Method 3: Using Transform Rules (Modern, Flexible)

**Best for:** Complex redirects with patterns

### Setup:

1. Go to **Rules → Transform Rules**
2. Click **Create Transform Rule**
3. **Rule name**: `Help Pages to Docs Redirect`
4. **When incoming requests match:**
   - Click **Edit expression**
   - Use this expression:
     ```
     (http.request.uri.path matches "^/(help|guide|xpf-help|sniff-help|mmhelp|arduino-modbus-server|sheets|hardware|address|bluetooth|faq|importexport|errors|server|sensor-1|serialport|help-test|modbus-mapper-pro-quick-start-demo)(/.*)?$")
     ```
5. **Then:**
   - **Action**: Redirect
   - **Type**: Dynamic
   - **Expression**: (see mapping below)
   - **Status Code**: 301

---

## Ready-to-Use Cloudflare Files

I'll create the properly formatted files for you now...

---

## Step-by-Step: Creating Redirect Rules (Free Plan Friendly)

Since you have 18 redirects, here's the most efficient approach for free plans:

### Priority Redirects (Create These First)

These are your most important help pages that should redirect:

1. **Main Help Page**
   - Source: `quantumbitsolutions.com/help/`
   - Target: `https://docs.quantumbitsolutions.com/support/`

2. **XPF Help**
   - Source: `quantumbitsolutions.com/xpf-help/`
   - Target: `https://docs.quantumbitsolutions.com/products/xpf/user-guide/`

3. **Android Advanced Guide**
   - Source: `quantumbitsolutions.com/guide/`
   - Target: `https://docs.quantumbitsolutions.com/products/android/advanced-guide/`

4. **Mapper Help**
   - Source: `quantumbitsolutions.com/sniff-help/`
   - Target: `https://docs.quantumbitsolutions.com/products/mapper/user-manual/`

5. **FAQ**
   - Source: `quantumbitsolutions.com/faq/`
   - Target: `https://docs.quantumbitsolutions.com/support/faq/`

---

## Alternative: Using Cloudflare Workers (Advanced)

If you're comfortable with a bit of JavaScript, you can create a Worker that handles all redirects with a single script.

**Advantages:**
- Unlimited redirects
- No Page Rule limits
- Free tier: 100,000 requests/day

I can provide the Worker script if you're interested.

---

## Testing Your Redirects

After setting up redirects in Cloudflare:

### Test Method 1: Browser
1. Visit: `https://quantumbitsolutions.com/help/`
2. Should automatically redirect to: `https://docs.quantumbitsolutions.com/support/`

### Test Method 2: Online Tools
- https://redirect-checker.org/
- https://httpstatus.io/

### Test Method 3: Command Line (PowerShell)
```powershell
Invoke-WebRequest -Uri "https://quantumbitsolutions.com/help/" -Method Head -MaximumRedirection 0
```

Look for:
- **StatusCode**: 301
- **Location header**: Should show the new URL

---

## Troubleshooting

### Issue: Redirects Not Working
**Solutions:**
1. **Clear Cloudflare cache:**
   - Dashboard → Caching → Configuration → Purge Everything
2. **Check DNS:**
   - Ensure Cloudflare proxy is enabled (orange cloud icon)
3. **Wait for propagation:**
   - Can take 1-5 minutes

### Issue: Redirect Loops
**Solution:**
- Make sure you're not redirecting the new docs site back to itself
- Check that rules only apply to `quantumbitsolutions.com`, not `docs.quantumbitsolutions.com`

### Issue: 302 Instead of 301
**Solution:**
- Double-check status code is set to 301 in rule
- Clear cache and test again

---

## Recommended Approach for You

Based on your 18 redirects, here's what I recommend:

### **Option 1: Cloudflare Workers (BEST)**
- Create one Worker script
- Handles all 18 redirects
- Free tier sufficient
- I'll create the script for you

### **Option 2: Redirect Rules + Wildcards**
- Create 5-10 rules using wildcards
- Groups similar redirects
- Works on free plan
- Still effective

### **Option 3: Mix with WordPress Plugin**
- Use Cloudflare for top 5 most important
- Use WordPress Redirection plugin for the rest
- Balanced approach

---

## Next Steps

Choose your preferred method and I'll provide:
1. ✅ Ready-to-paste Cloudflare configurations
2. ✅ Cloudflare Worker script (if you choose that option)
3. ✅ Testing checklist
4. ✅ Google Search Console update instructions

**Which method would you like to use?**
1. Cloudflare Workers (recommended - easiest, most flexible)
2. Redirect Rules (simple, works on all plans)
3. Page Rules (legacy, but quick)
4. Mix of Cloudflare + WordPress Plugin
