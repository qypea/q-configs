var http = require('http');
var second = require('./second.js');

function hello(a) {
    return second.second_f(a) + 1;
}

http.createServer(function(req, res) {
    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.end('Hello World!');
    hello(5, 6);
}).listen(8080);
