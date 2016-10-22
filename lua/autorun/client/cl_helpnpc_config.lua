--[CONFIG]-----
HelpNPC = {}

HelpNPC.Title = "POLICE HELP NPC" --The title to be displayed at the top and above the NPCs head
HelpNPC.WelcomeMessage = "Hello, what can I help you with?" --The inital message when menu is open
HelpNPC.AnswerSize = 22; --The font size of the answers and welcome message

--[COLOURS]-----------------

--Default (Grey)--
HelpNPC.MainColor = Color(30, 30, 30) --The colour of the main background
HelpNPC.SecondaryColor = Color(40, 40, 40) --The colour of the header background
HelpNPC.CloseButtonColor = Color(20,20,20) --The colour of the close button
HelpNPC.TextColor = Color(255,255,255) --The colour of all the text

--SOME THEME PRESETS (REPLACE THE VALUES ABOVE WITH A CHOSEN THEME IF YOU WISH TO USE ONE)--

--Red--
//MainColor = Color(179, 0, 0)
//SecondaryColor = Color(94, 0, 0) 
//CloseButtonColor = Color(25,0,0) 
//TextColor = Color(255,255,255) 

--Green--
//MainColor = Color(0, 179, 0)
//SecondaryColor = Color(0, 94, 0) 
//CloseButtonColor = Color(0,25,0) 
//TextColor = Color(255,255,255)

--Blue--
//MainColor = Color(38, 86, 173)
//SecondaryColor = Color(17, 58, 133) 
//CloseButtonColor = Color(7,26,61) 
//TextColor = Color(255,255,255)

--[QUESTIONS AND ANSWERS]-----------------

HelpNPC.NumberOfQuestions = 6; --Choose how many questions you want to use (Max of 6)

//Question 1
HelpNPC.Question1 = "What weapons do I get as a Police Officer?" --What do you want the question to be?
HelpNPC.Answer1 = "As a police officer, you get a Deagle and an MP5." --What do you want the answer to be?

//Question 2 (EDIT IF USING)
HelpNPC.Question2 = "Where can I get police vehicles?" --What do you want the question to be?
HelpNPC.Answer2 = "You can find police vehicles in the parking garage below the PD." --What do you want the answer to be?

//Question 3 (EDIT IF USING)
HelpNPC.Question3 = "Where is the Police Department located?" --What do you want the question to be?
HelpNPC.Answer3 = "The Police Department is located near the bank of America." --What do you want the answer to be? 

//Question 4 (EDIT IF USING)
HelpNPC.Question4 = "When should I use lethal force?" --What do you want the question to be?
HelpNPC.Answer4 = "Lethal force should only be used if your life is in direct danger. Otherwise, arrest the suspect." --What do you want the answer to be?

//Question 5 (EDIT IF USING)
HelpNPC.Question5 = "How do I arrest someone?" --What do you want the question to be?
HelpNPC.Answer5 = "To arrest a suspect, handcuff them and drag them to the jailer NPC that can be found in the PD. From there, you can set the time that they should be jailed for." --What do you want the answer to be?

//Question 6 (EDIT IF USING)
HelpNPC.Question6 = "Can I drive normal cars as a Police Officer?" --What do you want the question to be?
HelpNPC.Answer6 = "No, you may only drive police vehicles when you are a Police Officer." --What do you want the answer to be?


--[END OF CONFIG, DO NOT TOUCH ANYTHING BELOW HERE]-----
--[END OF CONFIG, DO NOT TOUCH ANYTHING BELOW HERE]-----
--[END OF CONFIG, DO NOT TOUCH ANYTHING BELOW HERE]-----
--[END OF CONFIG, DO NOT TOUCH ANYTHING BELOW HERE]-----



//create fonts
surface.CreateFont( "CloseButton", {
	font = "Arial Black", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 30,
	weight = 250,
	blursize = 0,
	scanlines = 0,
	antialias = true,
} )

surface.CreateFont( "Header", {
	font = "Arial Bold", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 30,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
} )

