repeat wait() until game:IsLoaded()

if game:GetService("CoreGui"):FindFirstChild("ScreenGui") then
	game:GetService("CoreGui").ScreenGui:Destroy()
end

local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

--Function

function ToTarget1(Pos)
	Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	if Distance < 250 then
		Speed = 700
	elseif Distance < 500 then
		Speed = 500
	elseif Distance < 1000 then
		Speed = 450
	elseif Distance >= 1000 then
		Speed = 300
	end
	game:GetService("TweenService"):Create(
		game.Players.LocalPlayer.Character.HumanoidRootPart,
		TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
		{CFrame = Pos}
	):Play()
end

function ToTarget2(Pos)
	Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	if _G.BypassTp and Distance >= 2000 then
		Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
	elseif Distance <= 2000 then
		Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		if Distance < 250 then
			Speed = 700
		elseif Distance < 500 then
			Speed = 500
		elseif Distance < 1000 then
			Speed = 450
		elseif Distance >= 1000 then
			Speed = 300
		end
		local Tween = game:GetService("TweenService"):Create(
			game.Players.LocalPlayer.Character.HumanoidRootPart,
			TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
			{CFrame = Pos}
		):Play()
		_G.Part = true
		wait(Distance/Speed)
		_G.Part = false
	end
end

function CheckLv()
	local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
	if Lv == 1 or Lv <= 9 then
		Ms = "Bandit [Lv. 5]"
		NameMon = "Bandit"
		QuestName = "BanditQuest1"
		QuestLevel = 1
		QuestPos = CFrame.new(1060.29016, 16.3556061, 1549.03186, -0.972990334, -4.48481501e-08, 0.230845898, -4.51752733e-08, 1, 3.86858368e-09, -0.230845898, -6.66443212e-09, -0.972990334)
		MonPos = CFrame.new(1199.0957, 16.6963673, 1617.98853, -0.997941971, -3.4484497e-08, -0.0641237721, -3.12641006e-08, 1, -5.12249763e-08, 0.0641237721, -4.91147816e-08, -0.997941971)
	elseif Lv == 10 or Lv <= 14 then
		Ms = "Monkey [Lv. 14]"
		NameMon = "Monkey"
		QuestName = "JungleQuest"
		QuestLevel = 1
		QuestPos = CFrame.new(-1599.86877, 36.8521385, 152.94693, -0.0401183814, -2.3783409e-08, -0.99919492, 6.88362221e-08, 1, -2.65663953e-08, 0.99919492, -6.98466067e-08, -0.0401183814)
		MonPos = CFrame.new(-1611.37549, 15.8521042, 73.2128143, -0.905018926, 3.26734129e-09, -0.425371259, -2.00530437e-08, 1, 5.03459603e-08, 0.425371259, 5.40940377e-08, -0.905018926)
	elseif Lv == 15 or Lv <= 29 then
		Ms = "Gorilla [Lv. 20]"
		NameMon = "Gorilla"
		QuestName = "JungleQuest"
		QuestLevel = 2
		QuestPos = CFrame.new(-1599.86877, 36.8521385, 152.94693, -0.0401183814, -2.3783409e-08, -0.99919492, 6.88362221e-08, 1, -2.65663953e-08, 0.99919492, -6.98466067e-08, -0.0401183814)
		MonPos = CFrame.new(-1230.89185, 6.27937412, -506.495331, 0.899415851, -6.46419451e-08, 0.437093973, 8.4829388e-08, 1, -2.66646332e-08, -0.437093973, 6.10610087e-08, 0.899415851)
	elseif Lv == 30 or Lv <= 39 then
		Ms = "Pirate [Lv. 35]"
		NameMon = "Pirate"
		QuestName = "BuggyQuest1"
		QuestLevel = 1
		QuestPos = CFrame.new(-1140.75586, 4.75206137, 3830.00928, -0.978316069, -4.24352677e-08, 0.207117409, -2.72875607e-08, 1, 7.59926877e-08, -0.207117409, 6.86931401e-08, -0.978316069)
		MonPos = CFrame.new(-1100.77087, 13.7520561, 3975.49878, -0.996037304, 6.88737813e-08, -0.0889365152, 6.89962647e-08, 1, 1.69699454e-09, 0.0889365152, -4.44601778e-09, -0.996037304)
	elseif Lv == 40 or Lv <= 59 then
		Ms = "Brute [Lv. 45]"
		NameMon = "Brute"
		QuestName = "BuggyQuest1"
		QuestLevel = 2
		QuestPos = CFrame.new(-1140.75586, 4.75206137, 3830.00928, -0.978316069, -4.24352677e-08, 0.207117409, -2.72875607e-08, 1, 7.59926877e-08, -0.207117409, 6.86931401e-08, -0.978316069)
		MonPos = CFrame.new(-1152.54651, 14.809885, 4361.49512, -0.999999642, -5.70388572e-08, 0.00086655101, -5.70611682e-08, 1, -2.57222794e-08, -0.00086655101, -2.57717154e-08, -0.999999642)
	elseif Lv == 60 or Lv <= 74 then
		Ms = "Desert Bandit [Lv. 60]"
		NameMon = "Desert Bandit"
		QuestName = "DesertQuest"
		QuestLevel = 1
		QuestPos = CFrame.new(894.835266, 6.43847418, 4390.37305, -0.856274426, -9.69668434e-09, 0.516521156, -1.13663443e-08, 1, -6.97467362e-11, -0.516521156, -5.9306795e-09, -0.856274426)
		MonPos = CFrame.new(931.08844, 6.4504776, 4481.84424, 0.183763906, -9.80146009e-09, -0.982970417, -1.71072347e-08, 1, -1.3169422e-08, 0.982970417, 1.9235971e-08, 0.183763906)
	elseif Lv == 75 or Lv <= 89 then
		Ms = "Desert Officer [Lv. 70]"
		NameMon = "Desert Officer"
		QuestName = "DesertQuest"
		QuestLevel = 2
		QuestPos = CFrame.new(894.835266, 6.43847418, 4390.37305, -0.856274426, -9.69668434e-09, 0.516521156, -1.13663443e-08, 1, -6.97467362e-11, -0.516521156, -5.9306795e-09, -0.856274426)
		MonPos = CFrame.new(1628.30664, 1.61096632, 4367.17871, -0.692698359, 3.7529059e-08, -0.721227407, 2.47063277e-08, 1, 2.83059514e-08, 0.721227407, 1.78860637e-09, -0.692698359)
	elseif Lv == 90 or Lv <= 99 then
		Ms = "Snow Bandit [Lv. 90]"
		NameMon = "Snow Bandit"
		QuestName = "SnowQuest"
		QuestLevel = 1
		QuestPos = CFrame.new(1388.32629, 87.2727966, -1298.38855, 0.421851248, 1.67225185e-08, -0.906665027, 3.12471187e-08, 1, 3.29825838e-08, 0.906665027, -4.22444124e-08, 0.421851248)
		MonPos = CFrame.new(1346.88062, 87.2727737, -1430.40942, 0.919056177, 1.28202506e-08, 0.394126534, 1.69656111e-08, 1, -7.20900459e-08, -0.394126534, 7.29413969e-08, 0.919056177)
	elseif Lv == 100 or Lv <= 119 then
		Ms = "Snowman [Lv. 100]"
		NameMon = "Snowman"
		QuestName = "SnowQuest"
		QuestLevel = 2
		QuestPos = CFrame.new(1388.32629, 87.2727966, -1298.38855, 0.421851248, 1.67225185e-08, -0.906665027, 3.12471187e-08, 1, 3.29825838e-08, 0.906665027, -4.22444124e-08, 0.421851248)
		MonPos = CFrame.new(1172.86572, 105.773315, -1484.91821, 0.999249279, 3.47523397e-08, 0.0387419201, -3.34662644e-08, 1, -3.38445005e-08, -0.0387419201, 3.25225429e-08, 0.999249279)
	elseif Lv == 120 or Lv <= 149 then
		Ms = "Chief Petty Officer [Lv. 120]"
		NameMon = "Chief Petty Officer"
		QuestName = "MarineQuest2"
		QuestLevel = 1
		QuestPos = CFrame.new(-5037.62939, 28.6520443, 4324.82422, 2.6140362e-05, -1.46247636e-08, 1, -2.43722393e-08, 1, 1.46254004e-08, -1, -2.4372623e-08, 2.6140362e-05)
		MonPos = CFrame.new(-4901.05273, 20.6520443, 4007.98975, 0.935388923, -9.69922311e-08, 0.353620708, 8.39348715e-08, 1, 5.22607557e-08, -0.353620708, -1.92030214e-08, 0.935388923)
	elseif Lv == 150 or Lv <= 174 then
		Ms = "Sky Bandit [Lv. 150]"
		NameMon = "Sky Bandit"
		QuestName = "SkyQuest"
		QuestLevel = 1
		QuestPos = CFrame.new(-4840.49902, 717.669373, -2620.63623, -0.843173027, -5.55945014e-08, -0.5376423, -4.37175331e-11, 1, -1.03335694e-07, 0.5376423, -8.71063648e-08, -0.843173027)
		MonPos = CFrame.new(-5008.59473, 278.067017, -2848.06982, 0.41242978, -1.02003046e-08, 0.910989404, -8.39685939e-08, 1, 4.92118275e-08, -0.910989404, -9.67909202e-08, 0.41242978)
	elseif Lv == 175 or Lv <= 189 then
		Ms = "Dark Master [Lv. 175]"
		NameMon = "Dark Master"
		QuestName = "SkyQuest"
		QuestLevel = 2
		QuestPos = CFrame.new(-4840.49902, 717.669373, -2620.63623, -0.843173027, -5.55945014e-08, -0.5376423, -4.37175331e-11, 1, -1.03335694e-07, 0.5376423, -8.71063648e-08, -0.843173027)
		MonPos = CFrame.new(-5261.9917, 388.651947, -2280.15161, 0.398467302, 2.56651411e-08, 0.917182565, 3.83671299e-08, 1, -4.46510775e-08, -0.917182565, 5.29816582e-08, 0.398467302)
	elseif Lv == 190 or Lv <= 209 then
		Ms = "Prisoner [Lv. 190]"
		NameMon = "Prisoner"
		QuestName = "PrisonerQuest"
		QuestLevel = 1
		QuestPos = CFrame.new(5307.86523, 1.65514696, 474.632904, -0.102480404, -1.06170495e-08, -0.994735003, 4.35499992e-08, 1, -1.51598876e-08, 0.994735003, -4.48742981e-08, -0.102480404)
		MonPos = CFrame.new(5119.0542, 0.523922741, 464.480469, 0.636900544, 4.51006272e-08, 0.770945966, -4.44949926e-08, 1, -2.17417853e-08, -0.770945966, -2.04558805e-08, 0.636900544)
	elseif Lv == 210 or Lv <= 249 then
		Ms = "Dangerous Prisoner [Lv. 210]"
		NameMon = "Dangerous Prisoner"
		QuestName = "PrisonerQuest"
		QuestLevel = 2
		QuestPos = CFrame.new(5307.86523, 1.65514696, 474.632904, -0.102480404, -1.06170495e-08, -0.994735003, 4.35499992e-08, 1, -1.51598876e-08, 0.994735003, -4.48742981e-08, -0.102480404)
		MonPos = CFrame.new(5589.75684, 1.65149343, 764.281677, 0.953318715, -1.8591404e-09, -0.301965952, 1.75048296e-08, 1, 4.91066636e-08, 0.301965952, -5.21001624e-08, 0.953318715)
	elseif Lv == 250 or Lv <= 274 then
		Ms = "Toga Warrior [Lv. 250]"
		NameMon = "Toga Warrior"
		QuestName = "ColosseumQuest"
		QuestLevel = 1
		QuestPos = CFrame.new(-1578.15601, 7.38934898, -2985.81152, 0.485308826, -8.00141606e-08, 0.874342799, -1.44736703e-08, 1, 9.95471794e-08, -0.874342799, -6.09660731e-08, 0.485308826)
		MonPos = CFrame.new(-1918.36255, 7.28908348, -2784.85913, 0.896581054, 1.85238527e-08, 0.442879677, -1.85511517e-08, 1, -4.27032898e-09, -0.442879677, -4.38723191e-09, 0.896581054)
	elseif Lv == 275 or Lv <= 299 then
		Ms = "Gladiator [Lv. 275]"
		NameMon = "Gladiator"
		QuestName = "ColosseumQuest"
		QuestLevel = 2
		QuestPos = CFrame.new(-1578.15601, 7.38934898, -2985.81152, 0.485308826, -8.00141606e-08, 0.874342799, -1.44736703e-08, 1, 9.95471794e-08, -0.874342799, -6.09660731e-08, 0.485308826)
		MonPos = CFrame.new(-1278.80054, 7.44255638, -3275.71289, -0.437109798, -8.05278066e-09, 0.899408162, -1.55208859e-08, 1, 1.41031498e-09, -0.899408162, -1.33431497e-08, -0.437109798)
	elseif Lv == 300 or Lv <= 324 then
		Ms = "Military Soldier [Lv. 300]"
		NameMon = "Military Soldier"
		QuestName = "MagmaQuest"
		QuestLevel = 1
		QuestPos = CFrame.new(-5314.89795, 12.2367077, 8516.79688, 0.516234636, 1.59358748e-08, -0.85644716, -8.71449579e-09, 1, 1.33541809e-08, 0.85644716, 5.69614467e-10, 0.516234636)
		MonPos = CFrame.new(-5459.36279, 8.98336792, 8429.72754, 0.849475741, -3.28582885e-08, 0.527627707, -2.07252739e-08, 1, 9.56430171e-08, -0.527627707, -9.21816508e-08, 0.849475741)
	elseif Lv == 325 or Lv <= 374 then
		Ms = "Military Spy [Lv. 325]"
		NameMon = "Military Spy"
		QuestName = "MagmaQuest"
		QuestLevel = 2
		QuestPos = CFrame.new(-5314.89795, 12.2367077, 8516.79688, 0.516234636, 1.59358748e-08, -0.85644716, -8.71449579e-09, 1, 1.33541809e-08, 0.85644716, 5.69614467e-10, 0.516234636)
		MonPos = CFrame.new(-5843.85693, 77.2306442, 8820.91309, -0.00215803669, -5.49462236e-08, 0.999997675, 3.99615629e-08, 1, 5.50325936e-08, -0.999997675, 4.00802307e-08, -0.00215803669)
	elseif Lv == 375 or Lv <= 399 then
		Ms = "Fishman Warrior [Lv. 375]"
		NameMon = "Fishman Warrior"
		QuestName = "FishmanQuest"
		QuestLevel = 1
		QuestPos = CFrame.new(61121.5547, 18.4716454, 1566.37036, 0.922316909, 1.45940433e-08, 0.386434436, -3.02368086e-09, 1, -3.05491703e-08, -0.386434436, 2.70075624e-08, 0.922316909)
		MonPos = CFrame.new(60891.5586, 18.48283, 1587.48535, -0.557101727, 3.34541781e-08, 0.830444276, -7.0102617e-09, 1, -4.49874946e-08, -0.830444276, -3.08842409e-08, -0.557101727)
	elseif Lv == 400 or Lv <= 449 then
		Ms = "Fishman Commando [Lv. 400]"
		NameMon = "Fishman Commando"
		QuestName = "FishmanQuest"
		QuestLevel = 2
		QuestPos = CFrame.new(61121.5547, 18.4716454, 1566.37036, 0.922316909, 1.45940433e-08, 0.386434436, -3.02368086e-09, 1, -3.05491703e-08, -0.386434436, 2.70075624e-08, 0.922316909)
		MonPos = CFrame.new(61916.3789, 18.48283, 1461.89832, -0.998045862, -3.06450332e-08, 0.0624853484, -3.08483976e-08, 1, -2.28985519e-09, -0.0624853484, -4.21295354e-09, -0.998045862)
	elseif Lv == 450 or Lv <= 474 then
		Ms = "God's Guard [Lv. 450]"
		NameMon = "God's Guard"
		QuestName = "SkyExp1Quest"
		QuestLevel = 1
		QuestPos = CFrame.new(-4721.69629, 845.92688, -1951.23413, -0.992632329, 4.70104915e-08, 0.121165335, 5.00912236e-08, 1, 2.23799574e-08, -0.121165335, 2.82843899e-08, -0.992632329)
		MonPos = CFrame.new(-4711.77979, 845.276978, -1919.3158, 0.990525007, -1.883385e-08, 0.137332603, 2.38186892e-08, 1, -3.46542457e-08, -0.137332603, 3.75969762e-08, 0.990525007)
	elseif Lv == 475 or Lv <= 524 then
		Ms = "Shanda [Lv. 475]"
		NameMon = "Shanda"
		QuestName = "SkyExp1Quest"
		QuestLevel = 2
		QuestPos = CFrame.new(-7860.61572, 5545.4917, -380.37381, 0.41818288, 9.70686855e-08, -0.908362865, -5.99544805e-08, 1, 7.92598982e-08, 0.908362865, 2.13152909e-08, 0.41818288)
		MonPos = CFrame.new(-7633.15918, 5545.4917, -519.972839, 0.15734823, -1.08362186e-09, -0.987543166, -1.83448119e-08, 1, -4.02022504e-09, 0.987543166, 1.87488691e-08, 0.15734823)
	elseif Lv == 525 or Lv <= 549 then
		Ms = "Royal Squad [Lv. 525]"
		NameMon = "Royal Squad"
		QuestName = "SkyExp2Quest"
		QuestLevel = 1
		QuestPos = CFrame.new(-7904.73438, 5635.9624, -1412.08142, 0.00413449481, -2.92529716e-08, 0.999991477, -9.00092445e-08, 1, 2.9625367e-08, -0.999991477, -9.01309605e-08, 0.00413449481)
		MonPos = CFrame.new(-7641.88818, 5606.87695, -1472.5387, 0.573091447, -9.76830989e-08, -0.819491446, 4.70965773e-08, 1, -8.62638103e-08, 0.819491446, 1.08418083e-08, 0.573091447)
	elseif Lv == 550 or Lv <= 624 then
		Ms = "Royal Soldier [Lv. 550]"
		NameMon = "Royal Soldier"
		QuestName = "SkyExp2Quest"
		QuestLevel = 2
		QuestPos = CFrame.new(-7904.73438, 5635.9624, -1412.08142, 0.00413449481, -2.92529716e-08, 0.999991477, -9.00092445e-08, 1, 2.9625367e-08, -0.999991477, -9.01309605e-08, 0.00413449481)
		MonPos = CFrame.new(-7863.77832, 5606.87793, -1838.03601, 0.312302649, 3.96729618e-08, -0.949982643, -2.28553141e-08, 1, 3.42481883e-08, 0.949982643, 1.10163514e-08, 0.312302649)
	elseif Lv == 625 or Lv <= 649 then
		Ms = "Galley Pirate [Lv. 625]"
		NameMon = "Galley Pirate"
		QuestName = "FountainQuest"
		QuestLevel = 1
		QuestPos = CFrame.new(5257.96484, 38.5011406, 4049.2373, -0.227916867, -7.86337822e-08, -0.973680615, 2.18198721e-08, 1, -8.58668585e-08, 0.973680615, -4.08160901e-08, -0.227916867)
		MonPos = CFrame.new(5490.73779, 38.5386391, 3984.00708, -0.891013086, -9.39245126e-09, -0.453977615, -1.13007648e-08, 1, 1.49055235e-09, 0.453977615, 6.4583956e-09, -0.891013086)
	elseif Lv >= 650 then
		Ms = "Galley Captain [Lv. 650]"
		NameMon = "Galley Captain"
		QuestName = "FountainQuest"
		QuestLevel = 2
		QuestPos = CFrame.new(5257.96484, 38.5011406, 4049.2373, -0.227916867, -7.86337822e-08, -0.973680615, 2.18198721e-08, 1, -8.58668585e-08, 0.973680615, -4.08160901e-08, -0.227916867)
		MonPos = CFrame.new(5653.11133, 38.5011406, 4924.39111, -0.999997973, 6.95528755e-08, 0.00200896896, 6.97511666e-08, 1, 9.86329169e-08, -0.00200896896, 9.87728441e-08, -0.999997973)
	end
