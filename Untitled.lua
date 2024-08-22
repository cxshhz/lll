local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/7yhx/kwargs_Ui_Library/main/source.lua"))()

-- Variáveis para armazenar o estado original das traits e souls
local originalTraits
local originalSouls
local rollbackActive = false

-- Função para salvar o estado atual das traits e souls
local function saveState()
    originalTraits = --[[
        Lógica para salvar o estado atual das traits
        Exemplo: game.Players.LocalPlayer.Traits:Clone()
    ]]
    originalSouls = --[[
        Lógica para salvar o estado atual das souls
        Exemplo: game.Players.LocalPlayer.Souls:Clone()
    ]]
end

-- Função para ativar o rollback
local function activateRollback()
    rollbackActive = true
    saveState()
    -- Mostrar mensagem na tela
    Library:Notify("Rollback ativado!", "As traits e souls serão revertidas se você reentrar no servidor.", 5)
end

-- Função para rejoin do servidor
local function rejoinServer()
    if rollbackActive then
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
end

-- Bind das teclas para as funções
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        if input.KeyCode == Enum.KeyCode.R then
            activateRollback()
        elseif input.KeyCode == Enum.KeyCode.J then
            rejoinServer()
        end
    end
end)