surface.CreateFont( "WelcomeMessage", {
	font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = HelpNPC.AnswerSize,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
} )

surface.CreateFont( "Questions", {
	font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 20,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
} )

surface.CreateFont( "AboveHead", {
	font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 80,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
} )

HelpNPC.FrameSize = 150 + ( HelpNPC.NumberOfQuestions * 50 )

function NPCHelp()

//MAIN FRAME
local frame = vgui.Create( "DFrame" )
frame:SetSize( 600, HelpNPC.FrameSize )
frame:Center()
frame:MakePopup()
frame:SetVisible(true)
frame:SetTitle("")
frame:ShowCloseButton(false)
frame:SetDraggable(false)
frame.Paint = function(s, w, h)
	draw.RoundedBox(10,0,0,w,h,HelpNPC.MainColor)
end

//TITLE BAR
local titlebar = vgui.Create( "DLabel" , frame)
titlebar:SetSize( 600, 50 )
titlebar:SetPos(0,0)
titlebar:SetVisible(true)
titlebar:SetText("")
titlebar.Paint = function(s, w, h)
	draw.RoundedBox(0,0,0,w,h,HelpNPC.SecondaryColor)
end

//TITLE
local title = vgui.Create( "DLabel" , titlebar)
title:SetSize( 600, 50 )
title:SetPos(10,0)
title:SetVisible(true)
title:SetFont("Header")
title:SetTextColor(HelpNPC.TextColor)
title:SetText(HelpNPC.Title)

//WELCOME MESSAGE
local welcome = vgui.Create( "DLabel" , frame)
welcome:SetSize( 400, 120 )
welcome:SetPos(10,40)
welcome:SetVisible(true)
welcome:SetFont("WelcomeMessage")
welcome:SetTextColor(HelpNPC.TextColor)
welcome:SetText(HelpNPC.WelcomeMessage)

//CLOSE BUTTON
local closebutton = vgui.Create( "DButton" , frame)
closebutton:SetPos(550, 0)
closebutton:SetSize( 50, 50 )
closebutton:SetFont("CloseButton")
closebutton:SetText("")
closebutton:SetTextColor(HelpNPC.TextColor)
closebutton.Paint = function(s, w, h)
	draw.RoundedBox(1,0,0,w,h,HelpNPC.CloseButtonColor)
end
 closebutton.thick = 15;
closebutton.Paint = function(s, w, h)
draw.RoundedBox(1,0,0,w,h,HelpNPC.CloseButtonColor)

draw.NoTexture();
surface.SetDrawColor(HelpNPC.TextColor);
  surface.DrawTexturedRectRotated(w/2 + 1, h/2, s.thick, 2, 45);
  surface.DrawTexturedRectRotated(w/2 + 1, h/2, s.thick, 2, 135);
end

function closebutton:DoClick()
	frame:Remove()
end

//QUESTIONS

HelpNPC.clicked1 = false;
HelpNPC.clicked2 = false;
HelpNPC.clicked3 = false;
HelpNPC.clicked4 = false;
HelpNPC.clicked5 = false;
HelpNPC.clicked6 = false;

//QUESTION 1
local question1 = vgui.Create( "DButton" , frame)
question1:SetPos(10, 150)
question1:SetSize( 580, 40 )
question1:SetFont("Questions")
question1:SetText(HelpNPC.Question1)
question1:SetTextColor(HelpNPC.TextColor)
question1.Paint = function(s, w, h)
	draw.RoundedBox(5,0,0,w,h,HelpNPC.SecondaryColor)
end
function question1:DoClick()	
	welcome:Remove()
	if HelpNPC.clicked1 == true then
	answer1:Remove()
	end
	if HelpNPC.clicked2 == true then
	answer2:Remove()
	end
	if HelpNPC.clicked3 == true then
	answer3:Remove()
	end
	if HelpNPC.clicked4 == true then
	answer4:Remove()
	end
	if HelpNPC.clicked5 == true then
	answer5:Remove()
	end
	if HelpNPC.clicked6 == true then
	answer6:Remove()
	end
