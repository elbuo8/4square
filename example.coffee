require 'coffee-script'
foursquare = (require './foursquarevenues')("CLIENT_ID", "CLIENT_SECRET")

params = {
	"ll" : "40.7,-74"
}

foursquare.getVenues(params, (error, venues) ->
		console.log venues if !error
	)

foursquare.exploreVenues(params, (error, venues) ->
			console.log venues if !error
	)
