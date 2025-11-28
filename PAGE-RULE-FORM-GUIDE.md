# Page Rule Form - Fill This In!

**You're on the right screen! Here's exactly what to type:**

---

## 🎯 First Page Rule: Main Help Page

### What You See → What To Type

**1. URL (required) field:**
```
quantumbitsolutions.com/help/*
```
*Note: Use `*` at the end - this is a wildcard*

**2. Click button:** `+ Add a Setting`

**3. Pick a Setting (dropdown):**
Select: `Forwarding URL`

**4. After selecting Forwarding URL, you'll see two new fields:**

**Status Code (dropdown):**
Select: `301 - Permanent Redirect`

**Destination URL field:**
```
https://docs.quantumbitsolutions.com/support/$1
```
*Note: The `$1` captures anything after `/help/` and adds it to destination*

**5. Click:** `Save and Deploy Page Rule`

---

## ✅ Done! Your First Redirect is Live!

Now test it:
- Visit: `https://quantumbitsolutions.com/help/`
- Should redirect to: `https://docs.quantumbitsolutions.com/support/`

---

## 🎯 Second Page Rule: XPF Help

Click **"Create a Page Rule"** again:

**URL (required):**
```
quantumbitsolutions.com/xpf-help/*
```

**Setting:** `Forwarding URL`

**Status Code:** `301 - Permanent Redirect`

**Destination URL:**
```
https://docs.quantumbitsolutions.com/products/xpf/user-guide/$1
```

**Click:** `Save and Deploy Page Rule`

---

## 🎯 Third Page Rule: FAQ

Click **"Create a Page Rule"** again:

**URL (required):**
```
quantumbitsolutions.com/faq/*
```

**Setting:** `Forwarding URL`

**Status Code:** `301 - Permanent Redirect`

**Destination URL:**
```
https://docs.quantumbitsolutions.com/support/faq/$1
```

**Click:** `Save and Deploy Page Rule`

---

## ⚠️ That's Your 3 Free Page Rules Used!

Free plan = 3 Page Rules maximum.

For the remaining 15 URLs, use **WordPress Redirection Plugin**.

---

## 📋 Quick Checklist

After creating all 3 Page Rules:

- [ ] Rule 1: `/help/*` → docs support ✅
- [ ] Rule 2: `/xpf-help/*` → XPF user guide ✅
- [ ] Rule 3: `/faq/*` → FAQ ✅
- [ ] Test all 3 URLs in browser ✅
- [ ] Install WordPress Redirection plugin ✅
- [ ] Import `redirect-mapping-template.csv` ✅
- [ ] Test remaining URLs ✅

---

## 🧪 Testing Commands

After setup, test in PowerShell:

**Test Page Rule #1:**
```powershell
Invoke-WebRequest -Uri "https://quantumbitsolutions.com/help/" -Method Head -MaximumRedirection 0 -UseBasicParsing
```
Should show: `StatusCode: 301` and `Location: https://docs.quantumbitsolutions.com/support/`

**Test Page Rule #2:**
```powershell
Invoke-WebRequest -Uri "https://quantumbitsolutions.com/xpf-help/" -Method Head -MaximumRedirection 0 -UseBasicParsing
```

**Test Page Rule #3:**
```powershell
Invoke-WebRequest -Uri "https://quantumbitsolutions.com/faq/" -Method Head -MaximumRedirection 0 -UseBasicParsing
```

**Or test all at once:**
```powershell
.\test-redirects.ps1
```

---

## 💡 Pro Tip: Wildcard Meaning

When you use:
- **URL:** `quantumbitsolutions.com/help/*`
- **Destination:** `https://docs.quantumbitsolutions.com/support/$1`

It works like this:
- `/help/` → `/support/`
- `/help/page1` → `/support/page1`
- `/help/page1/subpage` → `/support/page1/subpage`

The `*` captures everything after `/help/` and `$1` puts it in the destination.

---

## 🎉 You're All Set!

Your 3 most important help pages now redirect via Cloudflare (fast!), and the rest will redirect via WordPress (comprehensive!).

Best of both worlds! 🚀