answer1 = vgui.Create( "DLabel" , frame)
answer1:SetSize( 580, 120 )
answer1:SetPos(10,40)
answer1:SetVisible(true)
answer1:SetWrap(true)
answer1:SetFont("WelcomeMessage")
answer1:SetTextColor(HelpNPC.TextColor)
answer1:SetText(HelpNPC.Answer1)
HelpNPC.clicked1 = true;
end

//QUESTION 2
local question2 = vgui.Create( "DButton" , frame)
question2:SetPos(10, 200)
question2:SetSize( 580, 40 )
question2:SetFont("Questions")
question2:SetText(HelpNPC.Question2)
question2:SetTextColor(HelpNPC.TextColor)
question2.Paint = function(s, w, h)
	draw.RoundedBox(5,0,0,w,h,HelpNPC.SecondaryColor)
end
function question2:DoClick()
	welcome:Remove()
	if HelpNPC.clicked1 == true then
	answer1:Remove()
	end
	if HelpNPC.clicked2 == true then
	answer2:Remove()
	end
	if HelpNPC.clicked3 == true then
	answer3:Remove()
	end
	if HelpNPC.clicked4 == true then
	answer4:Remove()
	end
	if HelpNPC.clicked5 == true then
	answer5:Remove()
	end
	if HelpNPC.clicked6 == true then
	answer6:Remove()
	end
answer2 = vgui.Create( "DLabel" , frame)
answer2:SetSize( 580, 120 )
answer2:SetPos(10,40)
answer2:SetVisible(true)
answer2:SetWrap(true)
answer2:SetFont("WelcomeMessage")
answer2:SetTextColor(HelpNPC.TextColor)
answer2:SetText(HelpNPC.Answer2)
HelpNPC.clicked2 = true;
end

//QUESTION 3
local question3 = vgui.Create( "DButton" , frame)
question3:SetPos(10, 250)
question3:SetSize( 580, 40 )
question3:SetFont("Questions")
question3:SetText(HelpNPC.Question3)
question3:SetTextColor(HelpNPC.TextColor)
question3.Paint = function(s, w, h)
	draw.RoundedBox(5,0,0,w,h,HelpNPC.SecondaryColor)
end
function question3:DoClick()
	welcome:Remove()
	if HelpNPC.clicked1 == true then
	answer1:Remove()
	end
	if HelpNPC.clicked2 == true then
	answer2:Remove()
	end
	if HelpNPC.clicked3 == true then
	answer3:Remove()
	end
	if HelpNPC.clicked4 == true then
	answer4:Remove()
	end
	if HelpNPC.clicked5 == true then
	answer5:Remove()
	end
	if HelpNPC.clicked6 == true then
	answer6:Remove()
	end
HelpNPC.clicked3 = true;
answer3 = vgui.Create( "DLabel" , frame)
answer3:SetSize( 580, 120 )
answer3:SetPos(10,40)
answer3:SetWrap(true)
answer3:SetVisible(true)
answer3:SetFont("WelcomeMessage")
answer3:SetTextColor(HelpNPC.TextColor)
answer3:SetText(HelpNPC.Answer3)
end

//QUESTION 4
local question4 = vgui.Create( "DButton" , frame)
question4:SetPos(10, 300)
question4:SetSize( 580, 40 )
question4:SetFont("Questions")
question4:SetText(HelpNPC.Question4)
question4:SetTextColor(HelpNPC.TextColor)
question4.Paint = function(s, w, h)
	draw.RoundedBox(5,0,0,w,h,HelpNPC.SecondaryColor)
end
function question4:DoClick()
	welcome:Remove()
	if HelpNPC.clicked1 == true then
	answer1:Remove()
	end
	if HelpNPC.clicked2 == true then
	answer2:Remove()
	end
	if HelpNPC.clicked3 == true then
	answer3:Remove()
	end
	if HelpNPC.clicked4 == true then
	answer4:Remove()
	end
	if HelpNPC.clicked5 == true then
	answer5:Remove()
	end
	if HelpNPC.clicked6 == true then
	answer6:Remove()
	end
