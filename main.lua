local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ByChristian_UI"
gui.ResetOnSpawn = false

-- 💥 Mensaje de Inicio
local msg = Instance.new("TextLabel", gui)
msg.Size = UDim2.new(1, 0, 1, 0)
msg.BackgroundColor3 = Color3.new(0, 0, 0)
msg.Text = "By Christian"
msg.TextScaled = true
msg.TextColor3 = Color3.new(1, 1, 1)
msg.Font = Enum.Font.Arcade
task.delay(2.5, function()
	msg:Destroy()
end)

-- 🔐 Solicitar código
local passFrame = Instance.new("Frame", gui)
passFrame.Size = UDim2.new(0.3, 0, 0.2, 0)
passFrame.Position = UDim2.new(0.35, 0, 0.4, 0)
passFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
passFrame.BorderSizePixel = 0

local passBox = Instance.new("TextBox", passFrame)
passBox.Size = UDim2.new(0.8, 0, 0.4, 0)
passBox.Position = UDim2.new(0.1, 0, 0.2, 0)
passBox.PlaceholderText = "Ingresa la clave"
passBox.Text = ""
passBox.TextScaled = true
passBox.Font = Enum.Font.Arcade
passBox.TextColor3 = Color3.new(1,1,1)
passBox.BackgroundColor3 = Color3.fromRGB(50,50,50)

local confirm = Instance.new("TextButton", passFrame)
confirm.Size = UDim2.new(0.5, 0, 0.3, 0)
confirm.Position = UDim2.new(0.25, 0, 0.65, 0)
confirm.Text = "Entrar"
confirm.Font = Enum.Font.Arcade
confirm.TextScaled = true
confirm.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
confirm.TextColor3 = Color3.new(1,1,1)

-- 🌈 Rainbow
local function rainbow()
	local t = tick()
	return Color3.fromRGB(
		math.sin(t) * 127 + 128,
		math.sin(t + 2 * math.pi / 3) * 127 + 128,
		math.sin(t + 4 * math.pi / 3) * 127 + 128
	)
end

-- 🎮 Panel Principal
local iconBtn = Instance.new("TextButton", gui)
iconBtn.Size = UDim2.new(0, 50, 0, 50)
iconBtn.Position = UDim2.new(0, 20, 0, 20)
iconBtn.Text = "C"
iconBtn.Font = Enum.Font.Arcade
iconBtn.TextScaled = true
iconBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
iconBtn.TextColor3 = Color3.new(1, 1, 1)
iconBtn.Visible = false
iconBtn.Draggable = true

local mainPanel = Instance.new("ScrollingFrame", gui)
mainPanel.Size = UDim2.new(0.6, 0, 0.8, 0)
mainPanel.Position = UDim2.new(0.2, 0, 0.1, 0)
mainPanel.CanvasSize = UDim2.new(0, 0, 2, 0)
mainPanel.ScrollBarThickness = 8
mainPanel.BackgroundColor3 = Color3.fromRGB(15,15,15)
mainPanel.Visible = false
mainPanel.Draggable = true
mainPanel.Active = true

local uilist = Instance.new("UIListLayout", mainPanel)
uilist.Padding = UDim.new(0, 8)
uilist.SortOrder = Enum.SortOrder.LayoutOrder

-- 🔎 Barra de búsqueda
local searchBox = Instance.new("TextBox", mainPanel)
searchBox.Size = UDim2.new(1, -10, 0, 40)
searchBox.Text = ""
searchBox.PlaceholderText = "Buscar script..."
searchBox.Font = Enum.Font.Arcade
searchBox.TextScaled = true
searchBox.TextColor3 = Color3.new(1,1,1)
searchBox.BackgroundColor3 = Color3.fromRGB(30,30,30)

