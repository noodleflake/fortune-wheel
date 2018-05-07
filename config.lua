-- @Author: Christian Youngblood <martinswanepoel>
-- @Date:   2018-01-06T14:31:24+02:00
-- @Email:  christian.youngblood@trilogix.co.za
-- @Project: Fortune Wheel
--
-- @Last modified by:   martinswanepoel
-- @Last modified time: 2018-05-06T18:16:53+02:00


--
-- For more information on config.lua see the Project Configuration Guide at:
-- https://docs.coronalabs.com/guide/basics/configSettings
--

application =
{
	content =
	{
		width = 1600,
		height = 2400,
		scale = "zoomEven",
		xAlign = "center",
		yAlign = "center",
		fps = 60,

		imageSuffix =
		{
			["@0,1x"] = 0.1,
			["@0,25x"] = 0.25,
			["@0,33x"] = 0.33,
			["@0,5x"] = 0.5,
			["@0,75x"] = 0.75,
			["@01,5x"] = 1.5,
		}
	},
	license =
    {
        google =
        {
            key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuqkA7P0LjKw83297pmj3FQoDOsz84YAgE3KOXrGDiDWlOqNKzv/DUgKF5+DLXDMeqcLqOfb9PN83A6PtpSPc/tmR5k9IPCDtZCVpv5/WoO2GdclSwZ2/wejFK3/l4wNLOKxpSQ8pWRKjOAVBj4Wj9I3hn6x02EiLqWRFU5iJHeTKv/CHXBdrZPjufzL+1qgdqt7NJRGKs7kx5uMX8in8TDYLMh/sI0Sz9TMMPYICmsJiNHq+FVYOXxMMYOlx7WmuooDCNvHcWvF4YEuIulWoE0K7sjmIczNqorXNP7t6Uqi+zX5Ko/SFsO0RefCu9ALHKWAP72ueG9qb1vDvmdSOvQIDAQAB",
        },
	},
	appodeal =
	{
		appKey = "6dd976917d692b5a99902f0ff9052a377dc58aa1d898ede8",
		defaultAd = "rewardedVideo",
	},
	database =
	{
		databaseName = "fw.json",
	},
	drawMode = 'default'
}
