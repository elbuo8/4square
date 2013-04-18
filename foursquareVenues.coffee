require 'coffee-script'
request = require 'request'
querystring = require 'querystring'

module.exports = (client_id, client_secret) ->
	
	#Add Date to query (4square standard)
	today = new Date()
	month = (today.getMonth() + 1)
	month = '0' + month if month < 10
	day = today.getDate()
	day = '0' + day if day < 10
	date = today.getFullYear() + '' + month + '' + day
	
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
			callback(null, JSON.parse(body)) if !error && response.statusCode == 200 
			callback(JSON.parse(body), null)
			
	#ll, near, llAcc, alt, altAcc, radius, section, query, limit, novelty
	exploreVenues: (params, callback) ->
		
		# Add parameters to query
		urlString = "https://api.foursquare.com/v2/venues/explore?" + querystring.stringify(params) +'&' + querystring.stringify(credentials)	


		#HTTP Request to 4square
		request urlString, (error, response, body) ->

			#Parse response from 4square to user
			callback(null, JSON.parse(body)) if !error && response.statusCode == 200
			callback(JSON.parse(body), null)
	
	#venue_id
	getVenue: (params, callback) ->
		
		# Add parameters to query
		urlString = "https://api.foursquare.com/v2/venues/" + querystring.stringify(params) + '&' + querystring.stringify(credentials)	

		
		#HTTP Request to 4square
		request urlString, (error, response, body) ->

			#Parse response from 4square to user
			callback(null, JSON.parse(body)) if !error && response.statusCode == 200
			callback(JSON.parse(body), null) 

