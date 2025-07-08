local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

-- 🌈 Rainbow función
local function rainbowColor()
	local t = tick()
	return Color3.fromRGB(
		math.floor(math.sin(t) * 127 + 128),
		math.floor(math.sin(t + 2) * 127 + 128),
		math.floor(math.sin(t + 4) * 127 + 128)
	)
end

-- 🧠 Verificación de contraseña (con linkvertise)
local function solicitarContraseña()
	local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
	gui.Name = "LoginUI"

	local frame = Instance.new("Frame", gui)
	frame.Size = UDim2.new(0, 300, 0, 150)
	frame.Position = UDim2.new(0.5, -150, 0.5, -75)
	frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Instance.new("UICorner", frame)

	local label = Instance.new("TextLabel", frame)
	label.Size = UDim2.new(1, 0, 0.4, 0)
	label.Position = UDim2.new(0, 0, 0, 0)
	label.Text = "Ingresa el código desde:\nhttps://direct-link.net/1368874/wNwAURpoRoSy"
	label.TextScaled = true
	label.TextWrapped = true
	label.TextColor3 = Color3.new(1,1,1)
	label.Font = Enum.Font.Gotham
	label.BackgroundTransparency = 1

	local textbox = Instance.new("TextBox", frame)
	textbox.Size = UDim2.new(0.8, 0, 0.2, 0)
	textbox.Position = UDim2.new(0.1, 0, 0.45, 0)
	textbox.PlaceholderText = "Código aquí"
	textbox.TextScaled = true
	textbox.Font = Enum.Font.Gotham
	textbox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	textbox.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", textbox)

	local boton = Instance.new("TextButton", frame)
	boton.Size = UDim2.new(0.5, 0, 0.2, 0)
	boton.Position = UDim2.new(0.25, 0, 0.75, 0)
	boton.Text = "Ingresar"
	boton.TextScaled = true
	boton.Font = Enum.Font.Gotham
	boton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	boton.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", boton)

	boton.MouseButton1Click:Connect(function()
		if textbox.Text == "AYAM" then
			gui:Destroy()
			cargarPanel()
		else
			textbox.Text = "❌ Código incorrecto"
		end
	end)
end

