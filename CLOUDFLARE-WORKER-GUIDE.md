# Cloudflare Worker Setup - Step-by-Step Guide

**This is the EASIEST and BEST method for your 18 redirects!**

## Why Cloudflare Workers?

✅ Free tier: 100,000 requests/day (way more than you need)  
✅ Handles all 18 redirects with one script  
✅ No Page Rule limits  
✅ Faster than WordPress plugin  
✅ Works even if WordPress is down  
✅ Easy to update - just edit the script  

---

## Step-by-Step Setup (10 minutes)

### Step 1: Log into Cloudflare

1. Go to: https://dash.cloudflare.com/
2. Log in with your credentials
3. You'll see your domain `quantumbitsolutions.com` in the list

### Step 2: Go to Workers & Pages

1. In the left sidebar, click **Workers & Pages**
2. Click **Create application**
3. Choose **Create Worker**

### Step 3: Create the Worker

1. **Name your worker**: `help-redirect` (or any name you like)
2. Click **Deploy**
3. Don't worry about the default code - we'll replace it

### Step 4: Edit the Worker Code

1. After deployment, click **Edit code** button
2. You'll see a code editor with some default code
3. **Delete all the default code**
4. **Copy and paste** the entire contents of `cloudflare-worker-redirect.js` from this folder
5. Click **Save and Deploy** (top right)

### Step 5: Add a Route (Connect to Your Domain)

Now we need to tell Cloudflare to use this Worker for your domain:

1. Go back to **Workers & Pages** main page
2. Click on your worker (`help-redirect`)
3. Click on **Triggers** tab
4. Under **Routes**, click **Add route**
5. **Route**: `*quantumbitsolutions.com/*`
6. **Zone**: Select `quantumbitsolutions.com` from dropdown
7. Click **Add route**

### Step 6: Test Your Redirects

**Method 1: Browser Test**
1. Open a new browser tab (incognito/private mode recommended)
2. Visit: `https://quantumbitsolutions.com/help/`
3. Should automatically redirect to: `https://docs.quantumbitsolutions.com/support/`

**Method 2: Online Tool**
1. Go to: https://redirect-checker.org/
2. Enter: `https://quantumbitsolutions.com/help/`
3. Click "Check Redirect"
4. Should show: **301 Moved Permanently** → new URL

**Method 3: PowerShell Command**
```powershell
Invoke-WebRequest -Uri "https://quantumbitsolutions.com/help/" -Method Head -MaximumRedirection 0 -UseBasicParsing
```
Look for:
- `StatusCode: 301`
- `Location: https://docs.quantumbitsolutions.com/support/`

### Step 7: Test All 18 URLs

Test these critical pages:

✅ https://quantumbitsolutions.com/help/  
✅ https://quantumbitsolutions.com/xpf-help/  
✅ https://quantumbitsolutions.com/guide/  
✅ https://quantumbitsolutions.com/sniff-help/  
✅ https://quantumbitsolutions.com/faq/  

If these work, the rest will too!

---

## Troubleshooting

### Problem: Worker Not Running
**Solution:**
1. Check that route is added correctly: `*quantumbitsolutions.com/*`
2. Make sure orange cloud (proxy) is enabled in DNS settings
3. Wait 1-2 minutes for propagation

### Problem: Seeing Old WordPress Page
**Solution:**
1. Clear browser cache (or use incognito mode)
2. Purge Cloudflare cache:
   - Dashboard → Caching → Configuration → Purge Everything
3. Wait 1-2 minutes and try again

### Problem: Getting Errors
**Solution:**
1. Check Worker logs:
   - Workers & Pages → Your Worker → Logs tab
2. Make sure you copied the ENTIRE script from `cloudflare-worker-redirect.js`
3. Check for any typos in the code

### Problem: Some Redirects Work, Others Don't
**Solution:**
1. Check the URL mapping in the Worker script
2. Make sure both `/path/` and `/path` versions are included
3. Test with trailing slash and without

---

## Viewing Worker Analytics

After setup, you can monitor your redirects:

1. Go to **Workers & Pages**
2. Click on your worker
3. Click **Metrics** tab
4. You'll see:
   - Total requests
   - Success rate
   - Errors (if any)

---

## Updating Redirects Later

Need to add or change a redirect? Easy!

1. Go to **Workers & Pages**
2. Click on your worker
3. Click **Edit code**
4. Update the `redirectMap` object:
   ```javascript
   '/new-old-path/': 'https://docs.quantumbitsolutions.com/new-target/',
   ```
5. Click **Save and Deploy**

Done! Changes take effect immediately.

---

## Cost & Limits

**Cloudflare Workers Free Tier:**
- ✅ 100,000 requests/day
- ✅ Unlimited scripts
- ✅ 10ms CPU time per request
- ✅ More than enough for your needs

**Your usage estimate:**
- Average website: ~10,000 requests/day
- Your redirects: Maybe 100-500/day
- You'll use < 1% of free tier

---

## Alternative: Quick Redirect Rules (If You Don't Want Workers)

If you prefer not to use Workers, here's the fastest Redirect Rules approach:

### Create 5 Main Redirect Rules:

1. **Rule 1: Main Help Page**
   - When: `URI Path equals /help/`
   - Then: Redirect to `https://docs.quantumbitsolutions.com/support/` (301)

2. **Rule 2: XPF Help**
   - When: `URI Path equals /xpf-help/`
   - Then: Redirect to `https://docs.quantumbitsolutions.com/products/xpf/user-guide/` (301)

3. **Rule 3: Android Guide**
   - When: `URI Path equals /guide/`
   - Then: Redirect to `https://docs.quantumbitsolutions.com/products/android/advanced-guide/` (301)

4. **Rule 4: Mapper Help**
   - When: `URI Path equals /sniff-help/`
   - Then: Redirect to `https://docs.quantumbitsolutions.com/products/mapper/user-manual/` (301)

5. **Rule 5: FAQ**
   - When: `URI Path equals /faq/`
   - Then: Redirect to `https://docs.quantumbitsolutions.com/support/faq/` (301)

Then use WordPress Redirection plugin for the remaining 13 URLs.

---

## Recommended: Use Workers!

**Bottom line:** The Worker method is:
- ✅ Easier to maintain
- ✅ No limits on number of redirects
- ✅ Free
- ✅ Faster
- ✅ More reliable

**Total setup time:** 10 minutes  
**Difficulty:** Copy-paste (very easy)

---

## Next: Update Google Search Console

After redirects are working:

1. Log into: https://search.google.com/search-console
2. Add property: `docs.quantumbitsolutions.com`
3. Submit new sitemap: `https://docs.quantumbitsolutions.com/sitemap.xml`
4. Monitor for 404 errors over next 2-4 weeks
5. Old site SEO will transfer to new site automatically

---

## Questions?

Common questions:

**Q: Will this hurt my SEO?**  
A: No! 301 redirects pass 100% of SEO value to new pages.

**Q: How long should I keep redirects active?**  
A: Minimum 6 months. Ideally, keep them forever (no cost).

**Q: Can I test without affecting real visitors?**  
A: Yes, use incognito mode and the redirect checker tool.

**Q: What if I make a mistake?**  
A: Just edit the Worker code and redeploy. Changes are instant.

---

## Ready to Start?

1. ✅ Open `cloudflare-worker-redirect.js` in this folder
2. ✅ Follow Step 1-6 above
3. ✅ Test your redirects
4. ✅ Done!

Your redirects will be live in under 10 minutes!
