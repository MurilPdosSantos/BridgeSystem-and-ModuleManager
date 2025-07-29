local Handler = {
	Player = {
		['Instance'] = game.Players.LocalPlayer,
	},
	Cache = {},
	Scripts = {},
	}

function Handler:Start()
	local LoadedSucess = 0
	local LoadedFailed = 0

	for _, Module in next, script:WaitForChild('Storage'):GetChildren() do
		if not Module:IsA('ModuleScript') then continue end

		local sucess,_ = pcall(function()
			MetaService[Module.Name] = require(Module)
		end)

		LoadedSucess += if sucess then 1 else 0
		LoadedFailed += if not sucess then 1 else 0
	end
	
	for _, Module in next, script:WaitForChild('Scripts'):GetChildren() do
		if not Module:IsA('ModuleScript') or MetaService.Scripts[Module.Name] then continue end

		local sucess,_ = pcall(function()
			MetaService.Scripts[Module.Name] = require(Module)
		end)

		LoadedSucess += if sucess then 1 else 0
		LoadedFailed += if not sucess then 1 else 0
	end
	

	warn('[Meta Service] Client Loaded, Success: ' .. LoadedSucess .. ' Failed: ' .. LoadedFailed)
end

return Handler
