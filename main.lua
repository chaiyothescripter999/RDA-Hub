local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()-- Get rayfield
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local Window = Rayfield:CreateWindow({ -- Make a window
    Name = "RDA Hub | by @catlov_rr",
    LoadingTitle = "Loading, please wait for the fun...",
    LoadingSubtitle = "by @catlov_rr",
    ConfigurationSaving = {
       Enabled = true,
       FileName = "RDA Hub"
    },
    Discord = {
       Enabled = true,
       Invite = "JGHFYXbU", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = false -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "RDA Hub | @catlov_rr",--ignore all these its scrapped
       Subtitle = "Key system",
       Note = "Join gg/JGHFYXbU",
       FileName = "RDAKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"RDA ON TOP FELLAS", "RDA THE BEST", "RDA ON TOP", "RDA NUMBER 1", "RAID DECIMATION ADVANCEMENTS ON TOP"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

local Global = Window:CreateTab("🌎 | Global scripts") --GLOBAL PART
local IYs = 0
local IY = Global:CreateButton({
   Name = "Show infinite yield",
   Callback = function()
      if IYs == 0 then
         loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
         IYs = 1
      else
         Rayfield:Notify({
            Title = "Notify",
            Content = "You already loaded Infinite Yield!",
            Duration = 6.5,
            Image = 4483362458,
            Actions = { -- Notification Buttons
               Ignore = {
                  Name = "Okay!",
                  Callback = function()
               end
            },
         },
         })
      end
   end
})

local ChatSpam = Window:CreateTab("💬 | Chat Spamming Service")

if game.PlaceId == 6764533218 then
   local Washiez = Window:CreateTab("💦 | Washiez Trolling Panel")

   --CHECK PLAYER RANK FUNCTION, no need to tamper
   --CORP INTERN
   local HRs = {"Corporate Intern","Junior Corporate","Senior Corporate","Head Corporate","Automation","Cheif Human Resources Officer", "Cheif Public Relations Officer","Cheif Operating Officer", "Cheif Administrative Officer"}
   function CheckHighRank(RankName)
      for i,v in ipairs(HRs) do
         if RankName == v then
            return true
         end
      end
      return false
   end

   --10261023 GROUP ID
   local CheckHRs = Washiez:CreateButton({
      Name = "Check HRs in-game. (Can ban, Corp+ pban)",
      Callback = function()
         local HRNumber = 0
         for _, Target in pairs(Players:GetPlayers()) do
            if Target:IsInGroup(10261023) then
               if CheckHighRank(Target:GetRoleInGroup(10261023)) == true then
                  HRNumber = HRNumber + 1
               end
            end
         end
         Rayfield:Notify({
            Title = "Alert",
            Content = "There is "..HRNumber.." HRs in-game!",
            Duration = 10,
            Image = 4483362458,
            Actions = { -- Notification Buttons
               Ignore = {
                  Name = "Got it!",
                  Callback = function()
                  end
               },
            },
         })
      end,
   })
   --CHECK MRs (i didnt make LRs becuase they didnt matter that much)
   local MRs = {"Shift Leader","Supervisor","Assistant Manager","General Manager","Junior Director", "Senior Director", "Head Director"}
   function CheckMediumRank(RankName)
      for i,v in ipairs(MRs) do
         if RankName == v then
            return true
         end
      end
      return false
   end

   local CheckMRs = Washiez:CreateButton({
      Name = "Check MRs in-game. Can only jail",
      Callback = function()
         local MRNumber = 0
         for _, Target in pairs(Players:GetPlayers()) do
            if Target:IsInGroup(10261023) then
               if CheckMediumRank(Target:GetRoleInGroup(10261023)) == true then
                  MRNumber = MRNumber + 1
               end
            end
         end
         Rayfield:Notify({
            Title = "Alert",
            Content = "There is "..MRNumber.." MRs in-game!",
            Duration = 10,
            Image = 4483362458,
            Actions = { -- Notification Buttons
               Ignore = {
                  Name = "Got it!",
                  Callback = function()
                  end
               },
            },
         })
      end,
   })

   --open all doors with simple technique
   local OpenAllDoors = Washiez:CreateButton({
      Name = "Unlock all doors (Client-sided)",
      Callback = function()
         --game devs... really? dude? this is too simple technique
         game.Players.LocalPlayer.GroupInfo.Rank.Value = 255
      end
   })

   local JoinRankDetector = false
   local JoinDetector = Washiez:CreateToggle({
      Name = "Automatic Joined Player's rank Detector",
      CurrentValue = false,
      Callback = function(Value)
         JoinRankDetector = Value
      end,
   })
   
   game.Players.PlayerAdded:Connect(function(Plr) --detect player joining
      if JoinRankDetector == true then
         for _,Role in ipairs(MRs) do
            if Role == Players:GetRoleInGroup(Plr) then
               Rayfield:Notify({
                  Title = "Notification",
                  Content = "An MR joined.",
                  Duration = 10,
                  Image = 4483362458,
                  Actions = { -- Notification Buttons
                     Ignore = {
                        Name = "Got it!",
                        Callback = function() end
                     },
                  },
               })
               break
            end
         end
         for _,Role in ipairs(HRs) do
            if Role == Players:GetRoleInGroup(Plr) then
               Rayfield:Notify({
                  Title = "Notification",
                  Content = "An MR joined.",
                  Duration = 10,
                  Image = 4483362458,
                  Actions = { -- Notification Buttons
                     Ignore = {
                        Name = "Got it!",
                        Callback = function()end
                     },
                  },
               })
               break
            end
         end
      end
   end)

   local CarFlinger = Global:CreateButton({
      Name = "Show car flinger",
      Callback = function()
         loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'), true))()
      end
   })
end