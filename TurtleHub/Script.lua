local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})

local F = Window:MakeTab({
Name = "Farm",
Icon = "rbxassetid://13040484705",
PremiumOnly = false
})

local E = Window:MakeTab({
Name = "Egg",
Icon = "rbxassetid://13040484705",
PremiumOnly = false
})

local T = Window:MakeTab({
Name = "TP",
Icon = "rbxassetid://13040484705",
PremiumOnly = false
})

local M = Window:MakeTab({
Name = "Misc",
Icon = "rbxassetid://13040484705",
PremiumOnly = false
})

M:AddButton({
Name = "Free Magnet Gamepass",
Callback = function()
      game.Players.LocalPlayer.PlayerInfo.Gamepasses.OwnsMagnet.Value = true
  end    
})



T:AddButton({
Name = "Sarnek",
Callback = function()
      local A_1 = "Sarnek"
local Event = game:GetService("ReplicatedStorage").Remotes.portalTeleport
Event:FireServer(A_1)
  end    
})

T:AddButton({
Name = "Ninja Town",
Callback = function()
      local A_1 = "Ninja Town"
local Event = game:GetService("ReplicatedStorage").Remotes.portalTeleport
Event:FireServer(A_1)
  end    
})


T:AddButton({
Name = "Demon Hill",
Callback = function()
      local A_1 = "Demon Hill"
local Event = game:GetService("ReplicatedStorage").Remotes.portalTeleport
Event:FireServer(A_1)
  end    
})

T:AddButton({
Name = "Pirate Sea",
Callback = function()
      local A_1 = "Pirate Sea"
local Event = game:GetService("ReplicatedStorage").Remotes.portalTeleport
Event:FireServer(A_1)
  end    
})

T:AddButton({
Name = "Hunter World",
Callback = function()
      local A_1 = "Hunter World"
local Event = game:GetService("ReplicatedStorage").Remotes.portalTeleport
Event:FireServer(A_1)
  end    
})

local Boss = {}
local Miniboss = {}
local Nightboss = {}
local Strong = {}
local Weak = {}
local RankList = {}

local Enemy = {
       Boss = {},
       Miniboss = {},
       NightBoss = {},
       Strong = {},
       Weak = {}
}

local World = {}

while wait(0.5) do
for _,SyncWorld in pairs(game:GetService("Workspace").EnemyNPCs:GetChildren()) do
    table.insert(World, SyncWorld.Name)
end
end

function TableFunc()
for _,EnemyRankList in pairs(game:GetService("Workspace").EnemyNPCs[World]:GetChildren()) do
    table.insert(RankList, EnemyRankList.Name)
end

for _,EnemyBoss in pairs(game:GetService("Workspace").EnemyNPCs[World].Boss:GetChildren()) do
    table.insert(Enemy.Boss, EnemyBoss.Name)
end

for _,EnemyMiniboss in pairs(game:GetService("Workspace").EnemyNPCs[World].Miniboss:GetChildren()) do
    table.insert(Enemy.Miniboss, EnemyBoss.Name)
end

for _,EnemyNight in pairs(game:GetService("Workspace").EnemyNPCs[World]["Night Boss"]:GetChildren()) do
    table.insert(Enemy.Nightboss, EnemyNight.Name)
end

for _,EnemyStrong in pairs(game:GetService("Workspace").EnemyNPCs[World].Strong:GetChildren()) do
    table.insert(Enemy.Strong, EnemyStrong.Name)
end

for _,EnemyWeak in pairs(game:GetService("Workspace").EnemyNPCs[World].Weak:GetChildren()) do
    table.insert(Enemy.Weak, EnemyWeak.Name)
end
end

TableFunc()

local Rank = ""

F:AddDropdown({
       Name = "Select Rank",
       Default = "",
       Options = {"Weak", "Strong", "Miniboss", "Boss", "Nightboss"},
       Callback = function(Value)
           Rank = Value
           TableFunc()
   end    
})

local Enemies = ""
_G.TPFarm = false

F:AddToggle({
     Name = "teleport",
     Default = false,
     Callback = function(Value)
           _G.TPFarm = Value
           while _G.TPFarm do
           if _G.TPFarm == false then break end
           if Rank == "Weak" then
              Enemies = Enemy.Weak
       end
           if Rank == "Strong" then
              Enemies = Enemy.Strong
       end
           if Rank == "Miniboss" then
              Enemies = Enemy.Miniboss
       end
           if Rank == "Boss" then
              Enemies = Enemy.Boss
       end
           if Rank == "Nightboss" then
              Enemies = Enemy.Nightboss
       end
            posenemy = CFrame.new(game.Workspace.EnemyNPCs[World][Rank][Enemies].Position)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = posenemy
       end
       TableFunc()
   end    
})

_G.Swing = false
local Skill = {
      Slot_1 = false,
      Slot_2 = false
}

F:AddToggle({
     Name = "Auto swing",
     Default = false,
     Callback = function(Value)
         _G.Swing = Value
         while _G.Swing do
         if _G.Swing == false then break end
         local Event = game:GetService("ReplicatedStorage").Modules.LBConnection.Remotes.attackFunc
         Event:FireServer()
       end
   end    
})

F:AddToggle({
     Name = "Auto skill (Skill: 1)",
     Default = false,
     Callback = function(Value)
         Skill.Slot_1 = Value
         while Skill.Slot_1 do
         if Skill.Slot_1 == false then break end
         local A_1 = "Slot1"
         local Event = game:GetService("ReplicatedStorage").Remotes["Send Information"]
         Event:FireServer(A_1)
       end
   end    
})

F:AddToggle({
     Name = "Auto skill (Skill: 2)",
     Default = false,
     Callback = function(Value)
         Skill.Slot_2 = Value
         while Skill.Slot_2 do
         if Skill.Slot_2 == false then break end
         local A_1 = "Slot2"
         local Event = game:GetService("ReplicatedStorage").Remotes["Send Information"]
         Event:FireServer(A_1)
       end
   end    
})
