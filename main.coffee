require 'coffee-script'
foursquare = (require './foursquareVenues')("TXTNARFZZMNDUBJVLX4TRO0GAPWJ1XJIGJUTVLKR1DDFBXXV", "OUHA2CQM4YSO1S5UKQR4UOMLRXATKXQPOX40VRNDOZJD5KCB")

params = {
	"ll" : "40.7,-74"
}

console.log foursquare.getVenues(params)