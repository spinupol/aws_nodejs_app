var express = require('express');
var app = express();
var path = require('path');

app.get('/', function (req, res)
{ 
//res.send('Hello there, world!\n');
res.sendFile(path.join(__dirname + '/index.html'));
});

var port = 9000;
app.listen(port);
console.log('Listening on port', port);