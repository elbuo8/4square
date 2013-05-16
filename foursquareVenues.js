// Generated by CoffeeScript 1.6.2
(function() {
  var querystring, request;

  require('coffee-script');

  request = require('request');

  querystring = require('querystring');

  module.exports = function(client_id, client_secret) {
    var credentials, date, day, month, today;

    today = new Date();
    month = today.getMonth() + 1;
    if (month < 10) {
      month = '0' + month;
    }
    day = today.getDate();
    if (day < 10) {
      day = '0' + day;
    }
    date = today.getFullYear() + '' + month + '' + day;
    credentials = {
      'v': date,
      'client_id': client_id,
      'client_secret': client_secret
    };
    return {
      getVenues: function(params, callback) {
        var urlString;

        urlString = "https://api.foursquare.com/v2/venues/search?" + querystring.stringify(params) + '&' + querystring.stringify(credentials);
        return request(urlString, function(error, response, body) {
          var data, err, _ref;

          body = JSON.parse(body);
          if (body.meta.code >= 300) {
            err = body;
          }
          if ((200 <= (_ref = body.meta.code) && _ref < 400)) {
            data = body;
          }
          return callback(err, data);
        });
      },
      exploreVenues: function(params, callback) {
        var urlString;

        urlString = "https://api.foursquare.com/v2/venues/explore?" + querystring.stringify(params) + '&' + querystring.stringify(credentials);
        return request(urlString, function(error, response, body) {
          var data, err, _ref;

          body = JSON.parse(body);
          if (body.meta.code >= 300) {
            err = body;
          }
          if ((200 <= (_ref = body.meta.code) && _ref < 400)) {
            data = body;
          }
          return callback(err, data);
        });
      },
      getVenue: function(params, callback) {
        var urlString;

        urlString = "https://api.foursquare.com/v2/venues/" + params.venue_id + '?' + querystring.stringify(credentials);
        return request(urlString, function(error, response, body) {
          var data, err, _ref;

          body = JSON.parse(body);
          if (body.meta.code >= 300) {
            err = body;
          }
          if ((200 <= (_ref = body.meta.code) && _ref < 400)) {
            data = body;
          }
          return callback(err, data);
        });
      }
    };
  };

}).call(this);
