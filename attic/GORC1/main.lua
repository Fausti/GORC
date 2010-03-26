function load()
    -- alle Zeichen unserer Schriftarten in der Reihenfolge wie sie im Bild vorkommen,
    -- wichtig wenn wir unsere Schriften gleich laden wollen
    charset    = " !\"\'#$%&`´()[]*+,-./\\0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzüäÄÖöÜß"
    
    -- hier laden wir unsere beiden Schriftarten in zwei Variablen
    font_big   = love.graphics.newImageFont("big-robot-font.png", charset)
    font_small = love.graphics.newImageFont("small-robot-font.png", charset)
    
    love.graphics.setFont(font_small)
    love.graphics.setBackgroundColor(255, 255, 255)

    -- hier laden wir unsere Bilder in ein Array und setzen ihr Zentrum in die linke obere Ecke
    bild = {}
    bild[1] = love.graphics.newImage("images/wall-0.png")
    bild[1]:setCenter(0, 0)
    bild[2] = love.graphics.newImage("images/wall-1.png")
    bild[2]:setCenter(0, 0)
    bild[3] = love.graphics.newImage("images/wall-2.png")
    bild[3]:setCenter(0, 0)
    bild[4] = love.graphics.newImage("images/wall-3.png")
    bild[4]:setCenter(0, 0)
    bild[5] = love.graphics.newImage("images/wall-4.png")
    bild[5]:setCenter(0, 0)
    bild[6] = love.graphics.newImage("images/isolator-0.png")
    bild[6]:setCenter(0, 0)
    bild[7] = love.graphics.newImage("images/sack-0.png")
    bild[7]:setCenter(0, 0)
    bild[8] = love.graphics.newImage("images/bank-0.png")
    bild[8]:setCenter(0, 0)
    bild[9] = love.graphics.newImage("images/gold-0.png")
    bild[9]:setCenter(0, 0)
    bild[10] = love.graphics.newImage("images/ezaun-0.png")
    bild[10]:setCenter(0, 0)
    bild[11] = love.graphics.newImage("images/falle-0.png")
    bild[11]:setCenter(0, 0)
    bild[12] = love.graphics.newImage("images/arrow-0.png")
    bild[12]:setCenter(0, 0)
    bild[13] = love.graphics.newImage("images/arrow-1.png")
    bild[13]:setCenter(0, 0)
    bild[14] = love.graphics.newImage("images/arrow-2.png")
    bild[14]:setCenter(0, 0)

    -- und hier das selbe noch einmal, nur diesmal laden wir alle animierten Bilder, da ich diese
    -- getrennt von den Einzelbildern behandle
    ani = {}
    ani[0] = love.graphics.newAnimation(love.graphics.newImage("images/charlie-0.png"), 16, 12, 0.2, 0)
    ani[0]:setCenter(8, 6)
    ani[1] = love.graphics.newAnimation(love.graphics.newImage("images/robot-0.png"), 16, 12, 0.2, 0)
    ani[1]:setCenter(8, 6)
    ani[2] = love.graphics.newAnimation(love.graphics.newImage("images/robot-1.png"), 16, 12, 0.2, 0)
    ani[2]:setCenter(8, 6)
    ani[3] = love.graphics.newAnimation(love.graphics.newImage("images/robot-2.png"), 16, 12, 0.2, 0)
    ani[3]:setCenter(8, 6)
    ani[4] = love.graphics.newAnimation(love.graphics.newImage("images/robot-3.png"), 16, 12, 0.2, 0)
    ani[4]:setCenter(8, 6)
    ani[5] = love.graphics.newAnimation(love.graphics.newImage("images/robot-4.png"), 16, 12, 0.2, 0)
    ani[5]:setCenter(8, 6)
    ani[6] = love.graphics.newAnimation(love.graphics.newImage("images/robot-5.png"), 16, 12, 0.2, 0)
    ani[6]:setCenter(8, 6)
    ani[7] = love.graphics.newAnimation(love.graphics.newImage("images/robot-6.png"), 16, 12, 0.2, 0)
    ani[7]:setCenter(8, 6)
    ani[8] = love.graphics.newAnimation(love.graphics.newImage("images/explo-0.png"), 16, 12, 0.2, 0)
    ani[8]:setCenter(8, 6)

    explosion_pic = love.graphics.newImage("images/explo-0.png")
    explosion = {}

    spieler = {}
    spieler.ani = love.graphics.newAnimation(love.graphics.newImage("images/charlie-0.png"), 16, 12, 0.2, 0)
    spieler.ani:setCenter(8, 6)

    robot_pics = {
        love.graphics.newImage("images/robot-0.png"),
        love.graphics.newImage("images/robot-1.png"),
        love.graphics.newImage("images/robot-2.png"),
        love.graphics.newImage("images/robot-3.png"),
        love.graphics.newImage("images/robot-4.png"),
        love.graphics.newImage("images/robot-5.png"),
        love.graphics.newImage("images/robot-6.png")
    }
    -- ein Array mit den Karten unserer Level, das Intro ist dabei Szene 0
    szene = {}

    -- Intro, deshalb eine Zeile mehr als in den anderen Szenen
    szene[0] = {
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,4,1,3,0,0,1,0,0,0,0,4,1,3,0,0,1,0,1,0,0,1,1,1,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,1,0,1,0,0,1,0,0,0,0,1,0,1,0,0,1,0,1,0,0,1,0,0,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,1,0,0,0,0,1,0,0,0,0,1,0,1,0,0,1,3,1,0,0,1,1,0,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,1,0,0,0,0,1,0,0,0,0,1,0,1,0,0,1,2,1,0,0,1,0,0,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,1,0,1,0,0,1,0,0,0,0,1,0,1,0,0,1,0,1,0,0,1,0,0,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,2,1,5,0,0,1,1,1,0,0,2,1,5,0,0,1,0,1,0,0,1,1,1,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,4,1,3,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,2,1,5,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,1,1,3,0,0,4,1,3,0,0,1,1,3,0,0,4,1,3,0,0,1,1,1,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,1,0,1,0,0,1,0,1,0,0,1,0,1,0,0,1,0,1,0,0,0,1,0,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,1,1,5,0,0,1,0,1,0,0,1,4,5,0,0,1,0,1,0,0,0,1,0,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,1,2,3,0,0,1,0,1,0,0,1,2,3,0,0,1,0,1,0,0,0,1,0,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,1,0,1,0,0,1,0,1,0,0,1,0,1,0,0,1,0,1,0,0,0,1,0,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,0,1,0,1,0,0,2,1,5,0,0,1,1,5,0,0,2,1,5,0,0,0,1,0,0,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0}
    }

    -- Startszene mit den Banken
    szene[1] = {
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,4,1,1,1,1,1,1,1,1,1,1,1,1,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,1,0,4,1,1,3,0,0,0,4,1,1,3,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,1,0,1,8,0,1,0,0,0,1,0,8,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,1,0,1,1,0,0,0,0,0,0,0,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,1,0,1,8,0,1,0,0,0,1,0,8,1,0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,1,0,2,1,1,5,0,0,0,2,1,1,5,0,1,1,3,0,0,6,0,6,0,0,6,0,6,0,0,6,0,6,0,0,0,1},
        {1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,6,0,0,0,0,6,0,0,0,0,6,0,0,0,0,12},
        {1,0,0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,2,1,5,0,0,6,0,6,0,0,6,0,6,0,0,6,0,6,0,0,0,12},
        {1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12},
        {1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12},
        {1,0,0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,4,1,3,0,0,6,0,6,0,0,6,0,6,0,0,6,0,6,0,0,0,12},
        {1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,6,0,0,0,0,6,0,0,0,0,6,0,0,0,0,12},
        {1,0,0,0,1,0,4,1,1,3,0,0,0,4,1,1,3,0,1,1,5,0,0,6,0,6,0,0,6,0,6,0,0,6,0,6,0,0,0,1},
        {1,0,0,0,1,0,1,8,0,1,0,0,0,1,0,8,1,0,1,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,1,0,1,1,0,0,0,0,0,0,0,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,1,0,1,8,0,1,0,0,0,1,0,8,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,1,0,2,1,1,5,0,0,0,2,1,1,5,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,2,1,1,1,1,1,1,1,1,1,1,1,1,1,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
    }

    szene[2] = {
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
    }

    -- Goldlagerszene
    szene[3] = {
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,1,1,0,1,1,0,0,0,1,1,0,1,1,0,0,6,0,0,0,1,1,0,1,1,0,0,0,1,1,0,1,1,0,0,0,1},
        {1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,6,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1},
        {1,0,0,0,0,0,6,0,0,0,0,0,0,0,6,0,0,0,0,6,0,0,0,0,0,6,0,0,0,0,0,0,0,6,0,0,0,0,0,1},
        {1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,6,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1},
        {1,0,0,0,1,1,0,1,1,0,0,0,1,1,0,1,1,0,0,6,0,0,0,1,1,0,1,1,0,0,0,1,1,0,1,1,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {12,0,0,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,0,0,0,1},
        {12,0,0,0,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,6,0,0,0,1},
        {12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,1,1,0,1,1,0,0,0,1,1,0,1,1,0,0,0,6,0,0,1,1,0,1,1,0,0,0,1,1,0,1,1,0,0,0,1},
        {1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,6,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1},
        {1,0,0,0,0,0,6,0,0,0,0,0,0,0,6,0,0,0,0,0,6,0,0,0,0,6,0,0,0,0,0,0,0,6,0,0,0,0,0,1},
        {1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,6,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1},
        {1,0,0,0,1,1,0,1,1,0,0,0,1,1,0,1,1,0,0,0,6,0,0,1,1,0,1,1,0,0,0,1,1,0,1,1,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
    }
    
    -- Szene 99 ist hier einfach mal eine Musterszene für unsere Zufallsszene 2
    szene[99] = {
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12},
        {12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12},
        {12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12},
        {12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12},
        {12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12},
        {12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
    }

    -- Zufallsszene
    empty_szene(2)

    musik = {}
    musik[1] = love.audio.newMusic("music/musik-0.xm")
    
--    love.audio.play(musik[1], 0)
    
    sounds = {}
    sounds[1] = love.audio.newSound("sounds/charlie-schritt.wav")
    sounds[2] = love.audio.newSound("sounds/explosion.wav")
    sounds[3] = love.audio.newSound("sounds/gold.wav")
    
    status = 0
    
    robot = {}
    death_robot = {}

    -- aktuelle Szene auf unser Intro stellen
    szenen_wechsel(0, 0)
    
    last_update = 0
    
end

function empty_szene(sz)
    for j = 1, 28 do
        for i = 1, 40 do
            szene[sz][j][i] = szene[99][j][i]
        end
    end
end

function explosion_add(fx, fy)
        table.insert(explosion, {})
        explosion[#explosion].ani = love.graphics.newAnimation(explosion_pic, 16, 12, 1, 0)
        explosion[#explosion].ani:setCenter(8, 6)
        explosion[#explosion].ani:setMode(love.mode_once)
        explosion[#explosion].x = fx
        explosion[#explosion].y = fy
        
        love.audio.play(sounds[2], 1)
end

function szenen_wechsel(from, to)
    if from == 0 then
        leben = 3
        punkte = 0
        gold = 0
        spieler.x = 12
        spieler.y = 9
        last_update = 0
    end
    
    if to == 0 then
        status = 0
		love.audio.play(musik[1], 0)
		
    elseif to == 2 then
        empty_szene(2)

        -- Gold
        for i = 1, 10 do
            repeat
                nx = math.random(2, 39)
                ny = math.random(2, 27)
            until szene[2][ny][nx] == 0
            szene[2][ny][nx] = 9
        end
        
        -- Isolatoren
        for i = 1, 75 do
            repeat
                nx = math.random(2, 39)
                ny = math.random(2, 27)
            until szene[2][ny][nx] == 0
            szene[2][ny][nx] = 6
        end
        
        -- Elektrozäune
        for i = 1, 10 do
            repeat
                nx = math.random(2, 39)
                ny = math.random(2, 27)
            until szene[2][ny][nx] == 0
            szene[2][ny][nx] = 10
        end
        
        status = 1
        robot = {}
        death_robot = {}

        for i = 1, math.random(10) do
            repeat
                nx = math.random(2, 39)
                ny = math.random(2, 27)
            until szene[2][ny][nx] == 0
            
            table.insert(robot, {})
            robot[#robot].ani = love.graphics.newAnimation(robot_pics[math.random(1, 7)], 16, 12, 0.2, 0)
            robot[#robot].ani:setCenter(8, 6)
            -- damit unsere Roboter nicht alle gleich aussehen, bestimmen wir das Startbild der Animation per Zufall
            robot[#robot].ani:seek(math.random(2) - 1)
            robot[#robot].x = nx
            robot[#robot].y = ny
            robot[#robot].last_update = 0
			robot[#robot].not_moving = 0
        end
        
        explosion = {}
		
		love.audio.stop()
    elseif to == 3 then
        robot = {}
        
        -- Gold
        for i = 1, 25 do
            repeat
                nx = math.random(2, 39)
                ny = math.random(2, 27)
            until szene[3][ny][nx] == 0
            szene[3][ny][nx] = 9
        end
		love.audio.stop()
    else
        status = 1
        robot = {}
        explosion = {}
		love.audio.stop()
    end

    last_update = 0
    if spieler.x == 1 then
        spieler.x = 39
    elseif spieler.x == 40 then
        spieler.x = 2
    end
    
    if spieler.y == 1 then
        spieler.y = 27
    elseif spieler.y == 28 then
        spieler.y = 2
    end
    
    akt_szene = to
end

function draw()
    if status == 0 then
        for j = 1, 29, 1 do
            for i = 1, 40, 1 do
                feld = szene[0][j][i]
                if bild[feld] ~= nil then
                    love.graphics.draw(bild[feld], (i - 1) * 16, (j - 1) * 12)
                end
            end
        end
        
        love.graphics.drawf("Start mit <ENTER>", 0, 336, 640, love.align_right)
    elseif status == 1 then
        for i = 1, 8 do
            love.graphics.draw(bild[6], (i - 1) * 16, 0)
            love.graphics.draw(bild[6], (32 + i - 1) * 16, 0)
        end

        love.graphics.draw(bild[9], 26 * 16, 0)

        str_punkte = string.format("%i", punkte)
        while string.len(str_punkte) < 7 do
            str_punkte = "0" .. str_punkte
        end
        
        love.graphics.draw(string.format("Punkte %s Leben %i     %i", str_punkte, leben, gold), (12 * 16) + 8, 0)
        
        for j = 1, 28, 1 do
            for i = 1, 40, 1 do
                feld = szene[akt_szene][j][i]
                if bild[feld] ~= nil then
                    if (feld == 12 or feld == 13) and #robot > 0 then
                        love.graphics.draw(bild[14], (i - 1) * 16, j * 12)
                    else
                        love.graphics.draw(bild[feld], (i - 1) * 16, j * 12)
                    end
                end
            end
        end
        
        -- unseren Charlie zeichnen
        love.graphics.draw(spieler.ani, (spieler.x - 1) * 16, spieler.y * 12)
        
        -- etwaige Roboter zeichnen
        for i, r in ipairs(robot) do
            love.graphics.draw(robot[i].ani, (robot[i].x - 1) * 16, robot[i].y * 12)
        end
        
        -- etwaige Explosionen zeichnen
        for i, r in ipairs(explosion) do
            love.graphics.draw(explosion[i].ani, (explosion[i].x - 1) * 16, explosion[i].y * 12)
        end
    end

    -- love.graphics.draw(ani[8], 0, 0)
    
    local fps = love.timer.getFPS()
    love.graphics.draw("FPS: " .. fps, 0, 0)
end

function is_robot_on(fx, fy)
    for i, r in ipairs(robot) do
        if robot[i].x == fx and robot[i].y == fy then return true end
    end
    
    return false
end

function which_robot_on(fx, fy)
    for i, r in ipairs(robot) do
        if robot[i].x == fx and robot[i].y == fy then return i end
    end

    return false
end

function update(dt)
    if status == 0 then
    
    elseif status == 1 then
        if love.keyboard.isDown(love.key_left) and last_update > .1 then
            if can_move_to(spieler.x - 1, spieler.y) then
                spieler.x = spieler.x - 1
                last_update = 0
                love.audio.play(sounds[1], 1)
            end
        elseif love.keyboard.isDown(love.key_right) and last_update > .1 then
            if can_move_to(spieler.x + 1, spieler.y) then
                spieler.x = spieler.x + 1
                last_update = 0
                love.audio.play(sounds[1], 1)
            end
        elseif love.keyboard.isDown(love.key_up) and last_update > .1 then
            if can_move_to(spieler.x, spieler.y - 1) then
                spieler.y = spieler.y - 1
                last_update = 0
                love.audio.play(sounds[1], 1)
            end
        elseif love.keyboard.isDown(love.key_down) and last_update > .1 then
            if can_move_to(spieler.x, spieler.y + 1) then
                spieler.y = spieler.y + 1
                last_update = 0
                love.audio.play(sounds[1], 1)
            end
        end
    last_update = last_update + dt
    end

    -- Animationen von Charlie, den Robotern und den Explosionen aktualisieren
    death_robot = {}
    
    for i, r in ipairs(robot) do
        robot[i].ani:update(dt)

        if robot[i].last_update > .75 then
            local d = math.random(-1, 1)
            local rnx, rny, rdir
            
            if robot[i].x > spieler.x then
                rnx = -1
            elseif robot[i].x < spieler.x then
                rnx = 1
            else
                rnx = 0
            end
            
            if robot[i].y > spieler.y then
                rny = -1
            elseif robot[i].y < spieler.y then
                rny = 1
            else
                rny = 0
            end

            local can_move = false
            local feld = szene[akt_szene][robot[i].y + rny][robot[i].x + rnx]
            
            if  feld == 0 or feld == 10 then
                if not is_robot_on(robot[i].x + rnx, robot[i].y + rny) then can_move = true end
            else
                can_move = false
            end
            
            if not can_move then
                rnx = math.random(-1, 1)
                rny = math.random(-1, 1)

                feld = szene[akt_szene][robot[i].y + rny][robot[i].x + rnx]
                
                if feld == 0 or feld == 10 then
                    if not is_robot_on(robot[i].x + rnx, robot[i].y + rny) then 
						can_move = true
					else
						-- wenn der Roboter auf dem Zielfeld NICHT wir selber sind
						if which_robot_on(robot[i].x + rnx, robot[i].y + rny) ~= i then
							can_move = false
							table.insert(death_robot, i)
                    		explosion_add(robot[i].x, robot[i].y)
                    		szene[akt_szene][robot[i].y][robot[i].x] = 0
						end
					end
                end
            end
            
            if can_move then
                robot[i].x = robot[i].x + rnx
                robot[i].y = robot[i].y + rny
				robot[i].not_moving = 0
				
				if spieler.x == robot[i].x and spieler.y == robot[i].y then
					-- hat Charlie all seine Leben verbraten?
        			if leben == 0 then
            			-- ab zurück ins Intro und better luck next time ;)
						love.audio.play(musik[1], 0)
            			status = 0
            			return false
        			end

        			-- ein Leben abziehen
        			leben = leben - 1
        
        			-- an der Position vom Elektrozaun eine Explosionsanimation starten
        			explosion_add(spieler.x, spieler.y)

        			-- Charlie wieder auf sein Szenenstartfeld beamen
        			spieler.x = 2
        			spieler.y = 2

        			-- damit sich Charlie nicht gleich nach dem Erscheinen fortbewegt
        			last_update = -0.5				
				end
				
                if feld == 10 then
                    table.insert(death_robot, i)
                    explosion_add(robot[i].x, robot[i].y)
                    szene[akt_szene][robot[i].y][robot[i].x] = 0
                end
			else
					robot[i].not_moving = robot[i].not_moving + 1
					
					if robot[i].not_moving > 10 then
			        	table.insert(death_robot, i)
                    	explosion_add(robot[i].x, robot[i].y)
                    	szene[akt_szene][robot[i].y][robot[i].x] = 0
					end
            end
            
            robot[i].last_update = 0
        else
            robot[i].last_update = robot[i].last_update + dt
        end
    end
    
    for i, r in ipairs(death_robot) do
        table.remove(robot, r)
    end
    
    for i, r in ipairs(explosion) do
        explosion[i].ani:update(dt)
    end
    
    spieler.ani:update(dt)
    
    -- 10 Millisekunden Pause einlegen
    love.timer.sleep(10)
end

function keyreleased(key)
    if status == 0 then
        if key == love.key_escape then
            love.system.exit()
        elseif key == love.key_return or key == love.key_space then
            szenen_wechsel(0, 1)
        end
    elseif status == 1 then
        if key == love.key_escape then
            status = 0
        end
    end
end

-- Kann sich unser Spieler auf das Feld (fy, fx) bewegen?
function can_move_to(fx, fy)
    local feld = szene[akt_szene][fy][fx]

    -- Bewegungen ausserhalb des Spielfeldes verursachen einen Szenenwechsel
    if fy < 1 then
        -- nach oben
        return false
    elseif fy > 28 then
        -- nach unten
        return false
    elseif fx < 1 then
        -- nach links
        szenen_wechsel(akt_szene, akt_szene - 1)
        return false
    elseif fx > 40 then
        -- nach rechts
        szenen_wechsel(akt_szene, akt_szene + 1)
        return false
    end
    
    -- Feld ist leer
    if feld == 0 then
		-- Befindet sich auf dem Zielfeld ein Roboter?
		if is_robot_on(fx, fy) then
			-- hat Charlie all seine Leben verbraten?
        	if leben == 0 then
            	-- ab zurück ins Intro und better luck next time ;)
				love.audio.play(musik[1], 0)
            	status = 0
            	return false
        	end

        	-- ein Leben abziehen
        	leben = leben - 1
        
        	-- an der Position vom Elektrozaun eine Explosionsanimation starten
        	explosion_add(fx, fy)

        	-- Charlie wieder auf sein Szenenstartfeld beamen
        	spieler.x = 2
        	spieler.y = 2

        	-- damit sich Charlie nicht gleich nach dem Erscheinen fortbewegt
        	last_update = -0.5
        
	        return false	
		end
		
        return true
    -- auf dem Feld sind Szenenwechselpfeile
    elseif feld == 12 or feld == 13 then
        if #robot < 1 then return true else return false end
        return true
    -- es befindet sich ein Elektrozaun auf dem Feld
    elseif feld == 10 then
        -- den Elektrozaun entfernen
        szene[akt_szene][fy][fx] = 0
        
        -- hat Charlie all seine Leben verbraten?
        if leben == 0 then
            -- ab zurück ins Intro und better luck next time ;)
			love.audio.play(musik[1], 0)
            status = 0
            return false
        end

        -- ein Leben abziehen
        leben = leben - 1
        
        -- an der Position vom Elektrozaun eine Explosionsanimation starten
        explosion_add(fx, fy)

        -- Charlie wieder auf sein Szenenstartfeld beamen
        spieler.x = 2
        spieler.y = 2

        -- damit sich Charlie nicht gleich nach dem Erscheinen fortbewegt
        last_update = -0.5
        
        return false

    -- es befindet sich Gold auf dem Feld
    elseif feld == 8 then
        punkte = punkte + (gold * 100)
        gold = 0
        return true
    elseif feld == 9 then
        szene[akt_szene][fy][fx] = 0
        gold = gold + 1
        love.audio.play(sounds[3])
        return true
    -- es befindet sich ein Isolator auf dem Feld
    elseif feld == 6 then
        -- kann der Isolator verschoben werden?
        if can_move_isolator(fx, fy, fx - spieler.x, fy - spieler.y) then
            return true
        else
            return false
        end
    -- es befindet sich irgendetwas anderes auf dem Feld
    else
        return false
    end

    return false
end

-- Kann der Isolator auf Feld (fy, fx) auf das Feld (fy + dy, fx + dx) verschoben werden?
-- Diese Funktion hier ist rekursiv und prüft und verschiebt auch gegebenenfalls alle folgenden Isolatoren und Elektrozäune.
function can_move_isolator(fx, fy, dx, dy)
    local feld = szene[akt_szene][fy + dy][fx + dx]

    -- Nachbarfeld ist leer
    if feld == 0 then
        -- falls sich ein Robot auf dem freien Feld befindet, ist das Feld doch nicht SO frei
        if is_robot_on(fx + dx, fy + dy) then
            if szene[akt_szene][fy][fx] == 10 then
                -- dann schieben wir mal den Elektrozaun auf das arme Roboterchen :(
                explosion_add(fx + dx, fy + dy)
                szene[akt_szene][fy + dy][fx + dx] = 0
                szene[akt_szene][fy][fx] = 0
                table.remove(robot, which_robot_on(fx + dx, fy + dy))
                return true
            else
                -- einen Isolator auf einen Roboter schieben geht nicht!
                return false
            end
        end
        
        szene[akt_szene][fy + dy][fx + dx] = szene[akt_szene][fy][fx]
        szene[akt_szene][fy][fx] = 0
        return true
    -- Nachbarfeld ist entweder ein Isolator oder ein Elektrozaun
    elseif feld == 6 or feld == 10 then
        -- kann der Iso/Ezaun des Nachbarfeldes verschoben werden?
        if can_move_isolator(fx + dx, fy + dy, dx, dy) then
            szene[akt_szene][fy + dy][fx + dx] = szene[akt_szene][fy][fx]
            szene[akt_szene][fy][fx] = 0
            return true
        else
            return false
        end
    -- Nachbarfeld ist mit irgendwas anderem belegt
    elseif is_robot_on(fx + dx, fy + dy) then
        return false
    else
        return false
    end
end
