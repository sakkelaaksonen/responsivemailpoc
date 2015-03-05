var domaindata = require('./domaindata.js');
var _ = require("underscore");
var fs = require('fs');

// var __ = require("underscore-node");

// console.log(domaindata);
var named_data = _.map(domaindata, function(domain) {
  // console.log(domain)
    return {
        "domain": _.keys(domain)[0],
        "subscribers": _.values(domain)[0]
    };
});

console.log(named_data);


var fs = require('fs');
fs.writeFile("./sorted.json", JSON.stringify(named_data), function(err) {
    if(err) {
        console.log(err);
    } else {
        console.log("The file was saved!");
    }
}); 