-- 🎮 Panel principal (se carga tras verificación)
function cargarPanel()
	local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
	gui.Name = "ChristianHubUI"
	gui.ResetOnSpawn = false

	-- Ícono flotante con tu gorra CMLP
	local icon = Instance.new("ImageButton", gui)
	icon.Size = UDim2.new(0, 60, 0, 60)
	icon.Position = UDim2.new(0, 20, 0, 20)
	icon.Image = "rbxassetid://94777373855263"
	icon.BackgroundTransparency = 1
	icon.Draggable = true

	-- 🧾 Panel vertical principal
	local panel = Instance.new("Frame", gui)
	panel.Size = UDim2.new(0, 400, 0, 500)
	panel.Position = UDim2.new(0.5, -200, 0.5, -250)
	panel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	panel.BackgroundTransparency = 0.4
	panel.Visible = false
	panel.Active = true
	panel.Draggable = true
	Instance.new("UICorner", panel)
	local stroke = Instance.new("UIStroke", panel)
	stroke.Thickness = 2

	-- Título
	local title = Instance.new("TextLabel", panel)
	title.Size = UDim2.new(1, 0, 0, 40)
	title.Text = "By Christian"
	title.Font = Enum.Font.Arcade
	title.TextScaled = true
	title.TextColor3 = Color3.new(1,1,1)
	title.BackgroundTransparency = 1

	-- 🧾 Submenú contenedor scrollable
	local scroll = Instance.new("ScrollingFrame", panel)
	scroll.Size = UDim2.new(1, -10, 1, -60)
	scroll.Position = UDim2.new(0, 5, 0, 50)
	scroll.CanvasSize = UDim2.new(0, 0, 5, 0)
	scroll.BackgroundTransparency = 1
	scroll.ScrollBarThickness = 6

	-- 🟨 Búsqueda
	local buscar = Instance.new("TextBox", panel)
	buscar.Size = UDim2.new(0.6, 0, 0, 30)
	buscar.Position = UDim2.new(0.2, 0, 0, 10)
	buscar.PlaceholderText = "Buscar script..."
	buscar.TextScaled = true
	buscar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	buscar.TextColor3 = Color3.new(1,1,1)
	buscar.Font = Enum.Font.Gotham
	Instance.new("UICorner", buscar)

	-- 📂 Crear carpeta
	local function crearCarpeta(nombre, scripts)
		local folderBtn = Instance.new("TextButton", scroll)
		folderBtn.Size = UDim2.new(0.9, 0, 0, 40)
		folderBtn.Position = UDim2.new(0.05, 0, 0, #scroll:GetChildren() * 45)
		folderBtn.Text = "📁 "..nombre
		folderBtn.Font = Enum.Font.Arcade
		folderBtn.TextScaled = true
		folderBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		folderBtn.TextColor3 = Color3.new(1,1,1)
		Instance.new("UICorner", folderBtn)

		folderBtn.MouseButton1Click:Connect(function()
			scroll:ClearAllChildren()
			for i, s in pairs(scripts) do
				local btn = Instance.new("TextButton", scroll)
				btn.Size = UDim2.new(0.9, 0, 0, 40)
				btn.Position = UDim2.new(0.05, 0, 0, (i-1)*45)
				btn.Text = s[1]
				btn.TextScaled = true
				btn.Font = Enum.Font.Arcade
				btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				btn.TextColor3 = Color3.new(1,1,1)
				Instance.new("UICorner", btn)

				btn.MouseButton1Click:Connect(function()
					loadstring(game:HttpGet(s[2]))()
				end)
			end

			-- 🔙 Botón regresar
			local back = Instance.new("TextButton", scroll)
			back.Size = UDim2.new(0.9, 0, 0, 40)
			back.Position = UDim2.new(0.05, 0, 0, #scripts*45 + 10)
			back.Text = "⬅ Regresar"
			back.TextScaled = true
			back.Font = Enum.Font.Arcade
			back.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
			back.TextColor3 = Color3.new(1,1,1)
			Instance.new("UICorner", back)
			back.MouseButton1Click:Connect(function()
				gui:Destroy()
				cargarPanel()
			end)
		end)
	end

	-- 📁 Carpetas y scripts (puedes añadir más)
	crearCarpeta("Juegos Populares", {
		{"🧠 Brainlot", "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"},
		{"🚓 Jailbreak", "https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"},
		{"🚂 Dead Rails", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails"},
		{"🍉 Blox Fruits", "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"}
	})

	crearCarpeta("Comandos", {
		{"🚀 Fly V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
		{"🌀 Touch Fling", "https://rawscripts.net/raw/Universal-Script-TOUCH-FLING-ULTRA-POWER-30194"},
		{"👁 ESP Player", "https://raw.githubusercontent.com/RandomAdamYT/public-scripts/main/ESP.lua"},
		{"📜 Infinity Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"}
	})

	crearCarpeta("General", {
		{"🛡 AntiBan Test", "https://pastebin.com/raw/k8jz76kZ"},
		{"💰 Auto Farm", "https://pastebin.com/raw/a23v7s8h"},
		{"⚔ Combat Mode", "https://pastebin.com/raw/fzcvwm9D"},
		-- puedes agregar hasta 40 aquí...
	})

	-- Mostrar / ocultar panel
	icon.MouseButton1Click:Connect(function()
		panel.Visible = not panel.Visible
	end)

	-- 🎨 Efecto rainbow
	RunService.RenderStepped:Connect(function()
		local color = rainbowColor()
		title.TextColor3 = color
		for _, v in pairs(scroll:GetChildren()) do
			if v:IsA("TextButton") then
				v.TextColor3 = color
			end
		end
	end)
end

-- ⚠ Inicia con contraseña
solicitarContraseña()
