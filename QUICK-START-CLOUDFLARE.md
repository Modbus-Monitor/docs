# Quick Start - Cloudflare Redirect Setup

**The fastest way to set up your redirects using Cloudflare**

---

## 📋 Which Method Should You Use?

### **Free Plan?** → Use **Redirect Rules** ⭐ EASIEST
→ Open: `CLOUDFLARE-FREE-PLAN-SETUP.md`

### **Have Workers Access?** → Use **Workers** 🚀 BEST
→ Open: `CLOUDFLARE-WORKER-GUIDE.md`

---

## 🚀 Quick Start with Redirect Rules (5 Steps - 15 minutes)

### 1. Open Cloudflare Dashboard
- Go to: https://dash.cloudflare.com/
- Select domain: `quantumbitsolutions.com`

### 2. Create Worker
- Click **Workers & Pages** (left sidebar)
- Click **Create application** → **Create Worker**
- Name it: `help-redirect`
- Click **Deploy**

### 3. Add Code
- Click **Edit code**
- Delete all existing code
- Copy **ALL** code from `cloudflare-worker-redirect.js`
- Paste into editor
- Click **Save and Deploy**

### 4. Add Route
- Click **Triggers** tab
- Click **Add route**
- Route: `*quantumbitsolutions.com/*`
- Zone: Select `quantumbitsolutions.com`
- Click **Add route**

### 5. Test
Open browser and visit:
- https://quantumbitsolutions.com/help/
- Should redirect to: https://docs.quantumbitsolutions.com/support/

**Or run the test script:**
```powershell
.\test-redirects.ps1
```

---

## ✅ Files You Need

All files are in this folder:

1. **`cloudflare-worker-redirect.js`** - Copy this entire file to Cloudflare Worker
2. **`test-redirects.ps1`** - Run this to test all 18 redirects
3. **`CLOUDFLARE-WORKER-GUIDE.md`** - Detailed step-by-step guide
4. **`CLOUDFLARE-REDIRECT-SETUP.md`** - All Cloudflare methods explained

---

## 🎯 What This Does

Redirects these 18 old URLs to new docs:

| Old URL | New URL |
|---------|---------|
| `/help/` | `docs.../support/` |
| `/xpf-help/` | `docs.../products/xpf/user-guide/` |
| `/guide/` | `docs.../products/android/advanced-guide/` |
| `/sniff-help/` | `docs.../products/mapper/user-manual/` |
| `/faq/` | `docs.../support/faq/` |
| + 13 more... | See CSV files for complete list |

---

## 🔍 Testing Your Setup

### Method 1: Browser
Visit any old URL in incognito mode, should redirect automatically.

### Method 2: PowerShell Script
```powershell
.\test-redirects.ps1
```
This tests all 18 URLs and shows results.

### Method 3: Online Tool
- Go to: https://redirect-checker.org/
- Enter old URL
- Should show: **301** → new URL

---

## ❓ Troubleshooting

**Problem:** Redirects not working  
**Solution:** Wait 2 minutes, clear cache, try again

**Problem:** Worker not found  
**Solution:** Check route is added: `*quantumbitsolutions.com/*`

**Problem:** Some work, others don't  
**Solution:** Check Worker code - did you copy the ENTIRE file?

---

## 📊 After Setup

### Update Google Search Console
1. Go to: https://search.google.com/search-console
2. Add property: `docs.quantumbitsolutions.com`
3. Submit sitemap: `https://docs.quantumbitsolutions.com/sitemap.xml`
4. Monitor for 404 errors

### Keep Monitoring
- Check Search Console weekly for first month
- Fix any broken links
- Monitor traffic to new docs site

---

## 💰 Cost

**Free!** Cloudflare Workers free tier includes:
- 100,000 requests/day
- Your traffic: ~500 redirects/day
- Usage: < 1% of free tier

---

## 🎉 Success Checklist

- [ ] Worker created in Cloudflare
- [ ] Code copied from `cloudflare-worker-redirect.js`
- [ ] Route added: `*quantumbitsolutions.com/*`
- [ ] Tested 5+ redirects in browser
- [ ] Ran `test-redirects.ps1` script
- [ ] All tests passing (18/18)
- [ ] Added new domain to Google Search Console
- [ ] Submitted new sitemap

---

## 📞 Need Help?

1. Read: `CLOUDFLARE-WORKER-GUIDE.md` (detailed steps)
2. Check: Cloudflare Worker logs (for errors)
3. Test: Use `test-redirects.ps1` to identify issues

---

## Alternative Methods

Don't want to use Workers?

**Option 1:** WordPress Redirection Plugin
- Use: `redirect-mapping-template.csv`
- See: `MIGRATION-GUIDE.md`

**Option 2:** Cloudflare Page Rules
- Limited to 3 on free plan
- See: `CLOUDFLARE-REDIRECT-SETUP.md`

**Option 3:** Cloudflare Redirect Rules
- Manual setup for each URL
- See: `CLOUDFLARE-REDIRECT-SETUP.md`

**Recommended:** Use Workers (easiest + most powerful)

---

## Summary

**What:** Redirect 18 old help URLs to new docs site  
**How:** Cloudflare Workers (one script)  
**Time:** 10 minutes  
**Cost:** $0 (free tier)  
**SEO:** 100% preserved (301 redirects)  
**Maintenance:** Easy (just edit Worker script)

**Ready? Start with Step 1 above! 🚀**
