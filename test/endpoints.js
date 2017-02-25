const http = require('http');
const test = require('ava').test;
const fsq = require('../')('test', 'test');

let server;
test.cb.before(t => {
  server = http.createServer((req, res) => {
    res.end(JSON.stringify(req.url));
  });

  fsq._baseURL = 'http://localhost:8000/';
  server.listen(8000, t.end);
});

test.cb.after(t => {
  server.close(t.end);
});

test.cb('getCategories', t => {
  fsq.getCategories((err, body) => {
    t.is(body, '/categories?v=20140806&client_id=test&client_secret=test');
    t.end();
  });
});

test.cb('getVenues', t => {
  fsq.getVenues({test: 1}, (err, body) => {
    t.is(body, '/search?test=1&v=20140806&client_id=test&client_secret=test');
    t.end();
  });
});

test.cb('getVenues without auth', t => {
  const fNoAuth = require('../')();
  fNoAuth._baseURL = 'http://localhost:8000/';
  fNoAuth.getVenues({test: 1}, (err, body) => {
    t.is(body, '/search?test=1&v=20140806');
    t.end();
  });
});

test.cb('exploreVenues', t => {
  fsq.exploreVenues({test: 1}, (err, body) => {
    t.is(body, '/explore?test=1&v=20140806&client_id=test&client_secret=test');
    t.end();
  });
});

test.cb('getVenue', t => {
  fsq.getVenue({venue_id: 1}, (err, body) => {
    t.is(body, '/1?v=20140806&client_id=test&client_secret=test');
    t.end();
  });
});

test.cb('getVenueAspect', t => {
  fsq.getVenueAspect({venue_id: 1, aspect_name: 'test'}, (err, body) => {
    t.is(body, '/1/test?v=20140806&client_id=test&client_secret=test');
    t.end();
  });
});
