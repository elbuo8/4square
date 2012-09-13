require 'coffee-script'
request = require 'request'

module.exports = (client_id, client_secret) ->
	
	#Add Date to query (4square standard)
	today = new Date()
	month = (today.getMonth() + 1)
	month = "0" + month if month < 10
	day = today.getDate()
	day = "0" + day if day < 10
	date = today.getFullYear() + month + day
	 
	#ll, near, llAcc, alt, altAcc, query, limit, intent, radius, sw, ne, categoryId, url, providerId, linkedId 
	getVenues: (params, callback) ->
		
		# Add parameters to query
		urlString = "https://api.foursquare.com/v2/venues/search?"
		urlString += "&ll=" + params.ll if params.ll?
		urlString += "&near=" + params.near if params.near?
		urlString += "&llAcc=" + params.llAcc if params.llAcc?
		urlString += "&alt=" + params.alt if params.alt?
		urlString += "&altAcc=" + params.altAcc if params.altAcc?
		urlString += "&ll=query" + params.query if params.query?
		urlString += "&limit=" + params.limit if params.limit?
		urlString += "&intent=" + params.intent if params.intent?
		urlString += "&radius=" + params.radius if params.radius?
		urlString += "&sw=" + params.sw if params.sw?
		urlString += "&ne=" + params.ne if params.ne?
		urlString += "&categoryId=" + params.categoryId if params.categoryId?
		urlString += "&url=" + params.url if params.url?
		urlString += "&providerId=" + params.prodividerId if params.providerId?
		urlString += "&linkedId=" + params.linkedId if params.linkedId?
		
		#Add tokens to query
		urlString += "&client_id=" + client_id if client_id? 
		urlString += "&client_secret=" + client_secret if client_secret? 
		urlString += "&v=" + date
		
		#HTTP Request to 4square
		request urlString, (error, response, body) ->
			
			#Parse response from 4square to user
			callback(null, JSON.parse(body)) if !error && response.statusCode == 200
			callback("400", null) if response.statusCode == 400
			callback("401", null) if response.statusCode == 401
			callback("403", null) if response.statusCode == 403
			callback("404", null) if response.statusCode == 404
			callback("405", null) if response.statusCode == 405
			callback("409", null) if response.statusCode == 409
			callback("500", null) if response.statusCode == 500	
		
		
	#ll, near, llAcc, alt, altAcc, radius, section, query, limit, novelty					
	exploreVenues: (params, callback) ->
		
		# Add parameters to query
		urlString = "https://api.foursquare.com/v2/venues/explore?"
		urlString += "&ll=" + params.ll if params.ll?
		urlString += "&near=" + params.near if params.near?
		urlString += "&llAcc=" + params.llAcc if params.llAcc?
		urlString += "&alt=" + params.alt if params.alt?
		urlString += "&altAcc=" + params.altAcc if params.altAcc?
		urlString += "&ll=query" + params.query if params.query?
		urlString += "&limit=" + params.limit if params.limit?
		urlString += "&section=" + params.section if params.section?
		urlString += "&radius=" + params.radius if params.radius?
		urlString += "&novelty=" + params.novelty if params.novelty?

		#Add tokens to query
		urlString += "&client_id=" + client_id if client_id? 
		urlString += "&client_secret=" + client_secret if client_secret? 
		urlString += "&v=" + date

		#HTTP Request to 4square
		request urlString, (error, response, body) ->

			#Parse response from 4square to user
			callback(null, JSON.parse(body)) if !error && response.statusCode == 200
			callback("400", null) if response.statusCode == 400
			callback("401", null) if response.statusCode == 401
			callback("403", null) if response.statusCode == 403
			callback("404", null) if response.statusCode == 404
			callback("405", null) if response.statusCode == 405
			callback("409", null) if response.statusCode == 409
			callback("500", null) if response.statusCode == 500
	
	#venue_id
	getVenue: (params, callback) ->
		
		# Add parameters to query
		urlString = "https://api.foursquare.com/v2/venues/"
		urlString += params.venue_id?
		
		#Add tokens to query
		urlString += "&client_id=" + client_id if client_id? 
		urlString += "&client_secret=" + client_secret if client_secret? 
		urlString += "&v=" + date
		
		#HTTP Request to 4square
		request urlString, (error, response, body) ->

			#Parse response from 4square to user
			callback(null, JSON.parse(body)) if !error && response.statusCode == 200
			callback("400", null) if response.statusCode == 400
			callback("401", null) if response.statusCode == 401
			callback("403", null) if response.statusCode == 403
			callback("404", null) if response.statusCode == 404
			callback("405", null) if response.statusCode == 405
			callback("409", null) if response.statusCode == 409
			callback("500", null) if response.statusCode == 500

