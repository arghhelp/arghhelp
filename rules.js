var websites = [
    "quora.com"
];

var websitesWithOperator = websites.map((website) => {
    return "-site%3A" + website;
})

console.log("    var rules = \"" + websitesWithOperator.join(" ") + "\";");