end

function CheckBoss()
	if SelectedBoss == "The Gorilla King [Lv. 25] [Boss]" then
		LvRequest = 20
		Boss = "The Gorilla King [Lv. 25] [Boss]"
		NameBoss = "The Gorilla King"
		BossQuestName = "JungleQuest"
		BossQuestLevel = 3
		BossQuestPos = CFrame.new(-1599.86877, 36.8521385, 152.94693, -0.0401183814, -2.3783409e-08, -0.99919492, 6.88362221e-08, 1, -2.65663953e-08, 0.99919492, -6.98466067e-08, -0.0401183814)
		BossPos = CFrame.new(-1047.5755615234375, 12.647231101989746, -437.074951171875)
	end
end

function Attack()
	game:GetService("VirtualUser"):CaptureController()
	game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670),workspace.CurrentCamera.CFrame)
end

spawn(function()
	while wait() do
		if _G.AutoFarmLevel then
			CheckLv()
			if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				LevelBring = false
				ToTarget2(QuestPos)
				local args = {
					[1] = "StartQuest",
					[2] = QuestName,
					[3] = QuestLevel
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
				pcall(function()
					CheckLv()
					if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == Ms and v:FindFirstChild("Humanoid") then
								if v.Humanoid.Health > 0 then
									if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
										repeat wait()
											_G.Part = true
											EquipTool(SelectTool)
											AutoHaki()
											ToTarget1(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
											if v.Humanoid:FindFirstChild("Animator") then
												v.Humanoid.Animator:Destroy()
											end
											v.Humanoid:ChangeState(11)
											v.Humanoid:ChangeState(14)
											v.Humanoid.JumpPower = 0
											v.Humanoid.WalkSpeed = 0
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(3,3,3)
											PosMon = v.HumanoidRootPart.CFrame
											LevelBring = true
										until _G.AutoFarmLevel == false or v.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:FindFirstChild(Ms)
										_G.Part = false
									else
										LevelBring = false
										local args = {
											[1] = "AbandonQuest"
										}

										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
								end
							end
						end
					else
						LevelBring = false
						ToTarget2(MonPos)
					end
				end)
			end
		end
	end
end)

spawn(function()
	while wait() do
		if _G.AutoFarmLevelFast then
			CheckLv()
			local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
			local PlrNameFarm = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
			local FarmLvQreward = game:GetService("Players").localPlayer.PlayerGui.Main.Quest.Container.QuestReward.Title.Text
			if Lv <= 299 and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				local args = {
					[1] = "PlayerHunter"
				}

				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
				if FarmLvQreward == "Reward:\n$20,000\n50,000,000 Exp." then
					for i,p in pairs(game:GetService("Players"):GetChildren()) do
						if "Defeat "..p.Name.." (0/1)" == PlrNameFarm then
							if p.Data.Level.Value >= 20 then
								local args = {
									[1] = "EnablePvp"
								}

								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								EquipTool(SelectTool)
								AutoHaki()
								ToTarget2(p.Character.HumanoidRootPart.CFrame)
								Attack()
							else
								local args = {
									[1] = "AbandonQuest"
								}

								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							end
						end
					end
				elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					pcall(function()
						CheckLv()
						if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == Ms and v:FindFirstChild("Humanoid") then
									if v.Humanoid.Health > 0 then
										if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
											repeat wait()
												_G.Part = true
												EquipTool(SelectTool)
												AutoHaki()
												ToTarget1(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
												if v.Humanoid:FindFirstChild("Animator") then
													v.Humanoid.Animator:Destroy()
												end
												v.Humanoid:ChangeState(11)
												v.Humanoid:ChangeState(14)
												v.Humanoid.JumpPower = 0
												v.Humanoid.WalkSpeed = 0
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(3,3,3)
												PosMon = v.HumanoidRootPart.CFrame
												LevelBring = true
											until _G.AutoFarmLevelFast == false or v.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:FindFirstChild(Ms)
											_G.Part = false
										else
											LevelBring = false
											local args = {
												[1] = "AbandonQuest"
											}

											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
									end
								end
							end
						else
							LevelBring = false
							ToTarget2(MonPos)
						end
					end)
				end
			elseif Lv >= 300 and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				LevelBring = false
				ToTarget2(QuestPos)
				local args = {
					[1] = "StartQuest",
					[2] = QuestName,
					[3] = QuestLevel
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				CheckLv()
			end
		end
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			CheckLv()
			if _G.AutoFarmLevel and _G.BringMob and LevelBring then
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == Ms and (v.HumanoidRootPart.Position - PosMon.Position).magnitude <= 1000 then
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							v.Humanoid:ChangeState(11)
							v.Humanoid:ChangeState(14)
							v.Humanoid.JumpPower = 0
							v.Humanoid.WalkSpeed = 0
							v.HumanoidRootPart.CanCollide = false
							v.HumanoidRootPart.Size = Vector3.new(3,3,3)
							v.HumanoidRootPart.CFrame = PosMon
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
						end
					end
				end
			elseif _G.AutoFarmLevelFast and _G.BringMob and LevelBring then
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == Ms then
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							v.Humanoid:ChangeState(11)
							v.Humanoid:ChangeState(14)
							v.Humanoid.JumpPower = 0
							v.Humanoid.WalkSpeed = 0
							v.HumanoidRootPart.CanCollide = false
							v.HumanoidRootPart.Size = Vector3.new(3,3,3)
							v.HumanoidRootPart.CFrame = PosMon
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
						end
					end
				end
			end
		end)
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			if _G.AutoFarmBoss then
				CheckBoss()
				if _G.BossQuest and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					ToTarget2(BossQuestPos)
					local args = {
						[1] = "StartQuest",
						[2] = BossQuestName,
						[3] = BossQuestLevel
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				elseif _G.BossQuest and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					pcall(function()
						CheckBoss()
						if game:GetService("Workspace").Enemies:FindFirstChild(Boss) then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == Boss and v:FindFirstChild("Humanoid") then
									if v.Humanoid.Health > 0 then
										if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
											repeat wait()
												_G.Part = true
												EquipTool(SelectTool)
												AutoHaki()
												ToTarget1(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
												if v.Humanoid:FindFirstChild("Animator") then
													v.Humanoid.Animator:Destroy()
												end
												v.Humanoid.JumpPower = 0
												v.Humanoid.WalkSpeed = 0
												v.HumanoidRootPart.CanCollide = false
												sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											until _G.AutoFarmBoss == false or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(Boss)
											_G.Part = false
										else
											local args = {
												[1] = "AbandonQuest"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
									end
								end
							end
						else
							ToTarget2(BossPos)
						end
					end)
				elseif _G.BossQuest == false then
					pcall(function()
						CheckBoss()
						if game:GetService("Workspace").Enemies:FindFirstChild(Boss) then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == Boss and v:FindFirstChild("Humanoid") then
									if v.Humanoid.Health > 0 then
										repeat wait()
											_G.Part = true
											EquipTool(SelectTool)
											AutoHaki()
											ToTarget1(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
											if v.Humanoid:FindFirstChild("Animator") then
												v.Humanoid.Animator:Destroy()
											end
											v.Humanoid.JumpPower = 0
											v.Humanoid.WalkSpeed = 0
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(5,5,5)
											v.HumanoidRootPart.CFrame = PosMon
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											game:GetService("VirtualUser"):CaptureController()
			                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670),workspace.CurrentCamera.CFrame)
										until _G.AutoFarmBoss == false or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(Boss)
										_G.Part = false
									end
								end
							end
						else
							ToTarget2(BossPos)
						end
					end)
				end
			end
		end)
	end
end)

local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigController = require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)
local RigControllerR = getupvalues(RigController)[2]
local realbhit = require(game.ReplicatedStorage.CombatFramework.RigLib)
local cooldownfastattack = tick()

function CurrentWeapon()
	local ac = CombatFrameworkR.activeController
	local ret = ac.blades[1]
	if not ret then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end
	pcall(function()
		while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
	end)
	if not ret then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end
	return ret
end

function getAllBladeHitsPlayers(Sizes)
	local Hits = {}
	local Client = game.Players.LocalPlayer
	local Characters = game:GetService("Workspace").Characters:GetChildren()
	for i=1,#Characters do local v = Characters[i]
		local Human = v:FindFirstChildOfClass("Humanoid")
		if v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
			table.insert(Hits,Human.RootPart)
		end
	end
	return Hits
end

function getAllBladeHits(Sizes)
	local Hits = {}
	local Client = game.Players.LocalPlayer
	local Enemies = game:GetService("Workspace").Enemies:GetChildren()
	for i=1,#Enemies do local v = Enemies[i]
		local Human = v:FindFirstChildOfClass("Humanoid")
		if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
			table.insert(Hits,Human.RootPart)
		end
	end
	return Hits
end

function AttackFunction()
	local ac = CombatFrameworkR.activeController
	if ac and ac.equipped then
		for indexincrement = 1, 1 do
			local bladehit = getAllBladeHits(30)
			if #bladehit > 0 then
				local AcAttack8 = debug.getupvalue(ac.attack, 5)
				local AcAttack9 = debug.getupvalue(ac.attack, 6)
				local AcAttack7 = debug.getupvalue(ac.attack, 4)
				local AcAttack10 = debug.getupvalue(ac.attack, 7)
				local NumberAc12 = (AcAttack8 * 798405 + AcAttack7 * 727595) % AcAttack9
				local NumberAc13 = AcAttack7 * 798405
				(function()
					NumberAc12 = (NumberAc12 * AcAttack9 + NumberAc13) % 1099511627776
					AcAttack8 = math.floor(NumberAc12 / AcAttack9)
					AcAttack7 = NumberAc12 - AcAttack8 * AcAttack9
				end)()
				AcAttack10 = AcAttack10 + 1
				debug.setupvalue(ac.attack, 5, AcAttack8)
				debug.setupvalue(ac.attack, 6, AcAttack9)
				debug.setupvalue(ac.attack, 4, AcAttack7)
				debug.setupvalue(ac.attack, 7, AcAttack10)
				for k, v in pairs(ac.animator.anims.basic) do
					v:Play(0.1,0.5,0.2,0.8)
				end                 
				if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then 
					game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(CurrentWeapon()))
					game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(NumberAc12 / 1099511627776 * 16777215), AcAttack10)
					game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "") 
				end
			end
		end
	end
