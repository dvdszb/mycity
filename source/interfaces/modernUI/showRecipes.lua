modernUI.showRecipes = function(self)
	local id = self.id
	local player = self.player
	local width = self.width 
	local height = self.height
	local x = (400 - width/2) + 20
	local y = (200 - height/2) + 65
	local currentPage = 1
	local maxPages = math.ceil(table.getLength(recipes)/15)
	players[player]._modernUIImages[id][#players[player]._modernUIImages[id]+1] = addImage('172763e41e1.jpg', ":27", x+337, y-14, player)

	local cookedSomething = false
	local function showItems()
		local minn = 15 * (currentPage-1)
		local maxx = currentPage * 15 - 1
		local i = -1
		for recipeName, v in next, recipes do
			i = i + 1
			if i >= minn and i <= maxx then
				local i = i - 15 * (currentPage-1)
				players[player]._modernUISelectedItemImages[3][#players[player]._modernUISelectedItemImages[3]+1] = addImage('1722d2d8234.jpg', ":26", x + (i%5)*63, y + math.floor(i/5)*65, player)
				players[player]._modernUISelectedItemImages[3][#players[player]._modernUISelectedItemImages[3]+1] = addImage(bagItems[recipeName].png, ":26", x + 5 + (i%5)*63, y + 5 + math.floor(i/5)*65, player)

				ui.addTextArea(id..(900+i), '\n\n\n\n', player, x + 3 + (i%5)*63, y + 3 + math.floor(i/5)*65, 55, 55, 0xff0000, 0xff0000, 0, true,
				function(player, i)
					player_removeImages(players[player]._modernUISelectedItemImages[1])
					for i = 935, 945 do 
						ui.removeTextArea(id..i, player)
					end
					local selectedQuanty = 1
					local name = translate('item_'..recipeName, player)
					local description = item_getDescription(recipeName, player)
					ui.addTextArea(id..'890', '<p align="center"><font size="13"><fc>'..translate('item_'..recipeName, player), player, x+340, y-15, 135, 215, 0x24474D, 0x314e57, 0, true)
					ui.addTextArea(id..'891', '<font size="9"><bl>'..description, player, x+340, y+50, 135, nil, 0x24474D, 0x314e5, 0, true)
					ui.addTextArea(id..'894', '', player, x + 3 + (i%5)*63, y + 3 + math.floor(i/5)*65, 55, 55, 0xff0000, 0xff0000, 0, true)

					players[player]._modernUISelectedItemImages[1][#players[player]._modernUISelectedItemImages[1]+1] = addImage(bagItems[recipeName].png, "&26", 542, 125, player)
					players[player]._modernUISelectedItemImages[1][#players[player]._modernUISelectedItemImages[1]+1] = addImage('1722d33f76a.png', ":26", x + (i%5)*63-3, y + math.floor(i/5)*65-3, player)
					local function button(i, text, callback, x, y, width, height, blockClick)
						local colorPallete = {
							button_confirmBg = 0x95d44d,
							button_confirmFront = 0x44662c
						}
						if blockClick then 
							colorPallete.button_confirmBg = 0xbdbdbd
							colorPallete.button_confirmFront = 0x5b5b5b
							text = '<r>'..text
						end
						ui.addTextArea(id..(930+i*5), '', player, x-1, y-1, width, height, colorPallete.button_confirmBg, colorPallete.button_confirmBg, 1, true)
						ui.addTextArea(id..(931+i*5), '', player, x+1, y+1, width, height, 0x1, 0x1, 1, true)
						ui.addTextArea(id..(932+i*5), '', player, x, y, width, height, colorPallete.button_confirmFront, colorPallete.button_confirmFront, 1, true)
						ui.addTextArea(id..(933+i*5), '<p align="center"><font color="#cef1c3" size="13">'..text..'\n', player, x-4, y-4, width+8, height+8, 0xff0000, 0xff0000, 0, true, not blockClick and callback or nil)
					end
					local canCook = true
					local counter = 0
					for i, v in next, v.require do
						counter = counter + 1
						players[player]._modernUISelectedItemImages[1][#players[player]._modernUISelectedItemImages[1]+1] = addImage(bagItems[i].png, "&70", ((counter-1)%2)*55+500, math.floor((counter-1)/2)*30+187, player)
						if checkItemQuanty(i, v, player) then
							ui.addTextArea(id..(934+counter), '<vp>'..v, player, ((counter-1)%2)*55+545, math.floor((counter-1)/2)*30+204, nil, nil, 0x24474D, 0xff0000, 0, true)
						else
							ui.addTextArea(id..(934+counter), '<r>'..v, player, ((counter-1)%2)*55+545, math.floor((counter-1)/2)*30+204, nil, nil, 0x24474D, 0xff0000, 0, true)
							canCook = false
						end
					end
					local function cook()
						if cookedSomething then return end
						if not canCook then return end
						cookedSomething = true
						eventTextAreaCallback(0, player, 'modernUI_Close_'..id, true)
						for i, v in next, v.require do
							if not checkItemQuanty(i, v, player) then return end
							removeBagItem(i, v, player)
						end

						modernUI.new(player, 120, 120)
						:build()
						players[player]._modernUISelectedItemImages[1][#players[player]._modernUISelectedItemImages[1]+1] = addImage(bagItems[recipeName].png, ":70", 400 - 50 * 0.5, 180, player)

						addItem(recipeName, 1, player)

						if players[player].job == 'chef' then
							job_updatePlayerStats(player, 10)
						end

						local sidequest = sideQuests[players[player].sideQuests[1]].type
						if sidequest == 'type:cook' or string.find(sidequest, recipeName) then
							sideQuest_update(player, 1)
						end

						for id, properties in next, players[player].questLocalData.other do 
							if id:find('cook') then
								if id:lower():find(recipeName:lower()) then 
									if type(properties) == 'boolean' then 
										quest_updateStep(player)
									else 
										players[player].questLocalData.other[id] = properties - 1
										if players[player].questLocalData.other[id] == 0 then 
											quest_updateStep(player)
										end
									end
									break
								end
							end
						end
					end
					button(0, translate('cook', player),
						function()
							cook()
						end, 507, 295, 120, 13, not canCook)
				end, i)
			end
		end
	end
	local function updateScrollbar()
		local function updatePage(count)
			if currentPage + count > maxPages or currentPage + count < 1 then return end 
			currentPage = currentPage + count
			player_removeImages(players[player]._modernUISelectedItemImages[1])
			player_removeImages(players[player]._modernUISelectedItemImages[3])
			for i = 890, 945 do 
				if i ~= 896 then
					ui.removeTextArea(id..i, player)
				end
			end
			updateScrollbar()
			showItems()
		end
		ui.addTextArea(id..'888', string.rep('\n', 10), player, x+2, y+200, 155, 10, 0x24474D, 0xff0000, 0, true, 
			function()
				updatePage(-1)
			end)
		ui.addTextArea(id..'889', string.rep('\n', 10), player, x+157, y+200, 155, 10, 0x24474D, 0xff0000, 0, true, 
			function()
				updatePage(1)
			end)

		player_removeImages(players[player]._modernUISelectedItemImages[2])
		players[player]._modernUISelectedItemImages[2][#players[player]._modernUISelectedItemImages[2]+1] = addImage('1729eacaeb5.jpg', ":26", x+2, y+205, player)
		for i = 1, (10 - math.min(8, maxPages)+1) do 
			players[player]._modernUISelectedItemImages[2][#players[player]._modernUISelectedItemImages[2]+1] = addImage('1729ebf25cc.jpg', ":27", x+2 + (i-1)*31 + (currentPage-1)*31, y+205, player)
		end
	end
	if maxPages > 1 then 
		updateScrollbar()
	end
	showItems()
	return setmetatable(self, modernUI)
end