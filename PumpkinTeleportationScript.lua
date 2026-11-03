-- Pumpkin Teleportation Script

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

-- Function to teleport players to each pumpkin in the EventPumpkins folder
local function teleportToPumpkins()
    local pumpkins = Workspace:FindFirstChild("EventPumpkins")
    if pumpkins then
        for _, pumpkin in ipairs(pumpkins:GetChildren()) do
            for _, player in ipairs(Players:GetPlayers()) do
                player.Character:MoveTo(pumpkin.Position)
            end
            wait(2)
        end
    else
        warn("EventPumpkins folder not found")
    end
end

-- Create a GUI button labeled 'RUN PUMPKINS'
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PumpkinTeleportationGUI"
ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

local Button = Instance.new("TextButton")
Button.Name = "RunPumpkinsButton"
Button.Size = UDim2.new(0, 200, 0, 50)
Button.Position = UDim2.new(0.5, -100, 0.5, -25)
Button.Text = "RUN PUMPKINS"
Button.Parent = ScreenGui

-- Connect the button click event to the teleport function
Button.MouseButton1Click:Connect(teleportToPumpkins)