end

coroutine.wrap(function()
   while task.wait(.1) do
       local ac = CombatFrameworkR.activeController
         if ac and ac.equipped then
            if _G.FastAttack then
                AttackFunction()
                if _G.FastAttack then
                    if tick() - cooldownfastattack > 5 then wait(.9) cooldownfastattack = tick() end
                end
              elseif _G.FastAttack == true then
                  if ac.hitboxMagnitude ~= 80 then
                     ac.hitboxMagnitude = 80
                  end
                 ac:attack()
             end
         end
     end
end)()

spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if _G.Part then
            if not game:GetService("Workspace"):FindFirstChild("LOL") then
                local LOL = Instance.new("Part")
                LOL.Name = "LOL"
                LOL.Parent = game.Workspace
                LOL.Anchored = true
                LOL.Transparency = 1
                LOL.Size = Vector3.new(20,-0.5,20)
                LOL.Material = "Neon"
            elseif game:GetService("Workspace"):FindFirstChild("LOL") then
                game.Workspace["LOL"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-3.5,0)
            end
        else
            if game:GetService("Workspace"):FindFirstChild("LOL") then
            	game:GetService("Workspace"):FindFirstChild("LOL"):Destroy()
            end
        end
    end)
end)

WeaponList = {}

for i,t in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
	if t:IsA("Tool") then
		table.insert(WeaponList,t.Name)
	end
