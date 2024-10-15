local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()-- Get rayfield
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local Window = Rayfield:CreateWindow({ -- Make a window
    Name = "Raid Decimation Advancements Hub",
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
       Title = "RDA Hub | @catlov_rr",
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

local ChatSpam = Window:CreateTab("💬|Chat Spamming Service")

if game.GameId == 6764533218 then
   local Washiez = Window:CreateTab("💦|Washiez Trolling Panel")

   --CHECK PLAYER RANK FUNCTION, no need to tamper
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
      Name = "Check HRs in-game.",
      Callback = function()
         local HRNumber = 0
         for _, Target in pairs(Players:GetPlayers()) do
            if Target:IsInGroup(10261023) then
               if CheckHighRank(Target:GetRankInGroup(10261023)) == true then
                  HRs = HRs + 1
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
      Name = "Check MRs in-game.",
      Callback = function()
         local MRNumber = 0
         for _, Target in pairs(Players:GetPlayers()) do
            if Target:IsInGroup(10261023) then
               if CheckMediumRank(Target:GetRankInGroup(10261023)) == true then
                  HRs = HRs + 1
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
end