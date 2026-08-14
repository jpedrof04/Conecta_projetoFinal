// DOM Helper Functions
function isVariableDefined(el) {
    return typeof !!el && (el) != 'undefined' && el != null;
}

function select(selectors) {
    return document.querySelector(selectors);
}

function selectAll(selectors) {
    return document.querySelectorAll(selectors);
}