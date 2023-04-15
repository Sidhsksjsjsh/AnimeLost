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

local VIP = 0.5

_G.ConvertGems = false

M:AddButton({
Name = "Free Magnet Gamepass",
Callback = function()
      game.Players.LocalPlayer.PlayerInfo.Gamepasses.OwnsMagnet.Value = true
  end    
})

M:AddToggle({
     Name = "Convert gems",
     Default = false,
     Callback = function(Value)
       _G.ConvertGems = Value
       while wait(VIP) do
        if _G.ConvertGems == false then break end
         local args = {
    [1] = "All"
}

game:GetService("ReplicatedStorage").Remotes.convertGem:FireServer(unpack(args))
       end
   end    
})

_G.SpinSkill = false

M:AddToggle({
Name = "auto spin skill",
Default = false,
Callback = function(Value)
   _G.SpinSkill = Value
   while wait(VIP) do
      if _G.SpinSkill == false then break end
      game:GetService("ReplicatedStorage").Modules.LBConnection.Remotes.Skill_Spin:FireServer()
      end
end    
})

_G.Quest = false

M:AddToggle({
Name = "auto quest",
Default = false,
Callback = function(Value)
   _G.Quest = Value
   while wait(VIP) do
      if _G.Quest == false then break end
      local args = {
    [1] = "Get"
}

game:GetService("ReplicatedStorage").Remotes.questStatus:FireServer(unpack(args))
      end
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

local Rank = ""
local Town = {}

function GetTownName()
for _,TownCity in pairs(game:GetService("Workspace").EnemyNPCs:GetChildren()) do
         table.insert(Town, TownCity.Name)
         return Town
end
end

local EnemyName = ""

F:AddTextbox({
       Name = "Enter Enemy name",
       Default = "Input",
       TextDisappear = false,
       Callback = function(Value)
           EnemyName = Value
   end  
})

F:AddDropdown({
       Name = "Select Enemy Rank",
       Default = "",
       Options = {"Weak", "Strong", "Miniboss", "Boss", "Nightboss"},
       Callback = function(Value)
           Rank = Value
   end    
})

local Enemies = ""
_G.TPFarm = false
_G.SC = false

F:AddToggle({
     Name = "Send Companions",
     Default = false,
     Callback = function(Value)
           _G.SC = Value
           while wait(VIP) do
           if _G.SC == false then break end
           local args = {
                     [1] = workspace.EnemyNPCs:FindFirstChild(GetTownName())[Rank]:FindFirstChild(EnemyName)
             }
  
game:GetService("ReplicatedStorage").Remotes.sendCompanions:FireServer(unpack(args))
       end
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
         while wait(VIP) do
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
         while wait(VIP) do
         if Skill.Slot_1 == false then break end
         local A_1 = "Slot1"
         local Event = game:GetService("ReplicatedStorage").Remotes["Send Information"]
         Event:FireServer(A_1)
       end
   end    
})

_G.Re = false

F:AddToggle({
     Name = "Auto skill (Skill: 2)",
     Default = false,
     Callback = function(Value)
         Skill.Slot_2 = Value
         while wait(VIP) do
         if Skill.Slot_2 == false then break end
         local A_1 = "Slot2"
         local Event = game:GetService("ReplicatedStorage").Remotes["Send Information"]
         Event:FireServer(A_1)
       end
   end    
})

F:AddToggle({
     Name = "Auto Rebirth",
     Default = false,
     Callback = function(Value)
         _G.Re = Value
         while wait(VIP) do
         if _G.Re == false then break end
         game:GetService("ReplicatedStorage").Modules.LBConnection.Remotes.RebirthRem:FireServer()
       end
   end    
})
