const http = require('http');
const test = require('ava').test;
const fsq = require('../')('test', 'test');

let server;
test.cb.before(t => {
  server = http.createServer((req, res) => {
    res.statusCode = 300;
    res.end('test error');
  });

  fsq._baseURL = 'http://localhost:9000/';
  server.listen(9000, t.end);
});

test.cb.after(t => {
  server.close(t.end);
});

test.cb.serial('getCategories', t => {
  fsq.getCategories((err, body) => {
    t.is(err, 'test error');
    t.end();
  });
});

test.cb.serial('getCategories', t => {
  fsq._baseURL = 'http://localhost:9001/';
  fsq.getCategories((err, body) => {
    t.truthy(err);
    t.not(err, 'test error');
    t.end();
  });
});

