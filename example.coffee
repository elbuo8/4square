require 'coffee-script'
foursquare = (require './foursquarevenues')("client_idKEY", "client_secretKEY")

params = {
	"ll" : "40.7,-74"
}

foursquare.getVenues(params, (error, venues) ->
		console.log venues if !error
	)