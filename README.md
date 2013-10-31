# Foursquare Venues API

Simple node.js module to access foursquare venue API.

Forked from [elbuo8's 4square](https://github.com/elbuo8/4square)

##License##

MIT

## Example

```js
	var foursquare = (require('foursquarevenues'))('CLIENTIDKEY', 'CLIENTSECRETKEY');

	var params = {
		"ll": "40.7,-74"
	};

	foursquare.getVenues(params, function(error, venues) {
		if (!error) {
			console.log(venues);
		}
	});

	foursquare.exploreVenues(params, function(error, venues) {
		if (!error) {
  			console.log(venues);
		}
	});
```