-- 📁 Función para crear una carpeta (botón de sección)
function crearCarpeta(nombre, scripts)
	local folderBtn = Instance.new("TextButton", mainPanel)
	folderBtn.Size = UDim2.new(1, -10, 0, 50)
	folderBtn.Text = "📁 " .. nombre
	folderBtn.Font = Enum.Font.Arcade
	folderBtn.TextScaled = true
	folderBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
	folderBtn.TextColor3 = Color3.new(1,1,1)

	folderBtn.MouseButton1Click:Connect(function()
		mainPanel:ClearAllChildren()
		uilist.Parent = mainPanel
		searchBox.Parent = mainPanel

		for i, scr in pairs(scripts) do
			local btn = Instance.new("TextButton", mainPanel)
			btn.Size = UDim2.new(1, -10, 0, 45)
			btn.Text = scr[1]
			btn.Font = Enum.Font.Arcade
			btn.TextScaled = true
			btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
			btn.TextColor3 = Color3.new(1,1,1)
			btn.MouseButton1Click:Connect(function()
				loadstring(game:HttpGet(scr[2]))()
			end)
		end

		local backBtn = Instance.new("TextButton", mainPanel)
		backBtn.Size = UDim2.new(1, -10, 0, 45)
		backBtn.Text = "🔙 Regresar"
		backBtn.Font = Enum.Font.Arcade
		backBtn.TextScaled = true
		backBtn.BackgroundColor3 = Color3.fromRGB(100,30,30)
		backBtn.TextColor3 = Color3.new(1,1,1)
		backBtn.MouseButton1Click:Connect(function()
			mainPanel:ClearAllChildren()
			uilist.Parent = mainPanel
			searchBox.Parent = mainPanel
			cargarSecciones()
		end)
	end)
end

-- 📚 Lista de scripts
local juegosPopulares = {
	{"🧠 Brainlot", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
	{"🚓 Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
	{"🚂 Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
	{"🍉 Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"},
}

local comandos = {
	{"🚀 Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
	{"🌀 Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
	{"👁 ESP Player", "https://pastebin.com/raw/7HcQ3V3r"},
	{"💻 Infinity Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
}

local generales = {
	{"🌟 Fe Admin", "https://pastebin.com/raw/V5PQy3y0"},
	{"🔒 Anti AFK", "https://pastebin.com/raw/1H8ZcHFk"},
	{"💰 Auto Farm Sim", "https://pastebin.com/raw/vQfGSxTq"},
	-- Agrega más scripts aquí (40 en total)
}

-- 🧩 Cargar carpetas
function cargarSecciones()
	crearCarpeta("Juegos Populares", juegosPopulares)
	crearCarpeta("Comandos", comandos)
	crearCarpeta("General", generales)
end

-- 🟦 TikTok botón
local tiktok = Instance.new("TextButton", mainPanel)
tiktok.Size = UDim2.new(1, -10, 0, 40)
tiktok.Text = "🎵 TikTok: @christ_sebast_7d"
tiktok.Font = Enum.Font.Arcade
tiktok.TextScaled = true
tiktok.BackgroundColor3 = Color3.fromRGB(10,10,10)
tiktok.TextColor3 = Color3.new(1,1,1)
tiktok.MouseButton1Click:Connect(function()
	setclipboard("https://www.tiktok.com/@christ_sebast_7d")
end)

-- 🌈 Efecto rainbow
game:GetService("RunService").RenderStepped:Connect(function()
	local color = rainbow()
	for _, v in pairs(mainPanel:GetDescendants()) do
		if v:IsA("TextButton") or v:IsA("TextLabel") then
			v.TextColor3 = color
		end
	end
	iconBtn.TextColor3 = color
end)

-- 🔐 Verificación de código
confirm.MouseButton1Click:Connect(function()
	if passBox.Text == "AYAM" then
		passFrame:Destroy()
		iconBtn.Visible = true
	else
		passBox.PlaceholderText = "Código incorrecto"
		passBox.Text = ""
	end
end)

iconBtn.MouseButton1Click:Connect(function()
	mainPanel.Visible = not mainPanel.Visible
	mainPanel:ClearAllChildren()
	uilist.Parent = mainPanel
	searchBox.Parent = mainPanel
	cargarSecciones()
	tiktok.Parent = mainPanel
end)
