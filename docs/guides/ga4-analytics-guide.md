# Google Analytics 4 Guide for QBS Docs

A quick, practical guide to understand which docs pages users access and how redirects contribute to traffic.

---

## 1) Core Reports

- Pages & Screens: Reports → Engagement → Pages and screens
  - Dimension: Page path
  - Sort: Views / Users / Avg engagement time
  - Save as: "Docs – Top Pages"

- Landing Pages: Reports → Engagement → Landing page
  - Compare: Session source/medium (see UTM setup below)
  - Use it to find top entry pages and optimize content.

---

## 2) Redirect Attribution (UTM)

Your WordPress redirects now include UTM parameters:

```
utm_source=wordpress
utm_medium=redirect
utm_campaign=help-migration
utm_content=<old-slug>
```

Use these in GA4:
- Comparisons: Add comparison → Include `Session source = wordpress` AND `Session medium = redirect`
- Explorations: Rows=`Page path`, Columns=`Session source/medium` → see split of redirected vs organic traffic.

---

## 3) Explorations (Templates)

### A) Redirect Traffic by Page
- Explore → Free form
- Rows: `Page path`
- Columns: `Session source / medium`
- Filters: `Host name` contains `docs.quantumbitsolutions.com`
- Metrics: `Views`, `Users`, `Avg engagement time`, `Conversions` (if defined)
- Save and reuse monthly for prioritization.

### B) Top Landing Pages from WordPress
- Explore → Free form
- Rows: `Landing page`
- Filters: `Session source` = `wordpress`, `Session medium` = `redirect`
- Metrics: `Users`, `Engagement rate`
- Action: Improve the content and add clear next steps on these pages.

---

## 4) 404 Monitoring

If your theme uses `/404.html`:
- Create an Exploration where Rows=`Page path`, Filter where `Page path` contains `/404`
- Add `Page referrer` as a secondary dimension to see where broken links originate.
- Fix redirects or create missing content accordingly.

---

## 5) Weekly Workflow

1. Check WordPress Redirection hits → Export Top 10
2. In GA4, review Pages & Screens → Top pages trend
3. Exploration "Redirect Traffic by Page" → confirm attribution
4. Fix or improve high‑traffic docs → add internal links, anchors, quick fixes
5. Check 404s → add redirects or content

---

## 6) Pro Tips

- Use anchors (`#section`) in popular pages and link them from other docs
- Keep titles clear and intent‑matching (e.g., "USB‑OTG Serial Adapters and Troubleshooting")
- Add cross‑links between Errors ↔ Serial ↔ Server ↔ Sensor Server pages
- Add short images/video for physical setup topics

---

Need help building GA4 dashboards? Ping support and we’ll assist with tailored reports.
