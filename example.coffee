require 'coffee-script'
foursquare = (require './foursquareVenues')("client_idKEY", "client_secretKEY")

params = {
	"ll" : "40.7,-74"
}

foursquare.getVenues(params, (error, venues) ->
		console.log venues if !error
	)