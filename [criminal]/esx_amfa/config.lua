Config              = {}
Config.MarkerType   = 1
Config.DrawDistance = 20.0
Config.ZoneSize     = {x = 2.0, y = 2.0, z = 1.0}
Config.MarkerColor  = {r = 100, g = 204, b = 100}
Config.ShowBlips   = true  --markers visible on the map? (false to hide the markers on the map)

Config.RequiredCopsAmfa  = 1

Config.TimeToFarm    = 1 * 1000
Config.TimeToProcess = 1 * 1000
Config.TimeToSell    = 1  * 1000

Config.Locale = 'ru'

Config.Zones = {
	AmfaField =		{x = 1444.00,	y = 6334.00,	z = 23.00,	name = _U('koda_field'),		sprite = 403,	color = 4},
	AmfaProcessing =	{x = 2435.00,	y = 4969.00,	z = 42.00,	name = _U('koda_processing'),	sprite = 403,	color = 4},
	AmfaDealer =		{x = 2331.08,	y = 2570.22,	z = 45.30,	name = _U('koda_dealer'),		sprite = 499,	color = 4}
}
