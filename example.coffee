require 'coffee-script'
foursquare = (require './foursquarevenues')(process.env.foursquareID, process.env.foursquareSecret) #replace these.

params =
	"ll" : "40.7,-74"


foursquare.getVenues params, (error, venues) ->
	console.log if !error then venues else error


foursquare.exploreVenues params, (error, venues) ->
	console.log if !error then venues else error

