const request = require('request');
const querystring = require('querystring');

function handleRes(error, res, body, callback) {
  if (error) {
    return callback(error, null);
  } else if (res.statusCode >= 300) {
    return callback(body, null);
  } else {
    return callback(null, JSON.parse(body));
  }
};

function executeRequest(urlString, callback) {
  return request(urlString, (error, response, body) => {
    return handleRes(error, response, body, callback);
  });
}

module.exports = function FoursquareVenues(client_id, client_secret) {
  const credentials = {
    'v': '20140806'
  };
  if (client_id) {
    credentials.client_id = client_id;
  }
  if (client_secret) {
    credentials.client_secret = client_secret;
  }

  const qs = querystring.stringify(credentials);

  return {
    _baseURL: 'https://api.foursquare.com/v2/venues/',
    getCategories: function() {
      const urlString = this._baseURL + 'categories?' + qs;
      return executeRequest(urlString, arguments[arguments.length - 1]);
    },
    getVenues: function(params, callback) {
      const urlString = this._baseURL + 'search?' + querystring.stringify(params) + '&' + qs;
      return executeRequest(urlString, callback);
    },
    exploreVenues: function(params, callback) {
      const urlString = this._baseURL + 'explore?' + querystring.stringify(params) + '&' + qs;
      return executeRequest(urlString, callback);
    },
    getVenue: function(params, callback) {
      const urlString = this._baseURL + params.venue_id + '?' + qs;
      return executeRequest(urlString, callback);
    },
    getVenueAspect: function(params, callback) {
      const urlString = this._baseURL + params.venue_id + '/' + params.aspect_name + '?' + qs;
      return executeRequest(urlString, callback);
    }
  };
};