end
for i,t in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
    if t:IsA("Tool") then
    	table.insert(WeaponList,t.Name)
    end
end

BossList = {}

for i,b in pairs(game.ReplicatedStorage:GetChildren()) do
	if string.find(b.Name, "Boss") then
		if b.Name == "Ice Admiral [Lv. 700] [Boss]" then
		elseif b.Name == "rip_indra [Lv. 1500] [Boss]" then
		else
			table.insert(BossList,b.Name)
		end
	end
end

for i,b in pairs(game.workspace.Enemies:GetChildren()) do
	if string.find(b.Name, "Boss") then
		if b.Name == "Ice Admiral [Lv. 700] [Boss]" then
		elseif b.Name == "rip_indra [Lv. 1500] [Boss]" then
		else
			table.insert(BossList,b.Name)
		end
	end
end

function EquipTool(ToolSelect)
	if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSelect) then
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSelect)
		wait(.3)
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
	end
end

spawn(function()
	while wait(.2) do
		if _G.AutoMelee then
			local args = {
				[1] = "AddPoint",
				[2] = "Melee",
				[3] = 1
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
	end
end)

spawn(function()
	while wait(.2) do
		if _G.AutoDefense then
			local args = {
				[1] = "AddPoint",
				[2] = "Defense",
				[3] = 1
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
	end
end)

spawn(function()
	while wait(.2) do
		if _G.AutoSword then
			local args = {
				[1] = "AddPoint",
				[2] = "Sword",
				[3] = 1
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
	end
end)

spawn(function()
	while wait(.2) do
		if _G.AutoGun then
			local args = {
				[1] = "AddPoint",
				[2] = "Gun",
				[3] = 1
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
	end
end)

spawn(function()
	while wait(.2) do
		if _G.AutoBloxFruit then
			local args = {
				[1] = "AddPoint",
				[2] = "Demon Fruit",
				[3] = 1
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
	end
end)

spawn(function()
	while wait(1) do
		if _G.AutoRandomFruit then
			local args = {
				[1] = "Cousin",
				[2] = "Buy"
			}

			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
	end
end)

function AutoHaki()
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
        local args = {
            [1] = "Buso"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
end

spawn(function()
	while wait() do
		if _G.AutoBuso then
			AutoHaki()
		end
	end
end)

local CamShake = require(game.ReplicatedStorage.Util.CameraShaker)

spawn(function()
    while DisibleCamShake do
        CamShake:Stop()
        wait()
    end
end)

AllCode = {
    "GAMER_ROBOT_1M",
    "ADMINGIVEAWAY",
    "GAMERROBOT_YT ",
    "kittgaming",
    "Sub2Fer999",
    "Enyu_is_Pro",
    "Magicbus",
    "JCWK",
    "Starcodeheo",
    "fudd10_v2",
    "SUB2GAMERROBOT_EXP1",
    "Sub2NoobMaster123",
    "Sub2Daigrock",
    "Axiore",
    "TantaiGaming",
    "StrawHatMaine",
    "Sub2OfficialNoobie",
    "Fudd10",
    "Bignews",
    "TheGreatAce"
}
function Redeem(Code)
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Code)
end

--Auto rejoin
spawn(function()
    while wait() do
    game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
                if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
                    game:GetService("TeleportService"):Teleport(game.PlaceId)
            end
        end)
    end
end)
-- Anti Afk
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

--DeleteEffect
task.spawn(function()
	while wait() do
		for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"]:GetChildren()) do
			pcall(function()
				if v.Name == ("CurvedRing") or v.Name == ("SlashHit") or v.Name == ("SwordSlash") or v.Name == ("SlashTail") or v.Name == ("Sounds") then
					v:Destroy()
				end
			end)
		end
	end
end)

if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
	game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy()
end
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
	game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy()
end
------------------------------------------------------------
local Window = Library:CreateWindow({
    Title = 'Zerkro Hub - Premium Edition | Blox Fruits',
    Center = true, 
    AutoShow = true,
})

local Tabs = {
    Main = Window:AddTab('Main'),
	Stat = Window:AddTab('Status'),
	Plr = Window:AddTab('Players'),
	Tp = Window:AddTab('Teleport'),
	Shop = Window:AddTab('Shop'),
	Esp = Window:AddTab('Esp-Raid'),
	Misc = Window:AddTab('Misc'),
}

local MainL1 = Tabs.Main:AddLeftTabbox()
local MainR1 = Tabs.Main:AddRightGroupbox('Setting')
local StatR1 = Tabs.Stat:AddRightGroupbox('Auto Stat')
local TpL1 = Tabs.Tp:AddLeftGroupbox('Island')
local TpR1 = Tabs.Tp:AddRightGroupbox('World')
local ShopL1 = Tabs.Shop:AddLeftGroupbox('Devil Fruits')
local MiscL1 = Tabs.Misc:AddLeftGroupbox('More Functions')
local MiscR1 = Tabs.Misc:AddRightGroupbox('Servers')
local Level = MainL1:AddTab('Level')
local Boss = MainL1:AddTab('Boss')

--Gui
Level:AddToggle('AutoFarmLevel', {
	Text = 'Auto Farm Level',
    Default = false,
    Tooltip = 'Auto Farm Level 1-2400',
})

Toggles.AutoFarmLevel:OnChanged(function(value)
    _G.AutoFarmLevel = value
end)

Level:AddToggle('AutoFarmLevelFast', {
	Text = 'Auto Farm Level [Fast]',
    Default = false,
    Tooltip = 'Auto Farm Level 1-2400 but it fast',
})

Level:AddButton('Redeem All Code',function()
	for i,v in pairs(AllCode) do
		Redeem(v)
	end
end)

Toggles.AutoFarmLevelFast:OnChanged(function(value)
    _G.AutoFarmLevelFast = value
end)

Boss:AddToggle('AutoFarmBoss', {
	Text = 'Auto Farm Boss',
    Default = false,
    Tooltip = 'Auto Farm Boss of your choice',
})

Toggles.AutoFarmBoss:OnChanged(function(value)
    _G.AutoFarmBoss = value
end)

Boss:AddToggle('AcceptQuestBoss', {
	Text = 'Accept QuestBoss',
    Default = true,
    Tooltip = 'Accept quest for boss of your choice',
})

Toggles.AcceptQuestBoss:OnChanged(function(value)
    _G.BossQuest = value
end)

local DropBoss = Boss:AddDropdown('SelectBoss', {
    Values = BossList,
    Default = 1,
    Multi = false,

    Text = 'Select Boss',
    Tooltip = 'Select Boss for Farming',
})

Options.SelectBoss:OnChanged(function(value)
    SelectedBoss = value
end)

Boss:AddButton('Refresh Boss',function()
	table.clear(BossList)
	for i,b in pairs(game.ReplicatedStorage:GetChildren()) do
		if string.find(b.Name, "Boss") then
			if b.Name == "Ice Admiral [Lv. 700] [Boss]" then
			elseif b.Name == "rip_indra [Lv. 1500] [Boss]" then
			else
				table.insert(BossList,b.Name)
			end
		end
	end	
	for i,b in pairs(game.workspace.Enemies:GetChildren()) do
		if string.find(b.Name, "Boss") then
			if b.Name == "Ice Admiral [Lv. 700] [Boss]" then
			elseif b.Name == "rip_indra [Lv. 1500] [Boss]" then
			else
				table.insert(BossList,b.Name)
			end
		end
	end
end)

MainR1:AddToggle('BypassTp', {
	Text = 'Bypass Tp',
    Default = false,
})

Toggles.BypassTp:OnChanged(function(value)
    _G.BypassTp = value
end)

local DropTool = MainR1:AddDropdown('SelectWeapon', {
    Values = WeaponList,
    Default = 1,
    Multi = false,

    Text = 'Select Weapon',
    Tooltip = 'Select Weapon for Farming',
})

Options.SelectWeapon:OnChanged(function(value)
    SelectTool = value
end)

MainR1:AddButton('Refresh Weapon',function()
	table.clear(WeaponList)
	for i,t in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
		if t:IsA("Tool") then
			table.insert(WeaponList,t.Name)
		end
	end
	for i,t in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
		if t:IsA("Tool") then
			table.insert(WeaponList,t.Name)
		end
	end
end)

MainR1:AddToggle('FastAttack', {
	Text = 'Fast Attack',
    Default = true,
})

Toggles.FastAttack:OnChanged(function(value)
    _G.FastAttack = value
end)

MainR1:AddToggle('BringMob', {
	Text = 'Bring Mob',
    Default = true,
})

Toggles.BringMob:OnChanged(function(value)
    _G.BringMob = value
end)

--Stat
local StatPoint = StatR1:AddLabel('Stat Point : 0')

spawn(function()
	while wait(.5) do
		StatPoint:SetText('Stat Point : '.. game:GetService("Players").LocalPlayer.Data.Points.Value ..'')
	end
end)

StatR1:AddDivider()

StatR1:AddToggle('Melee', {
	Text = 'Melee',
    Default = false,
})

Toggles.Melee:OnChanged(function(value)
    _G.AutoMelee = value
end)

StatR1:AddToggle('Defense', {
	Text = 'Defense',
    Default = false,
})

Toggles.Defense:OnChanged(function(value)
    _G.AutoDefense = value
end)

StatR1:AddToggle('Sword', {
	Text = 'Sword',
    Default = false,
})

Toggles.Sword:OnChanged(function(value)
    _G.AutoSword = value
end)

StatR1:AddToggle('Gun', {
	Text = 'Gun',
    Default = false,
})

Toggles.Gun:OnChanged(function(value)
    _G.AutoGun = value
end)

StatR1:AddToggle('BloxFruit', {
	Text = 'BloxFruit',
    Default = false,
})

Toggles.BloxFruit:OnChanged(function(value)
    _G.AutoBloxFruit = value
end)

--Players


--Teleport
TpL1:AddButton("Stop Tween",function()
	Tween:Cancel()
end)

TpL1:AddDivider()

TpL1:AddButton("Pirate Starter",function()
	ToTarget2(CFrame.new(1096.70923, 16.2664795, 1446.47766, -0.842923939, -7.25230294e-08, -0.53803277, -3.17505666e-08, 1, -8.50500612e-08, 0.53803277, -5.4607888e-08, -0.842923939))
end)

TpL1:AddButton("Marine Starter",function()
	ToTarget2(CFrame.new(-2763.16528, 24.4316978, 2156.80957, 0.199746728, 7.57859056e-08, -0.97984755, -4.45534027e-08, 1, 6.82621604e-08, 0.97984755, 3.00203986e-08, 0.199746728))
end)

TpL1:AddButton("Middle Town",function()
	ToTarget2(CFrame.new(-655.80603, 7.85223389, 1573.32971, -0.364562601, 9.69804077e-08, 0.931178868, 8.04423053e-08, 1, -7.26543021e-08, -0.931178868, 4.84191354e-08, -0.364562601))
end)

TpL1:AddButton("Jungle",function()
	ToTarget2(CFrame.new(-1613.46411, 36.8449554, 145.669052, 0.902628958, 1.08512751e-07, -0.430419505, -1.09732383e-07, 1, 2.19904575e-08, 0.430419505, 2.73817342e-08, 0.902628958))
end)

TpL1:AddButton("Pirate Village",function()
	ToTarget2(CFrame.new(-1213.79846, 4.74492025, 3917.68896, -0.995943129, 3.61450212e-08, 0.0899850801, 3.50883944e-08, 1, -1.33241667e-08, -0.0899850801, -1.01126796e-08, -0.995943129))
end)

TpL1:AddButton("Desert Island",function()
	ToTarget2(CFrame.new(942.70343, 6.60178375, 4275.38086, 0.974750519, -5.67372282e-09, -0.223296762, -4.44893145e-09, 1, -4.4829676e-08, 0.223296762, 4.46911805e-08, 0.974750519))
end)

TpL1:AddButton("Frozen Village",function()
	ToTarget2(CFrame.new(1283.92407, 87.2727737, -1258.15759, -0.950028539, 9.52087298e-09, 0.312163085, -5.61330493e-09, 1, -4.75830539e-08, -0.312163085, -4.69575276e-08, -0.950028539))
end)

TpL1:AddButton("Marine Fortress",function()
	ToTarget2(CFrame.new(-4841.4248, 20.6520443, 4371.40186, -0.538602531, 4.96288912e-08, 0.842559993, 1.17757999e-08, 1, -5.13748759e-08, -0.842559993, -1.77488193e-08, -0.538602531))
end)

TpL1:AddButton("Sky 1st Floor",function()
	ToTarget2(CFrame.new(-5262.55273, 323.869995, -2627.47021, -0.170813233, -1.42706158e-08, 0.985303402, -1.74241901e-08, 1, 1.14627969e-08, -0.985303402, -1.52101176e-08, -0.170813233))
end)

TpL1:AddButton("Sky 2nd Floor",function()
	ToTarget2(CFrame.new(-4785.3418, 717.686279, -2621.16162, 0.99622339, 6.25240801e-08, 0.086827457, -6.43223572e-08, 1, 1.79131572e-08, -0.086827457, -2.34304522e-08, 0.99622339))
end)

TpL1:AddButton("Sky 3rd Floor",function()
	ToTarget2(CFrame.new(-4576.79883, 872.542419, -1684.81812, -0.748490274, 8.59872085e-09, -0.663145781, 2.86456281e-08, 1, -1.93656557e-08, 0.663145781, -3.34912329e-08, -0.748490274))
end)

TpL1:AddButton("Prison",function()
	ToTarget2(CFrame.new(4848.82471, 5.65201807, 735.799255, -0.0664369985, -4.37240288e-08, -0.997790635, -4.62295624e-09, 1, -4.35130296e-08, 0.997790635, 1.7218672e-09, -0.0664369985))
end)

TpL1:AddButton("Colosseum",function()
	ToTarget2(CFrame.new(-1454.33875, 7.28654194, -2879.13062, -0.991750717, -3.33694983e-09, -0.128181443, -1.25186546e-08, 1, 7.08248749e-08, 0.128181443, 7.18452853e-08, -0.991750717))
end)

TpL1:AddButton("Magma",function()
	ToTarget2(CFrame.new(-5378.03613, 8.99068451, 8482.01172, 0.920642078, 3.54393173e-08, -0.390407652, -3.36253478e-08, 1, 1.14813483e-08, 0.390407652, 2.55738097e-09, 0.920642078))
end)

TpL1:AddButton("UnderWater City",function()
	ToTarget2(CFrame.new(3868.27271, 5.37315893, -1909.35669, -0.390500426, 7.37886765e-08, -0.920602739, 8.97523833e-08, 1, 4.2081485e-08, 0.920602739, -6.61934578e-08, -0.390500426))
end)

TpL1:AddButton("Fountain City",function()
	ToTarget2(CFrame.new(5196.77734, 38.5011406, 4126.08154, 0.574243724, 7.93770596e-08, 0.818684399, -8.45396144e-08, 1, -3.76588574e-08, -0.818684399, -4.75858997e-08, 0.574243724))
end)

TpR1:AddButton("First Sea",function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
end)

TpR1:AddButton("Second Sea",function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end)

TpR1:AddButton("Third Sea",function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end)

--Shop
ShopL1:AddToggle('AutoRandomFruit', {
	Text = 'Auto Random Fruit',
    Default = false,
})

Toggles.AutoRandomFruit:OnChanged(function(value)
    _G.AutoRandomFruit = value
end)

ShopL1:AddButton("Random Fruit",function()
	local args = {
		[1] = "Cousin",
		[2] = "Buy"
	}

	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

--Misc
MiscL1:AddToggle('DisibleCameraShake', {
	Text = 'DisibleCamShake',
    Default = true,
})

Toggles.DisibleCameraShake:OnChanged(function(value)
    DisibleCamShake = value
end)

MiscL1:AddToggle('AutoBuso', {
	Text = 'Auto Buso Haki',
    Default = true,
})

Toggles.AutoBuso:OnChanged(function(value)
    _G.AutoBuso = value
end)

MiscR1:AddButton("Rejoin Server",function()
	game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players"))
end)
