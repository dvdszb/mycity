onEvent('EmotePlayed', function(player, emote)
	if room.isInLobby then return end
	if emote ~= 11 and players[player].fishing[1] then
		stopFishing(player)
	end
end)