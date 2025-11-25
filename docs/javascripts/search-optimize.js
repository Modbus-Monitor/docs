/* Search Result Optimization - Clean up HTML-heavy imported documents */
document.addEventListener('DOMContentLoaded', function() {
    const observer = new MutationObserver(function(mutations) {
        mutations.forEach(function(mutation) {
            if (mutation.addedNodes.length) {
                cleanupImportedDocumentResults();
            }
        });
    });

    // Observe search results container
    const searchResults = document.querySelector('[data-md-component="search-result"]');
    if (searchResults) {
        observer.observe(searchResults, { childList: true, subtree: true });
    }
});

function cleanupImportedDocumentResults() {
    const searchTexts = document.querySelectorAll('.md-search-result__teaser');
    
    searchTexts.forEach(function(element) {
        if (element.dataset.cleaned) return; // Skip if already processed
        
        const originalText = element.textContent;
        
        // Check if this looks like it came from an HTML-heavy imported document
        // (contains lots of class names, divs, etc.)
        if (originalText.includes('elementor') || originalText.includes('class=') || 
            originalText.includes('<div') || originalText.length > 300) {
            
            // Clean up HTML artifacts and create a reasonable snippet
            let cleanText = originalText
                .replace(/class="[^"]*"/g, '') // Remove class attributes
                .replace(/<[^>]*>/g, ' ')      // Remove HTML tags
                .replace(/\s+/g, ' ')          // Normalize whitespace
                .replace(/elementor[^\s]*/g, '') // Remove elementor artifacts
                .trim();
            
            // Create a reasonable snippet (max 150 chars)
            if (cleanText.length > 150) {
                const sentences = cleanText.split('. ');
                let snippet = sentences[0];
                
                // Try to get a complete sentence or two
                for (let i = 1; i < sentences.length && snippet.length < 120; i++) {
                    snippet += '. ' + sentences[i];
                }
                
                cleanText = snippet + (cleanText.length > snippet.length ? '...' : '');
            }
            
            element.textContent = cleanText;
            element.dataset.cleaned = 'true';
        }
    });
}

/* Enhanced 404 Page Search Functionality */
document.addEventListener('DOMContentLoaded', function() {
    // Check if we're on a 404 page
    const isErrorPage = document.querySelector('h1').textContent.includes('Page Not Found') || 
                       window.location.pathname.includes('404') || 
                       document.title.includes('404');
    
    if (isErrorPage) {
        enhanceErrorPageSearch();
    }
    
    enhanceGlobalSearch();
});

function enhanceErrorPageSearch() {
    // Add keyboard shortcuts for search
    document.addEventListener('keydown', function(e) {
        // Focus search on Ctrl+K or Cmd+K or just '/'
        if (((e.ctrlKey || e.metaKey) && e.key === 'k') || e.key === '/') {
            e.preventDefault();
            const searchInput = document.querySelector('.md-search__input, input[name="query"]');
            if (searchInput) {
                searchInput.focus();
                searchInput.select();
            }
        }
        
        // Escape to clear search
        if (e.key === 'Escape') {
            const searchInput = document.querySelector('.md-search__input, input[name="query"]');
            if (searchInput && searchInput === document.activeElement) {
                searchInput.blur();
                searchInput.value = '';
            }
        }
    });
    
    // Add search suggestions based on popular content
    const searchSuggestions = [
        'Modbus Monitor XPF user guide',
        'Android Monitor setup',
        'MQTT add-on configuration',
        'ThingSpeak integration',
        '6-digit addressing guide',
        'Error codes reference',
        'Hardware compatibility',
        'Mapper Pro quick start',
        'Serial port configuration',
        'Bluetooth setup guide'
    ];
    
    // Add placeholder rotation for search inputs
    const searchInputs = document.querySelectorAll('.md-search__input, input[name="query"]');
    searchInputs.forEach(input => {
        let suggestionIndex = 0;
        
        function rotatePlaceholder() {
            if (input.value === '' && document.activeElement !== input) {
                input.placeholder = `Try: "${searchSuggestions[suggestionIndex]}"`;
                suggestionIndex = (suggestionIndex + 1) % searchSuggestions.length;
            }
        }
        
        // Rotate placeholder every 3 seconds
        setInterval(rotatePlaceholder, 3000);
        rotatePlaceholder();
        
        // Reset placeholder when focused
        input.addEventListener('focus', function() {
            if (this.placeholder.includes('Try:')) {
                this.placeholder = 'Search documentation...';
            }
        });
    });
    
    // Show helpful keyboard shortcuts hint
    setTimeout(function() {
        const hint = document.createElement('div');
        hint.style.cssText = `
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: var(--md-primary-fg-color);
            color: var(--md-primary-bg-color);
            padding: 0.75rem 1rem;
            border-radius: 0.5rem;
            font-size: 0.85rem;
            z-index: 1000;
            opacity: 0;
            transition: opacity 0.3s ease;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        `;
        hint.innerHTML = `<strong>💡 Tip:</strong> Press <kbd>/</kbd> to search, <kbd>Alt+H</kbd> for home`;
        document.body.appendChild(hint);
        
        setTimeout(() => { hint.style.opacity = '1'; }, 100);
        setTimeout(() => { hint.style.opacity = '0'; }, 4000);
        setTimeout(() => { document.body.removeChild(hint); }, 4300);
    }, 1000);
}

function enhanceGlobalSearch() {
    // Add quick navigation shortcuts
    document.addEventListener('keydown', function(e) {
        // Alt + H for home
        if (e.altKey && e.key === 'h') {
            e.preventDefault();
            window.location.href = '/';
        }
        
        // Alt + S for support
        if (e.altKey && e.key === 's') {
            e.preventDefault();
            window.location.href = '/support/';
        }
        
        // Alt + P for products
        if (e.altKey && e.key === 'p') {
            e.preventDefault();
            window.location.href = '/products/';
        }
    });
}