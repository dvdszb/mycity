HouseSystem.plants = {
	[0] = { -- default
		name = '???',
		growingTime = 0,
		stages = {'16bf63634a0.png'},
		quantyOfSeeds = 0,
	},
	[1] = { -- tomato
		name = 'tomato',
		growingTime = 60*3,
		stages = {'16bf63634a0.png', '16bf63b93cf.png', '16bf64806c6.png', '16bf64b8df5.png', '16c2544e15f.png', '16c2546d829.png'},
		quantyOfSeeds = 5,
		pricePerSeed = 10,
	},
	[2] = { -- oregano
		name = 'oregano',
		growingTime = 60*4,
		stages = {'16bf63634a0.png', '16bf63b93cf.png', '16bf64806c6.png', "16c2ad0f76a.png", "16c2acd5534.png"},
		quantyOfSeeds = 5,
		pricePerSeed = 30,
	},
	[3] = { -- lemon
		name = 'lemon',
		growingTime = 60*6,
		stages = {'16bf63634a0.png', '16bf63b93cf.png', '16bf64806c6.png', "16bfca9b802.png", "16bfcaa09ed.png", '16bfca975e5.png'},
		quantyOfSeeds = 3,
		pricePerSeed = 120,
	},
	[4] = { -- pepper
		name = 'pepper',
		growingTime = 60*3,
		stages = {'16bf63634a0.png', '16bf63b93cf.png', '16bf64806c6.png', '16c25569bf0.png', '16c2556b669.png', '16c2556cfb9.png'},
		quantyOfSeeds = 5,
		pricePerSeed = 70,
	},
	[5] = { -- luckyFlower
		name = 'luckyFlower',
		growingTime = 60*15,
		stages = {'16bf63634a0.png', '16bf63b93cf.png', '16c2580e482.png', '16c258100b7.png', '16c25811d3b.png', '16c25813c4c.png', '16c258182a0.png'},
		quantyOfSeeds = 1,
		pricePerSeed = 10000,
	},
	[6] = { -- wheat
		name = 'wheat',
		growingTime = 60*7,
		stages = {'16bf63634a0.png', '16bf63b93cf.png', '16c2ad99a4a.png', "16c2adf9395.png", "16d9c73c301.png"},
		quantyOfSeeds = 5,
		pricePerSeed = 40,
	},
	[7] = { -- pumpkin
		name = 'pumpkin',
		growingTime = 60*5,
		stages = {'16bf63634a0.png', '16bf63b93cf.png', '16da90fd0ad.png', '16da90fe81f.png', "16da905bd71.png"},
		quantyOfSeeds = 1,
		pricePerSeed = 500,
	},
	[8] = { -- blueberries
		name = 'blueberries',
		growingTime = 60*7,
		stages = {'16bf63634a0.png', '16bf63b93cf.png', '16bf64806c6.png', '16f1e9f4d55.png', '16f1e9fc472.png', "16f1ea01892.png"},
		quantyOfSeeds = 2,
		pricePerSeed = 400,
	},
	[9] = { -- banana
		name = 'banana',
		growingTime = 60*12.5,
		stages = {'16bf63634a0.png', '16bf64806c6.png', '17276940ecb.png', '1727693f16f.png', '1727693d907.png', "1727693bc5b.png"},
		quantyOfSeeds = 2,
		pricePerSeed = 800,
	},
	[10] = { -- luckyFlower - Cyan
		name = 'cyan_luckyFlower',
		growingTime = 60*15,
		stages = {'16bf63634a0.png', '16bf63b93cf.png', '174ae579dd0.png', '174ae577cbb.png', '17498099287.png', '174980a3dae.png', '174980a9917.png'},
		quantyOfSeeds = 1,
		pricePerSeed = 10000,
	},
	[11] = { -- luckyFlower - Orange
		name = 'orange_luckyFlower',
		growingTime = 60*15,
		stages = {'16bf63634a0.png', '16bf63b93cf.png', '174ae5a6858.png', '174ae5a9cdb.png', '174980cf5b5.png', '174980d12c7.png', '174980d3513.png'},
		quantyOfSeeds = 1,
		pricePerSeed = 10000,
	},
	[12] = { -- luckyFlower - Red
		name = 'red_luckyFlower',
		growingTime = 60*15,
		stages = {'16bf63634a0.png', '16bf63b93cf.png', '174ae624905.png', '174ae627aa2.png', '174980fdfd2.png', '174980ffc6e.png', '174981023d8.png'},
		quantyOfSeeds = 1,
		pricePerSeed = 10000,
	},
	[13] = { -- luckyFlower - Purple
		name = 'purple_luckyFlower',
		growingTime = 60*15,
		stages = {'16bf63634a0.png', '16bf63b93cf.png', '174ae5d3846.png', '174ae5d79d3.png', '17498129a80.png', '1749812bbd2.png', '1749812dbd1.png'},
		quantyOfSeeds = 1,
		pricePerSeed = 10000,
	},
	[14] = { -- luckyFlower - Green
		name = 'green_luckyFlower',
		growingTime = 60*15,
		stages = {'16bf63634a0.png', '16bf63b93cf.png', '174ae7aea00.png', '174ae7b0f48.png', '174ae7b30ba.png', '174ae7b4aed.png', '174ae7b70ee.png'},
		quantyOfSeeds = 1,
		pricePerSeed = 10000,
	},
	[15] = { -- luckyFlower - Black
		name = 'black_luckyFlower',
		growingTime = 60*15,
		stages = {'16bf63634a0.png', '16bf63b93cf.png', '174ae734bda.png', '174ae736b60.png', '174ae70674d.png', '174ae707fed.png', '174ae709bc6.png'},
		quantyOfSeeds = 1,
		pricePerSeed = 10000,
	},
	[16] = { -- strange pumpkin
		name = 'strangePumpkin',
		growingTime = 60*7,
		stages = {'16bf63634a0.png', '16bf63b93cf.png', '16da90fd0ad.png', '1750fd174d4.png', "1750fd1904b.png", '1750fd156cf.png', '1750fd1ad00.png'},
		quantyOfSeeds = 1,
		pricePerSeed = 1000,
	},
}