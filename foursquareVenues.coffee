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
	 
	#ll, near, llAcc, alt, altAcc, query, limit, intent, radius, sw, ne, categoryId, url, providerId, linkedId 
	getVenues: (params, callback) ->
		
		# Add parameters to query
		urlString = "https://api.foursquare.com/v2/venues/search?" + querystring.stringify(params) + '&' + querystring.stringify(credentials)	
			
		#HTTP Request to 4square
		request urlString, (error, response, body) ->
			#Parse response from 4square to user
			body = JSON.parse(body)
			err = body if body.meta.code >= 300
			data = body if 200 <= body.meta.code < 400
			callback(err, data)
			
	#ll, near, llAcc, alt, altAcc, radius, section, query, limit, novelty
	exploreVenues: (params, callback) ->
		
		# Add parameters to query
		urlString = "https://api.foursquare.com/v2/venues/explore?" + querystring.stringify(params) + '&' + querystring.stringify(credentials)	

		#HTTP Request to 4square
		request urlString, (error, response, body) ->

			#Parse response from 4square to user
			body = JSON.parse(body)
			err = body if body.meta.code >= 300
			data = body if 200 <= body.meta.code < 400
			callback(err, data)
	
	#venue_id
	getVenue: (params, callback) ->
		
		# Add parameters to query
		urlString = "https://api.foursquare.com/v2/venues/" + params.venue_id + '?' + querystring.stringify(credentials)	

		
		#HTTP Request to 4square
		request urlString, (error, response, body) ->

			#Parse response from 4square to user
			body = JSON.parse(body)
			err = body if body.meta.code >= 300
			data = body if 200 <= body.meta.code < 400
			callback(err, data)