HelpNPC.clicked4 = true;
answer4 = vgui.Create( "DLabel" , frame)
answer4:SetSize( 580, 120 )
answer4:SetPos(10,40)
answer4:SetWrap(true)
answer4:SetVisible(true)
answer4:SetFont("WelcomeMessage")
answer4:SetTextColor(HelpNPC.TextColor)
answer4:SetText(HelpNPC.Answer4)
end

//QUESTION 5
local question5 = vgui.Create( "DButton" , frame)
question5:SetPos(10, 350)
question5:SetSize( 580, 40 )
question5:SetFont("Questions")
question5:SetText(HelpNPC.Question5)
question5:SetTextColor(HelpNPC.TextColor)
question5.Paint = function(s, w, h)
	draw.RoundedBox(5,0,0,w,h,HelpNPC.SecondaryColor)
end
function question5:DoClick()
	welcome:Remove()
	if HelpNPC.clicked1 == true then
	answer1:Remove()
	end
	if HelpNPC.clicked2 == true then
	answer2:Remove()
	end
	if HelpNPC.clicked3 == true then
	answer3:Remove()
	end
	if HelpNPC.clicked4 == true then
	answer4:Remove()
	end
	if HelpNPC.clicked5 == true then
	answer5:Remove()
	end
	if HelpNPC.clicked6 == true then
	answer6:Remove()
	end
HelpNPC.clicked5 = true;
answer5 = vgui.Create( "DLabel" , frame)
answer5:SetSize( 580, 120 )
answer5:SetPos(10,40)
answer5:SetWrap(true)
answer5:SetVisible(true)
answer5:SetFont("WelcomeMessage")
answer5:SetTextColor(HelpNPC.TextColor)
answer5:SetText(HelpNPC.Answer5)
end

//QUESTION 6
local question6 = vgui.Create( "DButton" , frame)
question6:SetPos(10, 400)
question6:SetSize( 580, 40 )
question6:SetFont("Questions")
question6:SetText(HelpNPC.Question6)
question6:SetTextColor(HelpNPC.TextColor)
question6.Paint = function(s, w, h)
	draw.RoundedBox(5,0,0,w,h,HelpNPC.SecondaryColor)
end
function question6:DoClick()
	welcome:Remove()
	if HelpNPC.clicked1 == true then
	answer1:Remove()
	end
	if HelpNPC.clicked2 == true then
	answer2:Remove()
	end
	if HelpNPC.clicked3 == true then
	answer3:Remove()
	end
	if HelpNPC.clicked4 == true then
	answer4:Remove()
	end
	if HelpNPC.clicked5 == true then
	answer5:Remove()
	end
	if HelpNPC.clicked6 == true then
	answer6:Remove()
	end
HelpNPC.clicked6 = true;
answer6 = vgui.Create( "DLabel" , frame)
answer6:SetSize( 580, 120 )
answer6:SetPos(10,40)
answer6:SetWrap(true)
answer6:SetVisible(true)
answer6:SetFont("WelcomeMessage")
answer6:SetTextColor(HelpNPC.TextColor)
answer6:SetText(HelpNPC.Answer6)
end
end

hook.Add("PostDrawOpaqueRenderables", "npctext", function()
for k, v in pairs(ents.FindByClass("helpnpc_npc" )) do 

	if LocalPlayer():GetPos():Distance( v:GetPos() ) > 300 then continue end


		local direction = v:GetPos() - LocalPlayer():GetPos()
local x_d = direction.x
local y_d = direction.y
local Ang = Angle(0, math.deg(math.atan(y_d/x_d))+90/(x_d/-math.abs(x_d)), 90)

        cam.Start3D2D( v:GetPos() + Vector( 0, 0, 85 ),Ang, 0.1 )
                draw.DrawText(HelpNPC.Title, "AboveHead", 0, 0, HelpNPC.TextColor, TEXT_ALIGN_CENTER )
        cam.End3D2D()
end
end)

concommand.Add( "cl_helpnpc", NPCHelp )