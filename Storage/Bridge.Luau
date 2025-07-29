local Handler = require(script.Parent.Parent)

local module = {}

function module:Fire(...)
	game:GetService('ReplicatedStorage').Bridge:FireServer(...)
end

function module:BridgeReceive(ModuleName, FunctionName, ...)
	if not Handler.Scripts[ModuleName] then warn(`[Client].Bridge module {ModuleName} not founded`); return end

	local FunctionTable = Handler.Scripts[ModuleName][FunctionName]
	if not FunctionTable or type(FunctionTable) ~= 'function' then warn(`[Client].Bridge function {FunctionName} not founded`); return end

	FunctionTable(...)
end

game:GetService('ReplicatedStorage'):WaitForChild('Bridge').OnClientEvent:Connect(function(ModuleName : string, FunctionName : string, ...)
	if not ModuleName or type(ModuleName) ~= 'string' or not FunctionName or type(FunctionName) ~= 'string' then return end

	if not Handler.Scripts[ModuleName] or not Handler.Scripts[ModuleName][FunctionName] then 
		if not Handler.Scripts[ModuleName] then
			warn(`[Client].Bridge no such module called {ModuleName}`)
			return
		end
		
		warn(`[Client].Bridge no such function called {FunctionName}`)
		return
	end

	module:BridgeReceive(ModuleName, FunctionName, ...)
end)

return module
