# BridgeSystem-and-ModuleManager
Manager Client Modules and Fire an RemoteEvent

## **Use Example**
```Luau
Handler.Bridge:Fire('PlayerHandler', 'Ban', Handler.Player)
```
### The previous code, Fires an request to server with params: ModuleName, FunctionName, RemoteArgs. This can be used to fire Remote Events with more security and less ping
