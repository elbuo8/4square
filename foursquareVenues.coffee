require 'coffee-script'
request = require 'request'
querystring = require 'querystring'

module.exports = (client_id, client_secret) ->

	#Add Date to query (4square standard)
	date = '20131014'

	credentials =
		'v': date,
		'client_id': client_id,
		'client_secret': client_secret

	# params is ignored
	getCategories: (params, callback) ->

		# Add parameters to query
		urlString = "https://api.foursquare.com/v2/venues/categories?" + querystring.stringify(credentials)

		#HTTP Request to 4square
		request urlString, (error, response, body) ->
			handleRes(response, body, callback)

	#ll, near, llAcc, alt, altAcc, query, limit, intent, radius, sw, ne, categoryId, url, providerId, linkedId
	getVenues: (params, callback) ->

		# Add parameters to query
		urlString = "https://api.foursquare.com/v2/venues/search?" + querystring.stringify(params) + '&' + querystring.stringify(credentials)

		#HTTP Request to 4square
		request urlString, (error, response, body) ->
			handleRes(response, body, callback)

	#ll, near, llAcc, alt, altAcc, radius, section, query, limit, novelty
	exploreVenues: (params, callback) ->

		# Add parameters to query
		urlString = "https://api.foursquare.com/v2/venues/explore?" + querystring.stringify(params) + '&' + querystring.stringify(credentials)

		#HTTP Request to 4square
		request urlString, (error, response, body) ->
			handleRes(response, body, callback)

	#venue_id
	getVenue: (params, callback) ->

		# Add parameters to query
		urlString = "https://api.foursquare.com/v2/venues/" + params.venue_id + '?' + querystring.stringify(credentials)


		#HTTP Request to 4square
		request urlString, (error, response, body) ->
			handleRes(response, body, callback)

handleRes = (res, body, callback) ->
	if res.statusCode >= 300 then callback(body, null) else callback(null, JSON.parse(body))

