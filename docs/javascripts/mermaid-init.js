// Initialize Mermaid with better configuration
document.addEventListener('DOMContentLoaded', function() {
    if (typeof mermaid !== 'undefined') {
        mermaid.initialize({
            startOnLoad: false,
            theme: 'default',
            themeVariables: {
                primaryColor: '#4a90e2',
                primaryTextColor: '#333',
                primaryBorderColor: '#4a90e2',
                lineColor: '#666'
            },
            flowchart: {
                useMaxWidth: true,
                htmlLabels: true,
                curve: 'basis'
            },
            sequence: {
                useMaxWidth: true,
                wrap: true
            }
        });
        
        // Find all mermaid divs and render them
        const mermaidDivs = document.querySelectorAll('.mermaid');
        mermaidDivs.forEach((div, index) => {
            const graphDefinition = div.textContent;
            div.innerHTML = `<div id="mermaid-${index}"></div>`;
            mermaid.render(`mermaid-graph-${index}`, graphDefinition, (svgCode) => {
                document.getElementById(`mermaid-${index}`).innerHTML = svgCode;
            });
        });
    }
});