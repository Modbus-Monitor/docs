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