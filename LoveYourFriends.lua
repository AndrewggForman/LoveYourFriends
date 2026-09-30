print("LoveYourFriends successfully loaded!")

-- creating a frame using blizzard's basic frame template, "BasicFrameTemplateWithInset"
    -- provides us with a 'backbone'. Includes:
        -- closing button
        -- title bar
        -- background
        -- border
    -- we can do it manually for a different aesthetic!

local mainFrame = CreateFrame("Frame", "LYFMainFrame", UIParent, "BasicFrameTemplateWithInset")

    -- some good practices: global functions e.g. blizzard's CreateFrame start with uppercase letter and
        -- are CamelCase, while our local functions are camelCase where we start with a lower case letter

    -- CreateFrame(type_of_frame, frame_name, parent_name, OPTIONAL:frame_template)
        -- types_of_frames: frame, button, scrollFrame, etc...
        -- name is self explanatory, helps with tracing stack calls/errors via /fstack
        -- Every frame must have a parent! Pass your parent's frame name 
            -- (in our case the parent is the game since this is our first frame)
        -- determines frame template, not needed, nice to start with; includes a close button!

-- adjusting the frame! Dealing with default size/position etc...
mainFrame:SetSize(500, 350) -- == mainFrame.SetSize(mainFrame, 500, 350)
    -- SetSize(x, y) where x->width, y->height and both are in pixels

-- setting the mainframe's position!
mainFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    --  SetPoint(starting_point_of_region, relative_to, relative_point, x_offset, y_offset)
        -- relative_to can also be thought of as, my_parent
        -- relative_point can be thought of as another region to anchor to
        -- x & y offsets are exactly what they seem to be

    -- reminder! setPoint is really taking: (frame, ..., but we implicitly pass frame via ':' syntax)

-- titling the frame!
    -- setting the height of our title's background to 30 units
mainFrame.TitleBg:SetHeight(30)
    -- TitleBg attribute was added to our mainframe via the template

    -- adding a title attribute to our mainframe 
    -- and defining it since the template does not come with one included in the frame!
mainFrame.title = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    -- CreateFontString(font_string_name, how_to_apply_to_parent, OPTIONAL: font_used)

mainFrame.title:SetPoint("TOPLEFT", mainFrame.TitleBg, "TOPLEFT" 5, -3)
mainFrame.title.SetText("LoveYourFriends!")
mainFrame.Hide()

-- Interactability, sound, etc...!
mainFrame:EnableMouse(true)
mainFrame:SetMovable(true)
mainFrame:RegisterForDrag("LeftButton")
mainFrame:SetScript("OnDragStart", function(self)
    self:StartMoving()
end)
mainFrame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
end)

mainFrame:SetScript("OnShow", function()
    PlaySound(808)
end)

mainFrame:SetScript( function()
    PlaySound(808)
end)