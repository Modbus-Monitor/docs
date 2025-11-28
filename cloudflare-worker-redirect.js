// Cloudflare Worker for Help Page Redirects
// This script handles all redirects from old WordPress help pages to new docs site

addEventListener('fetch', event => {
  event.respondWith(handleRequest(event.request))
})

async function handleRequest(request) {
  const url = new URL(request.url)
  
  // Only process requests for quantumbitsolutions.com
  if (!url.hostname.includes('quantumbitsolutions.com')) {
    return fetch(request)
  }
  
  // Redirect mapping - old path to new URL
  const redirectMap = {
    '/help/': 'https://docs.quantumbitsolutions.com/',
    '/help': 'https://docs.quantumbitsolutions.com/',
    '/guide/': 'https://docs.quantumbitsolutions.com/products/android/advanced-guide/',
    '/guide': 'https://docs.quantumbitsolutions.com/products/android/advanced-guide/',
    '/sniff-help/': 'https://docs.quantumbitsolutions.com/products/mapper/user-manual/',
    '/sniff-help': 'https://docs.quantumbitsolutions.com/products/mapper/user-manual/',
    '/xpf-help/': 'https://docs.quantumbitsolutions.com/products/xpf/user-guide/',
    '/xpf-help': 'https://docs.quantumbitsolutions.com/products/xpf/user-guide/',
    '/modbus-mapper-pro-quick-start-demo/': 'https://docs.quantumbitsolutions.com/products/mapper/quick-start/',
    '/modbus-mapper-pro-quick-start-demo': 'https://docs.quantumbitsolutions.com/products/mapper/quick-start/',
    '/mmhelp/': 'https://docs.quantumbitsolutions.com/products/android/free-guide/',
    '/mmhelp': 'https://docs.quantumbitsolutions.com/products/android/free-guide/',
    '/arduino-modbus-server/': 'https://docs.quantumbitsolutions.com/technical/server-setup/',
    '/arduino-modbus-server': 'https://docs.quantumbitsolutions.com/technical/server-setup/',
    '/sheets/': 'https://docs.quantumbitsolutions.com/guides/android-sheets-addon/',
    '/sheets': 'https://docs.quantumbitsolutions.com/guides/android-sheets-addon/',
    '/hardware/': 'https://docs.quantumbitsolutions.com/technical/hardware/',
    '/hardware': 'https://docs.quantumbitsolutions.com/technical/hardware/',
    '/address/': 'https://docs.quantumbitsolutions.com/guides/6-digit-addressing/',
    '/address': 'https://docs.quantumbitsolutions.com/guides/6-digit-addressing/',
    '/bluetooth/': 'https://docs.quantumbitsolutions.com/guides/android-hardware/',
    '/bluetooth': 'https://docs.quantumbitsolutions.com/guides/android-hardware/',
    '/faq/': 'https://docs.quantumbitsolutions.com/support/faq/',
    '/faq': 'https://docs.quantumbitsolutions.com/support/faq/',
    '/importexport/': 'https://docs.quantumbitsolutions.com/technical/import-export/',
    '/importexport': 'https://docs.quantumbitsolutions.com/technical/import-export/',
    '/errors/': 'https://docs.quantumbitsolutions.com/technical/error-codes/',
    '/errors': 'https://docs.quantumbitsolutions.com/technical/error-codes/',
    '/server/': 'https://docs.quantumbitsolutions.com/technical/server-setup/',
    '/server': 'https://docs.quantumbitsolutions.com/technical/server-setup/',
    '/sensor-1/': 'https://docs.quantumbitsolutions.com/technical/server-setup/',
    '/sensor-1': 'https://docs.quantumbitsolutions.com/technical/server-setup/',
    '/serialport/': 'https://docs.quantumbitsolutions.com/technical/serial-ports/',
    '/serialport': 'https://docs.quantumbitsolutions.com/technical/serial-ports/',
    '/help-test/': 'https://docs.quantumbitsolutions.com/support/',
    '/help-test': 'https://docs.quantumbitsolutions.com/support/'
  }
  
  // Check if the path matches any redirect
  const redirectUrl = redirectMap[url.pathname]
  
  if (redirectUrl) {
    // Return 301 permanent redirect
    return Response.redirect(redirectUrl, 301)
  }
  
  // No redirect found, pass through to origin
  return fetch(request)
}
