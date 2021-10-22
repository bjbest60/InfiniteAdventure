program infinite;

uses crt, sysutils;

type
        stringList = array of string;
        things = (apple,ball,book,bagel,carrot,coin,daisy,daffodil,eggplant,game,gem,ingot,kite,movie,necklace,raincoat,ring,rose,umbrella,violet,pedestal,chest,idol,box,wizard,elf,thief,goblin,zombie,vampire,faerie,orc);

const
        // ask, tell, say, show, push, pull
        commandList : array[1..19] of string =('get','take','talk','put','drop','x','examine','i','inventory','l','look','n','north','s','south','e','east','w','west');
        probability : single = 0.99;
        covered1 : array[1..3] of string =('The floor is','The corners are','The furniture is');
        covered2 : array[1..3] of string =('covered with','coated with','shrouded in');
        covered3 : array[1..4] of string =('cobwebs','dust','shadows','dead moths');
        temperature1 : array[1..10] of string =('chilly','cold','warm','drafty','dim','spooky','shadowy','creepy','oddly mysterious','long abandoned');
        painted1 : array[1..11] of string =('red','white','beige','off-white','cream','light gray','gray','light blue','yellow','light green','brown');
        window1 : array[1..9] of string =(' dead bird',' crow','n abandoned garden','n iron-wrought fence','n old vineyard',' light in the distance','n overgrown hedge',' lawn of weeds',' carriage house');
        feeling1 : array[1..8] of string =('on edge','anxious','uncertain','creeped out','like you''re trespassing','like you shouldn''t be here','suspicious','like you''re being followed');
        someone1 : array[1..8] of string =('overturned a table','scribbled on the wall','swept broken glass into a corner','broken a flowerpot','slashed the wallpaper','gouged the door frame','left muddy footprints','defaced a painting');
        listen1 : array[1..7] of string =('a door creaking open','glass breaking','chains rattling','a muffled scream','a clock chiming','a window slamming shut','a ghostly wail');
        thinglist : array[1..20] of string =('apple','ball','book','bagel', 'carrot', 'coin','daisy','daffodil','eggplant','game','gem','ingot','kite','movie','necklace','raincoat','ring','rose','umbrella','violet');
        wearlist : array[1..3] of string =('raincoat','necklace','ring');
        thinglist2 : array [1..24] of string =('pedestal','chest','idol','box','apple','ball','book','bagel', 'carrot', 'coin','daisy','daffodil','eggplant','game','gem','ingot','kite','movie','necklace','raincoat','ring','rose','umbrella','violet');
        funlist : array [1..5] of string =('book', 'game', 'movie', 'ball', 'kite');
        eatlist : array [1..4] of string =('apple', 'bagel', 'eggplant', 'carrot');
        flowerlist : array [1..4] of string =('daisy', 'daffodil', 'rose', 'violet');
        valuelist : array [1..5] of string =('coin', 'gem', 'ingot', 'necklace', 'ring');
        rainlist : array[1..2] of string =('raincoat','umbrella');
        scenerylist : array[1..24] of string =('cobwebs','floor','furniture','dust','bird','crow','garden','fence','vineyard','light','hedge','lawn','weeds','carriage','house','walls','wall','room','paint','window','moths','moth','wail','corners');
        scenerylist2 : array[1..21] of string =('mud','shadows','table','scribble','writing','graffiti','glass','broken','flowerpot','pot','wallpaper','paper','frame','door','doorframe','footprints','prints','painting','chains','scream','clock');
        apple1 : array[0..2] of string =('red','yellow','green');
        apple2 : array[0..1] of string =('juicy.','sweet.');
        ball1 : array[0..3] of string =('Blue','Purple','Striped','Pink');
        book1 : array[0..2] of string =('novel','comic book','story');
        book2 : array[0..4] of string =('boy','girl','dog','superhero','detective');
        book3 : array[0..4] of string =('witch.','wizard.','tiger.','goblin.','ghost.');
        bagel1 : array[0..4] of string =('raisins in it.','chocolate chips in it.','sesame seeds on it.','poppy seeds on it.','sort sort of cheese on top.');
        coin1: array[0..2] of string =('runes','words','letters');
        coin2: array[0..3] of string =('5','20','100','500');
        coin3: array[0..2] of string =('gold.','copper.','silver.');
        daffodil1 : array[0..2] of string =('a strong stem.','vibrant leaves.','a pleasing fragrance.');
        eggplant1 : array[0..3] of string =('Light','Dark','An even','A pleasing');
        eggplant2 : array[0..2] of string =('possibly underripe.','ready to cook.','overripe, perhaps.');
        game1 : array[0..3] of string =('A chess set.','A box with dice, some tokens, and no instructions.','A box with checkers and their board.','A backgammon set in a fancy leather case.');
        gem1 : array[0..3] of string =(' handsomely',' carefully','n elegantly','n exquisitely');
        gem2 : array[0..1] of string =('cut','crafted');
        gem3 : array[0..3] of string =('ruby','sapphire','diamond','emerald');
        ingot1 : array[0..2] of string =('silver!','gold!','platinum!');
        kite1 : array[0..2] of string =('blue','purple','green');
        kite2 : array[0..2] of string =('red','yellow','orange');
        movie1 : array[0..4] of string =('Psycho.','A Nightmare on Elm Street.','North by Northwest.','Halloween.','Friday the Thirteenth.');
        necklace1 : array[0..4] of string =('An opal pendant','A polished silver heart','A pink cameo','A blue crystal','A trio of pearls');
        necklace2 : array[0..1] of string =('silver strand.','gold chain.');
        raincoat1 : array[0..2] of string =('Yellow','Navy blue','Gray');
        raincoat2 : array[0..3] of string =('buckles at the sleeves.','a fleece lining.','a sturdy-looking zipper.','a white stripe around the middle.');
        ring1 : array[0..4] of string =('A brilliant diamond','An elegant sapphire','Some topaz','Some amethyst','A ruby');
        ring2 : array[0..2] of string =('platinum','gold','silver');
        rose1 : array[0..3] of string =('A delicate','A hearty','A striking','A perfect');
        rose2 : array[0..3] of string =('pointed thorns.','a dark green stem.','two supple leaves.','a faint perfume.');
        umbrella1 : array[0..2] of string =('A black umbrella with a curved wooden handle.','A dark blue umbrella. Inset in its plastic handle is a button to open it.','A child''s umbrella, yellow, festooned with fire trucks.');
        violet1 : array[0..2] of string =('Small','Tiny','Delicate');
        violet2 : array[0..3] of string =('light purple.','dark purple.','blue with purple swells at the ends of the petals.','white with purple streaks.');
        personlist : array[0..7] of string =('wizard','elf','thief','goblin','zombie','vampire','faerie','orc');
        placelist : array[0..3] of string =('pedestal','chest','idol','box');
        placeAdjectives : array[0..2] of string =('enchanted','mysterious','magical');
        pedestal1 : array[0..3] of string =(' marble',' granite','n alabaster','n etched steel');
        pedestal2 : array[0..2] of string =('gold','steel','brass');
        chest1 : array[0..2] of string =('that stinks of decay','splintering apart','swollen with water');
        box1 : array[0..2] of string =('n odd',' weird',' strange');
        box2 : array[0..1] of string =(' mysterious','n unknown');
        box3 : array[0..4] of string =('titanium','palladium','rhodium','zinc','manganese');
        idol1 : array[0..4] of string =('golden','silver','steel','copper','terra cotta');
        gameOptions : array[0..1] of string =('place','person');
        personAdjectives : array[0..6] of string =('An old ','An attractive ','A well-dressed ','A mysterious ','A slovenly ','A short ','A thin ');
        personTitles : array[0..6] of string =('old','attractive','well-dressed','mysterious','slovenly','short','thin');
        pronouns : array[0..1] of string =('She','He');
        exitsPrepend : array[0..7] of string =('You can go ','Exits are ','Doors lead ','Exits: ','Rooms are ','You can see ','Exits lead ','Obvious exits: ');
        intro1 : array[0..3] of string =('Your parents told you not to go into','Your friends dared you to enter','You''ve had nightmares about','You''ve always driven by');
        intro2 : array[0..4] of string =('creepy','spooky','scary','abandoned','dilapidated');
        intro3 : array[0..2] of string =('mansion','house','hotel');
        intro4 : array[0..3] of string =('face your fears','open its front door','see its horrors for yourself','investigate its evil');
        funAdj : array[0..2] of string =('PLAYFUL','FUN-LOVING','BORED');
        eatAdj : array[0..2] of string =('HUNGRY','ILL-FED','GLUTTONOUS');
        valueAdj : array[0..2] of string =('GREEDY','AVARICIOUS','RICHEST');
        rainAdj : array[0..2] of string =('VERY DRY','CAUTIOUS','HYRDROPHOBIC');
        flowerAdj: array[0..2] of string =('HORTICULTURAL','GARDENING','FLORAL');
        place1 : array[0..3] of string =('ENCHANTMENT','WONDER','MYSTERY','MAGIC');
        place2 : array[0..4] of string =('ENCHANTED','MAGICAL','FANTASTIC','AMAZING','MYSTERIOUS');
        scenery1 : array[0..4] of string =('somewhat odd','a little weird','creepy','a bit spooky','inexplicably mysterious');
        scenery2 : array[0..3] of string =('unimportant','uninteresting overall','inconsequential','otherwise fairly unremarkable');
        smell1 : array[0..3] of string =('quite fragrant','like cheap perfume','like a summer day','heavenly');
        conversation3a : array[0..7] of string =('the best flavors of ice cream','the Kansas City Royals','sewing','baking pies','fashion magazines','zeppelins','other spooky houses','extraterrestrial life');
        conversation3b : array[0..9] of string =('mini-golf','death metal','workplace safety','alpacas','boomerangs','Journey''s discography','photographing trees','gas stations','abstract art','the Magna Carta');
        talkverb1 : array[0..2] of string =('spend some time talking about','chat for a few minutes about','discuss');
        conversation4a : array[0..6] of string = ('invertebrate zoology','the War of 1812','how to write an essay','the best place to buy galoshes','Jupiter','applesauce','the life cycle of brine shrimp');
        conversation4b : array[0..6] of string = ('how to pick up a 7-10 split','whatever the mayor''s upset about this week','saxophones','refrigerator repair','algebra in the real world','the Theory of Relativity','volcanoes');
        talkverb2 : array[0..2] of string =('have a thoughtful discussion about','converse about','share your opinions about');
        placewin1 : array[0..2] of string =('The walls start to shake.','The room begins to fill with light.','You hear a deep, ringing chord.');
        placewin2 : array[0..2] of string =('blue sky','bluebirds','green grass');
        placewin3 : array[0..2] of string =('haunted','spooky','cursed');
        placelose1 : array[0..2] of string =('demonic','sinister','terrifying');
        placelose2 : array[0..2] of string =('screams','wails','booms');
        placelose3 : array[0..2] of string =('explode','implode','collapse');
        fileName : string = 'INFINITE.SAV';
        otherslist : array[0..13] of string =('WARRIOR','BRIAN','GARDON','ELISE','WITCH','RILEY','OTHERS','PEOPLE','DOCTOR','COMPUDOCTOR','DOC','COMPUDOC','STRIPPER','ASHLEY');


 var
        rawCommand : string;
        tempIndex : integer;
        words : integer;
        word1 : string;
        word2 : string;
        word3 : string;
        word4 : string;
        i,j,x,y : integer;
        map : array[1..7,1..7] of integer;
        rooms : array[1..7,1..7] of string;
        roomDescription : array[1..7,1..7] of string;
        thingsInRooms : array[1..7,1..7] of string;
        playerInventory : array[1..5] of string;
        victory : string;
        victoryItem : string;
        exitIndex : integer;
        exitMax : integer;
        response : string;
        tempProbability : single;
        tempRandom : single;
        tempRandomInt : integer;
        tempDirection : integer;
        roomList : stringList;
        covered : string;
        temperature : string;
        painted : string;
        window : string;
        feeling : string;
        someone : string;
        listen : string;
        exam : array[apple..orc] of string;
        tempThing : things;
        numberOfRooms : integer;
        numberOfThings : integer;
        thingsToPlace : stringList;
        thingok : boolean;
        newObject : string;
        gameType : string;
        person : string;
        personok : boolean;
        place : string;
        placeok : boolean;
        placeAdjective : string;
        pronoun : string;
        pronounLower : string;
        possessivePronoun : string;
        personAdjective : string;
        personTitle : string;
        playerX : integer;
        playerY : integer;
        exits : string;
        thingText : string;
        firstLetter : string;
        article : string;
        roomText : string;
        description : string;
        talkCycle : integer;
        hasTalked : integer;
        hasExamined : integer;
        games : integer;
        intro : string;
        title : string;
        tempString : string;
        infiniteAdventure : string;
        keyPress : char;
        statusRight : string;
        gameResult : string;
        lastCommand : string;
        wins : integer;
        losses : integer;
        response2 : string;
        fileOut : textfile;
        flavorText : boolean;

label another, parseLoop, start;


function ArrayContains(const arr: array of string; const value: string): Boolean;
var
        i: Integer;
begin
        for i := Low(arr) to High(arr) do
                if arr[i] = value then
                begin
                ArrayContains := True;
                Exit;
        end;
          ArrayContains := False;
end;

procedure tab (spaces : integer);

begin
        for i:= 1 to spaces do write(' ');
end;


procedure printNice (printString : string);

var
        firsthalf, secondhalf, thirdhalf, halfway : string;
        spacePos : integer;

begin

        if (length(printString) > 140) then
               begin
               firsthalf := copy(printString,1,70);
               delete(printString,1,70);
               spacePos := pos(' ',printString);
               firsthalf := firsthalf + copy(printString,1,spacePos-1);
               delete(printString,1,spacepos);
               halfway := printString;
               secondhalf := copy(halfway,1,70);
               delete(halfway,1,70);
               spacePos := pos(' ',halfway);
               secondhalf := secondhalf + copy(halfway,1,spacePos-1);
               delete(halfway,1,spacepos);
               thirdhalf := halfway;
               writeln(firsthalf);
               writeln(secondhalf);
               writeln(thirdhalf);
               end
        else if (length(printString) > 80) then
               begin
               firsthalf := copy(printString,1,70);
               delete(printString,1,70);
               spacePos := pos(' ',printString);
               firsthalf := firsthalf + copy(printString,1,spacePos-1);
               delete(printString,1,spacepos);
               secondhalf := printString;
               writeln(firsthalf);
               writeln(secondhalf);
               end
        else writeln (printString);

end;


procedure writeInfiniteHelp;

begin

clrscr;
gotoxy(21,2);
textcolor(11);
writeln('*** Welcome to INFINITE ADVENTURE! ***');
writeln;
textcolor(7);
printNice('Every spooky building you investigate will be unique, drawn from a random set of rooms, objects, descriptions, characters, and goals!');
writeln;
write('Most commands take the form of ');
textcolor(2);
write('VERB NOUN');
textcolor(7);
write(' like ');
textcolor(2);
write('TAKE KITE');
textcolor(7);
write(' or ');
textcolor(2);
write('EXAMINE WALLS');
textcolor(7);
writeln('.');
writeln;
writeln('The commands you''ll need to succeed are:');
textcolor(2);
tab(5); write('EXAMINE [something]');
textcolor(7);
write(' (or');
textcolor(2);
write(' X [something]');
textcolor(7);
writeln(')');
textcolor(2);
tab(5); writeln('TAKE [something]');
tab(5); writeln('TALK TO [someone]');
tab(5); writeln('GIVE [something] TO [someone]');
tab(5); writeln('PUT [something] ON/IN [something else]');
tab(5); write('NORTH/SOUTH/EAST/WEST');
textcolor(7);
write(' (or');
textcolor(2);
write(' N/S/E/W');
textcolor(7);
writeln(')');
textcolor(2);
tab(5); write('INVENTORY');
textcolor(7);
write(' (or');
textcolor(2);
write(' I');
textcolor(7);
writeln(')');
textcolor(2);
tab(5); write('LOOK');
textcolor(7);
write(' (or');
textcolor(2);
write(' L');
textcolor(7);
writeln(')');
textcolor(2);
tab(5); write('MAP');
textcolor(7);
write(' (or');
textcolor(2);
write(' M');
textcolor(7);
writeln(')');
textcolor(7);
writeln('Other commands may produce results as well!');
writeln;
writeln('There are also commands to control the game:');
textcolor(2);
tab(5); writeln('SCORE, QUIT, RESTART, SAVE, LOAD, ABOUT, HELP');
writeln;
textcolor(11);
tab(25);writeln('Happy INFINITE ADVENTURING!');
textcolor(14);
writeln;
write('Press any key to continue ...');
textcolor(7);
keyPress := readKey;
end;



function roomDescribe() : string;

begin
        exits := '';
        if playerx >= 2 then
                begin
                        if map[playerx-1,playery] <> 0 then exits := exits + 'north';
                end;
        if playerx <= 6 then
                begin
                        if map[playerx+1,playery] <> 0 then
                                begin
                                if exits = '' then exits := 'south'
                                else exits := exits + ', south';
                                end;
                end;
        if playery >= 2 then
                begin
                        if map[playerx,playery-1] <> 0 then
                                begin
                                if exits = '' then exits := 'west'
                                else exits := exits + ', west';
                                end;
                end;
        if playery <= 6 then
                begin
                        if map[playerx,playery+1] <> 0 then
                                begin
                                if exits = '' then exits := 'east'
                                else exits := exits + ', east';
                                end;
                end;
        exits := exitsPrepend[random(8)] + exits + '.';

        thingText := '';
        if thingsInRooms[playerx,playery] <> '' then
                begin
                firstLetter := copy(thingsInRooms[playerx,playery],1,1);
                if (firstLetter = 'a') or (firstLetter = 'e') or (firstLetter = 'i') or (firstLetter = 'o') or (firstLetter = 'u') then
                        article := 'n'
                        else
                        article := '';
                thingText := 'There is a' + article + ' ' + thingsInRooms[playerx,playery] + ' here. ';
                end;

        roomDescribe := 'You are in the ' + rooms[playerX,playerY] + '. ' + roomDescription[playerX,playerY] + ' ' + thingText + exits;
end;


procedure getCommand;

begin
        tempIndex := 0;
        word1 := '';
        word2 := '';
        word3 := '';
        word4 := '';
        words := 0;
        write('>');
        textcolor(2);
        readln(rawCommand);
        textcolor(7);
        rawCommand := upcase(rawCommand);
        if (rawCommand = 'AGAIN') or (rawCommand = 'G') then
                begin
                rawCommand := lastCommand;
                writeln('('+rawCommand+')');
                end;
        lastCommand := rawCommand;
        tempIndex := pos(' ',rawCommand);
        if tempIndex <> 0 then
                begin
                word1 := copy(rawCommand,1,tempIndex-1);
                rawCommand := copy(rawCommand,tempIndex+1,length(rawCommand));
                end
        else
                begin
                word1 := rawCommand;
                words := 1;
                exit;
                end;
        tempIndex := pos(' ',rawCommand);
        if tempIndex <> 0 then
                begin
                word2 := copy(rawCommand,1,tempIndex-1);
                rawCommand := copy(rawCommand,tempIndex+1,length(rawCommand));
                end
        else
                begin
                word2 := rawCommand;
                words := 2;
                exit;
                end;
        tempIndex := pos(' ',rawCommand);
        if tempIndex <> 0 then
                begin
                word3 := copy(rawCommand,1,tempIndex-1);
                rawCommand := copy(rawCommand,tempIndex+1,length(rawCommand));
                end
        else
                begin
                word3 := rawCommand;
                words := 3;
                exit;
                end;
        tempIndex := pos(' ',rawCommand);
        if tempIndex <> 0 then
                begin
                word4 := copy(rawCommand,1,tempIndex-1);
                words := 5;
                end
        else
                begin
                word4 := rawCommand;
                words := 4;
                end;

end;


procedure buildMap;

begin
        for i := 1 to 5 do
                begin
                playerInventory[i] := '';
                end;
        victory := '';
        victoryItem := '';
        exitIndex := 0;
        exitMax := 2;
        talkCycle := 1;
        gameResult := '';
        for x := 1 to 7 do
                begin
                for y := 1 to 7 do
                        begin
                        map[x,y] := 0;
                        rooms[x,y] := '';
                        roomDescription[x,y] := '';
                        thingsInRooms[x,y] := '';
                        end;
                end;
        map[4,4] := 8;

        {build north}
        {x is row, y is column}
        tempProbability := probability;

        tempRandom := random;
        if tempRandom <= tempProbability then
                begin
                map[3,4] := 1;
                tempProbability := tempProbability * tempProbability;
                end
        else
                begin
                tempProbability := -1;
                end;

        x := 3;
        y := 4;

        tempRandom := random;
        while tempRandom < tempProbability do
                begin
                tempDirection := random(5);
                if tempDirection = 0 then
                        begin
                        x := x - 1; {north}
                        if x <= 1 then x := 1;
                        end;
                if tempDirection = 1 then
                        begin
                        x := x + 1; {south}
                        if x >= 7 then x := 7;
                        end;
                if tempDirection = 2 then
                        begin
                        y := y - 1; {west}
                        if y <= 1 then y:= 1;
                        end;
                if tempDirection = 3 then
                        begin
                        y := y + 1; {east}
                        if y >= 7 then y := 7;
                        end;
                if map[x,y] = 0 then
                        begin
                        map[x,y] := 1;
                        tempProbability := tempProbability * tempProbability;
                        tempRandom := random;
                        end
                else
                        begin
                        tempProbability := -1;
                        end;
                end;

        {build south}
        {x is row, y is column}
        tempProbability := probability;

        tempRandom := random;
        if tempRandom <= tempProbability then
                begin
                map[5,4] := 1;
                tempProbability := tempProbability * tempProbability;
                end
        else
                begin
                tempProbability := -1;
                end;

        x := 5;
        y := 4;

        tempRandom := random;
        while tempRandom < tempProbability do
                begin
                tempDirection := random(5);
                if tempDirection = 0 then
                        begin
                        x := x - 1; {north}
                        if x <= 1 then x := 1;
                        end;
                if tempDirection = 1 then
                        begin
                        x := x + 1; {south}
                        if x >= 7 then x := 7;
                        end;
                if tempDirection = 2 then
                        begin
                        y := y - 1; {west}
                        if y <= 1 then y:= 1;
                        end;
                if tempDirection = 3 then
                        begin
                        y := y + 1; {east}
                        if y >= 7 then y := 7;
                        end;
                if map[x,y] = 0 then
                        begin
                        map[x,y] := 1;
                        tempProbability := tempProbability * tempProbability;
                        tempRandom := random;
                        end
                else
                        begin
                        tempProbability := -1;
                        end;
                end;

        {build east}
        {x is row, y is column}
        tempProbability := probability;

        tempRandom := random;
        if tempRandom <= tempProbability then
                begin
                map[4,5] := 1;
                tempProbability := tempProbability * tempProbability;
                end
        else
                begin
                tempProbability := -1;
                end;

        x := 4;
        y := 5;

        tempRandom := random;
        while tempRandom < tempProbability do
                begin
                tempDirection := random(5);
                if tempDirection = 0 then
                        begin
                        x := x - 1; {north}
                        if x <= 1 then x := 1;
                        end;
                if tempDirection = 1 then
                        begin
                        x := x + 1; {south}
                        if x >= 7 then x := 7;
                        end;
                if tempDirection = 2 then
                        begin
                        y := y - 1; {west}
                        if y <= 1 then y:= 1;
                        end;
                if tempDirection = 3 then
                        begin
                        y := y + 1; {east}
                        if y >= 7 then y := 7;
                        end;
                if map[x,y] = 0 then
                        begin
                        map[x,y] := 1;
                        tempProbability := tempProbability * tempProbability;
                        tempRandom := random;
                        end
                else
                        begin
                        tempProbability := -1;
                        end;
                end;

        {build west}
        {x is row, y is column}
        tempProbability := probability;

        tempRandom := random;
        if tempRandom <= tempProbability then
                begin
                map[4,3] := 1;
                tempProbability := tempProbability * tempProbability;
                end
        else
                begin
                tempProbability := -1;
                end;

        x := 4;
        y := 3;

        tempRandom := random;
        while tempRandom < tempProbability do
                begin
                tempDirection := random(5);
                if tempDirection = 0 then
                        begin
                        x := x - 1; {north}
                        if x <= 1 then x := 1;
                        end;
                if tempDirection = 1 then
                        begin
                        x := x + 1; {south}
                        if x >= 7 then x := 7;
                        end;
                if tempDirection = 2 then
                        begin
                        y := y - 1; {west}
                        if y <= 1 then y:= 1;
                        end;
                if tempDirection = 3 then
                        begin
                        y := y + 1; {east}
                        if y >= 7 then y := 7;
                        end;
                if map[x,y] = 0 then
                        begin
                        map[x,y] := 1;
                        tempProbability := tempProbability * tempProbability;
                        tempRandom := random;
                        end
                else
                        begin
                        tempProbability := -1;
                        end;
                end;
end;


procedure assignRooms;

begin
        roomlist := stringList.create('Servant''s Quarters','Drawing Room','Sitting Room','Solarium','Kitchen','Dining Room','Bathroom','Hall','Living Room','Master Bedroom','Bedroom','Foyer','Salon','Study','Parlor','Library');
        for x := 1 to 7 do
                begin
                for y := 1 to 7 do
                        begin
                        if map[x,y] > 0 then
                                begin
                                tempRandomInt := random(length(roomList));
                                rooms[x,y] := roomList[tempRandomInt];
                                delete(roomList,tempRandomInt,1); {remove chosen room from possible entries}
                                end;
                        end;
                end;

        placeok := false;

        while placeok = false do
                begin
                x := random(7) + 1;
                y := random(7) + 1;
                if map[x,y] > 0 then
                        begin
                        playerX := x;
                        playerY := y;
                        placeok := true;
                        end;
                end;

        for x := 1 to 7 do
                begin
                for y := 1 to 7 do
                        begin
                        if map[x,y] > 0 then
                                begin
                                tempRandomInt := random(7) + 1;
                                case tempRandomInt of
                                        1 :
                                                begin
                                                tempRandomInt := random(length(covered1)) + 1;
                                                covered := covered1[tempRandomInt] + ' ';
                                                tempRandomInt := random(length(covered2)) + 1;
                                                covered := covered + covered2[tempRandomInt] + ' ';
                                                tempRandomInt := random(length(covered3)) + 1;
                                                covered := covered + covered3[tempRandomInt] + '.';
                                                roomDescription[x,y] := covered;
                                                end;
                                        2 :
                                                begin
                                                tempRandomInt := random(length(temperature1)) + 1;
                                                temperature := 'It is ' + temperature1[tempRandomInt] +'.';
                                                roomDescription[x,y] := temperature;
                                                end;
                                        3 :
                                                begin
                                                tempRandomInt := random(length(painted1)) + 1;
                                                painted := 'The walls are painted ' + painted1[tempRandomInt] + '.';
                                                roomDescription[x,y] := painted;
                                                end;
                                        4 :
                                                begin
                                                tempRandomInt := random(length(window1)) + 1;
                                                window := 'Through a window, you see a' + window1[tempRandomInt] + '.';
                                                roomDescription[x,y] := window;
                                                end;
                                        5 :
                                                begin
                                                tempRandomInt := random(length(feeling1)) + 1;
                                                feeling := 'You feel ' + feeling1[tempRandomInt] + '.';
                                                roomDescription[x,y] := feeling;
                                                end;
                                        6 :
                                                begin
                                                tempRandomInt := random(length(someone1)) + 1;
                                                someone := 'Someone has ' + someone1[tempRandomInt] + ' here.';
                                                roomDescription[x,y] := someone;
                                                end;
                                        7 :
                                                begin
                                                tempRandomInt := random(length(listen1)) + 1;
                                                listen := 'You think you hear ' + listen1[tempRandomInt] + ' somewhere.';
                                                roomDescription[x,y] := listen;
                                                end;

                                        end;
                                end;
                        end;
                end;


end;


procedure assignThings;

begin

        exam[apple] := 'It''s '+apple1[random(3)]+' and looks '+apple2[random(2)];
        exam[ball] := ball1[random(4)] + ' and bouncy.';
        exam[book] := 'It''s a ' + book1[random(3)] + ' about a ' + book2[random(5)] + ' and a ' + book3[random(5)];
        exam[bagel] := 'It''s a bagel with ' + bagel1[random(5)];
        exam[carrot] := 'One carrot, leaves still attached.';
        exam[coin] := 'It has illegible ' + coin1[random(3)] + ' on it but is marked ' + coin2[random(4)] + '. It appears to be made of ' + coin3[random(3)];
        exam[daisy] := 'A daisy with ' + inttostr((random(11)+10)) + ' white petals.';
        exam[daffodil] := 'Bright yellow with ' + daffodil1[random(3)];
        exam[eggplant] := eggplant1[random(4)] + ' purple. It looks ' + eggplant2[random(3)];
        exam[game] := game1[random(4)];
        exam[gem] := 'A' + gem1[random(4)] + ' ' + gem2[random(2)] + ' ' + gem3[random(4)] + '.';
        exam[ingot] := 'A bar of solid ' + ingot1[random(3)];
        exam[kite] := 'A ' + kite1[random(3)] + ' diamond-shaped kite with a tail tied with ' + kite2[random(3)] + ' bows.';
        exam[movie] := 'A videotape of ' + movie1[random(5)];
        exam[necklace] := necklace1[random(5)] + ' hangs on a ' + necklace2[random(2)];
        exam[raincoat] := raincoat1[random(3)] + ' with ' + raincoat2[random(4)];
        exam[ring] := ring1[random(5)] + ' is set in a ' + ring2[random(3)] + ' band.';
        exam[rose] := rose1[random(4)] + ' rose with ' + rose2[random(4)];
        exam[umbrella] := umbrella1[random(3)];
        exam[violet] := violet1[random(3)] + ' and ' + violet2[random(4)];

        numberOfRooms := 0;

        for x:= 1 to 7 do
                begin
                for y := 1 to 7 do
                        begin
                        if map[x,y] <> 0 then numberOfRooms := numberOfRooms + 1;
                        end;
                end;

        numberOfThings := 100;

        while numberOfThings > numberOfRooms - 1 do
                begin
                if numberOfRooms = 3 then numberOfThings := 1;
                if numberOfRooms = 4 then numberOfThings := random(1) + 1;
                if numberOfRooms = 5 then numberOfThings := random(1) + 2;
                if numberOfRooms > 5 then numberOfThings := random(4) + 2;
                end;

        thingsToPlace := stringList.create('apple','ball','book','bagel', 'carrot', 'coin','daisy','daffodil','eggplant','game','gem','ingot','kite','movie','necklace','raincoat','ring','rose','umbrella','violet');

        for i := 1 to numberOfThings do
                begin
                thingok := false;
                while thingok = false do
                        begin
                        x := random(7) + 1;
                        y := random(7) + 1;
                        if map[x,y] <> 0 then
                                begin
                                if thingsInRooms[x,y] = '' then
                                        begin
                                        tempRandomInt := random(length(thingsToPlace));
                                        thingsInRooms[x,y] := thingsToPlace[tempRandomInt];
                                        delete(thingsToPlace,tempRandomInt,1); {remove chosen thing from possible entries}
                                        newObject := thingsInRooms[x,y];
                                        if ArrayContains(funlist, newObject) then victory := 'fun';
                                        if ArrayContains(eatlist, newObject) then victory := 'eat';
                                        if ArrayContains(flowerlist, newObject) then victory := 'flower';
                                        if ArrayContains(valuelist, newObject) then victory := 'value';
                                        if ArrayContains(rainlist, newObject) then victory := 'rain';
                                        thingok := true;
                                        end;
                                end;
                        end;
                end;
end;


procedure assignVictory;

begin

        if (gameType = '') then
                gameType := gameOptions[random(2)]
        else if (gameType = 'person') then
                gameType := 'place'
        else
                gameType := 'person';

        if gameType = 'person' then
                begin
                personok := false;
                place := 'nothing';
                while personok = false do
                        begin
                        x := random(7) + 1;
                        y := random(7) + 1;
                        if map[x,y] <> 0 then
                                begin
                                if thingsInRooms[x,y] = '' then
                                        begin
                                        person := personlist[random(8)];
                                        thingsInRooms[x,y] := person;
                                        personok := true;
                                        end;
                                end;
                        end;

                val(person,tempThing,i); {convert string to things type}
                tempRandomInt := random(7);
                personAdjective := personAdjectives[tempRandomInt];
                personTitle := personTitles[tempRandomInt];
                pronoun := pronouns[random(2)];
                pronounLower := 'he';
                if pronoun = 'She' then pronounLower := 'she';
                possessivePronoun := 'him';
                if pronoun = 'She' then possessivePronoun := 'her';

                if victory = 'fun' then exam[tempThing] := personAdjective + person + ' is here. ' + pronoun + ' looks like ' + pronounLower + ' could use some fun. You could TALK TO the ' + person + '.';
                if victory = 'flower' then exam[tempThing] := personAdjective + person + ' is here. ' + pronoun + ' looks remarkably like a botanist. You could TALK TO the ' + person + '.';
                if victory = 'value' then exam[tempThing] := personAdjective + person + ' is here. ' + pronoun + ' looks greedy, like ' + pronounLower + ' wants riches more than anything. You could TALK TO the ' + person + '.';
                if victory = 'eat' then exam[tempThing] := personAdjective + person + ' is here. ' + pronoun + ' looks very hungry. You could TALK TO the ' + person + '.';
                if victory = 'rain' then exam[tempThing] := personAdjective + person + ' is here. ' + pronoun + ' looks like someone who hates getting wet. You could TALK TO the ' + person + '.';
                end;

        if gameType = 'place' then
                begin
                placeok := false;
                person := 'no one';
                while placeok = false do
                        begin
                        x := random(7) + 1;
                        y := random(7) + 1;
                        if map[x,y] <> 0 then
                                begin
                                if thingsInRooms[x,y] = '' then
                                        begin
                                        place := placelist[random(4)];
                                        thingsInRooms[x,y] := place;
                                        placeok := true;
                                        end;
                                end;
                        end;

                placeok := false;
                while placeok = false do
                        begin
                        x := random(7) + 1;
                        y := random(7) + 1;
                        if (thingsInRooms[x,y] <> '') and (thingsInRooms[x,y] <> place) then
                                begin
                                victoryItem := thingsInRooms[x,y];
                                placeok := true;
                                end;
                        end;

                placeAdjective := placeAdjectives[random(3)];
                exam[pedestal] := 'The pedestal is a' + pedestal1[random(4)] + ' column that looks ' + placeAdjective + '. On it is a ' + pedestal2[random(3)] + ' plaque which reads, "Put the ' + victoryItem + ' on here."';
                exam[chest] := 'It''s an old, wooden chest ' + chest1[random(3)] + '. On it is carved: "Put the ' + victoryItem + ' in here."';
                exam[box] := 'It''s a' + box1[random(3)] + ' cube made of a' + box2[random(2)] + ' metal, possibly ' + box3[random(5)] + '. An attached tag says, "Put the ' + victoryItem + ' in here."';
                exam[idol] := 'It appears to be a ' + idol1[random(5)] + ' statue of a god. It holds its hands out as if expecting an offering.  In your mind, you almost hear, "Put the ' + victoryItem + ' on here."';
        end;




end;


procedure titleDisplay;

begin
        clrscr;
        intro := intro1[random(4)] + ' this ' + intro2[random(5)] + ' old ' + intro3[random(3)] + '. But today is the day you''ll finally ' + intro4[random(4)] + '.';
        if gameType = 'person' then
                begin
                if victory = 'fun' then title := 'THE ' + upcase(funAdj[random(3)]) + ' ' + upcase(person);
                if victory = 'eat' then title := 'THE ' + upcase(eatAdj[random(3)]) + ' ' + upcase(person);
                if victory = 'value' then title := 'THE ' + upcase(valueAdj[random(3)]) + ' ' + upcase(person);
                if victory = 'rain' then title := 'THE ' + upcase(rainAdj[random(3)]) + ' ' + upcase(person);
                if victory = 'flower' then title := 'THE ' + upcase(flowerAdj[random(3)]) + ' ' + upcase(person);
                if random(2) = 1 then title := 'THE ' + upcase(personTitle) + ' ' + upcase(person);
                end;
        if gameType = 'place' then
                begin
                if random(2) = 1 then
                        begin
                        tempString := upcase(place)
                        end
                else
                        begin
                        tempString := upcase(victoryItem);
                        end;
                if random(2) = 1 then
                        begin
                        title := 'THE ' + tempString + ' OF ' + place1[random(4)]
                        end
                else
                        begin
                        title := 'THE ' + place2[random(5)] + ' ' + tempString;
                        end;
                end;
        str(games,tempString);
        infiniteAdventure := 'Infinite Adventure #' + tempString;

        statusRight := infiniteAdventure + ': ' + title;
        textcolor(7);
        if games > 1 then
                writeln('And then you come to a house not unlike the previous one ...')
        else
                writeln;
        writeln;
        textcolor(2);
        printNice(intro);
        textcolor(15);
        writeln;
        writeln;
        gotoxy(1,6);
        writeln('    /\                                                      \'); //4
	writeln('(O)===)><><><><><><><><><><><><><><><><><><><><><><><><><><><)==(O)'); //5
	writeln('    \/''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''/'); //6
	writeln('    (                                                      ('); //7
	writeln('     )                 Infinite Adventure                   )'); //8
	writeln('    (                       presents:                      ('); //9
	writeln('     )                                                      )'); //10
	writeln('    (                                                      ('); //11
	writeln('     )                    Adventure #                       )'); //12
	writeln('    (                                                      ('); //13
	writeln('     )                                                      )'); //14
	//writeln('    (                                                      ('); //15
        writeln('    /\''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''\');    //16
	writeln('(O)===)><><><><><><><><><><><><><><><><><><><><><><><><><><><)==(O)'); //17
	writeln('    \/______________________________________________________/'); //18
        gotoxy(33-(length(title) div 2),13);
        textcolor(11);
        writeln(title);
        textcolor(15);
        gotoxy(38,14);
        writeln(games);
        textcolor(7);
        gotoxy(1,23);
        if games = 1 then
                begin
                write('Type ');
                textcolor(2);
                write('HELP');
                textcolor(7);
                write(' for information on how to play. Try out ');
                textcolor(2);
                write('MAP');
                textcolor(7);
                writeln(' too!');
                writeln;
                end;
        if (games = 23) and (flavorText = false) then
                begin
                textcolor(11);
                writeln('You yawn.');
                textcolor(7);
                writeln;
                flavorText := true;
                end;
        if (games = 25) and (flavorText = false) then
                begin
                textcolor(11);
                writeln('You yawn again.');
                textcolor(7);
                writeln;
                flavorText := true;
                end;
        if (games = 28) and (flavorText = false) then
                begin
                textcolor(11);
                writeln('You yawn yet again. Man, it''s late.');
                textcolor(7);
                writeln;
                flavorText := true;
                end;
        if (games = 30) and (flavorText = false) then
                begin
                textcolor(11);
                writeln('Your head drops a bit but you shake yourself awake.');
                textcolor(7);
                writeln;
                flavorText := true;
                end;
        if (games = 32) and (flavorText = false) then
                begin
                textcolor(11);
                writeln('Why are you even still playing this game?');
                textcolor(7);
                writeln;
                flavorText := true;
                end;
        if (games = 33) and (flavorText = false) then
                begin
                textcolor(11);
                writeln('What you do think you''re going to find here?');
                textcolor(7);
                writeln;
                flavorText := true;
                end;
        if (games = 34) and (flavorText = false) then
                begin
                textcolor(11);
                writeln('Do you think there''s something meaningful in nostaglia?');
                textcolor(7);
                writeln;
                flavorText := true;
                end;
        if (games = 35) and (flavorText = false) then
                begin
                textcolor(11);
                writeln('You close your eyes and struggle to reopen them.');
                textcolor(7);
                writeln;
                flavorText := true;
                end;
        if (games = 36) and (flavorText = false) then
                begin
                textcolor(11);
                writeln('You should quit. You need to go to sleep.');
                textcolor(7);
                writeln;
                flavorText := true;
                end;
        if (games = 38) and (flavorText = false) then
                begin
                textcolor(11);
                writeln('Fine, if you think one or one million more won''t hurt, I won''t stop you.');
                textcolor(7);
                writeln;
                flavorText := true;
                end;
        if (games = 39) and (flavorText = false) then
                begin
                textcolor(11);
                writeln('Even though I could, Em. And maybe I should.');
                textcolor(7);
                writeln;
                flavorText := true;
                end;
        if (games = 41) and (flavorText = false) then
                begin
                textcolor(11);
                writeln('Good night, Em.');
                textcolor(7);
                writeln;
                flavorText := true;
                end;
        textcolor(14);
        writeln('Press any key to continue.');
        textcolor(7);
        keyPress := readkey;
        if (games = 41) then
                begin
                clrscr;
                halt(0);
                end;

end;


procedure initialDisplay;

begin
        textbackground(0);
        clrscr;
        gotoxy(1,1);
        textcolor(0);
        textbackground(11);
        for i := 1 to 80 do
                write(' ');
        gotoxy(1,1);
        writeln(rooms[playerx,playery]);
        gotoxy(81-length(statusRight),1);
        writeln(statusRight);
        gotoxy(1,3);
        textcolor(7);
        textbackground(0);
        printNice(description);
        writeln;

end;

procedure parseCommand;

begin
        response := 'null';

        if (word1 = 'INSERT') then
                word1 := 'PUT';

        if (word2 = 'PLAQUE') and (gameType = 'place') and (place = 'pedestal') then
                word2 := 'PEDESTAL';

        if (word2 = 'TAG') and (gameType = 'place') and (place = 'box') then
                word2 := 'BOX';

        if (word1 = 'READ') and (gameType = 'place') then
                if (word2 = 'BOX') or (word2 = 'PEDESTAL') then
                        word1 := 'EXAMINE';

        if (word1 = 'READ') and (word2 = 'SCRIBBLE') then
                word1 := 'EXAMINE';

        if (word2 = 'COMPUTER') then
                word2 := 'LAPTOP';

        if (word3 = 'COMPUTER') then
                word3 := 'LAPTOP';

        if (word1 = 'TURN') and (word2 = 'OFF') and (word3 = 'LAPTOP') then
                begin
                word1 := 'QUIT';
                words := 1;
                end;

        if (words = 2) and (word2 = '') then
                words := 1;

        if (words = 3) and (word3 = '') then
                words := 2;


        if (words = 4) and (word4 = '') then
                words := 3;

        if (words = 3) and (word2 = 'THE') then
                begin
                words := 99;
                response := 'You don''t need to use the word "THE".  Try a form of VERB NOUN instead.';
                end;

        if (word1 = 'TALK') and (word3 = 'THE') then
                begin
                words :=3;
                word3 := word4;
                word4 := '';
                end;

        if (word1 = 'CLOSE') and (word2 = 'LAPTOP') then
                begin
                words := 1;
                word1 := 'QUIT';
                end;

        if (word1 = 'SAVE') then
                words := 1;

        if (word1 = 'LOAD') then
                words := 1;

        if words = 1 then

                if (word1 = 'L') or (word1 = 'LOOK') then
                        response := description

                else if (word1 = 'HELP') or (word1 = 'INFO') or (word1 = 'INFORMATION') or (word1 = 'HINT') then
                        begin
                        word1 := 'HELP';
                        response := '';
                        end

                else if word1 = 'SAVE' then
                        begin
                        assign(fileOut,fileName);
                        rewrite(fileOut);
                        writeln(fileOut,games);
                        writeln(fileOut,wins);
                        writeln(fileOut,losses);
                        writeln(fileOut,playerx);
                        writeln(fileOut,playery);
                        writeln(fileOut,date);
                        writeln(fileOut,chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1));
                        writeln(fileOut,'have');
                        writeln(fileOut,chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1));
                        writeln(fileOut,'you');
                        writeln(fileOut,chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1));
                        writeln(fileOut,'tried');
                        writeln(fileOut,chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1));
                        writeln(fileOut,'talking');
                        writeln(fileOut,chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1));
                        writeln(fileOut,'to');
                        writeln(fileOut,chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1));
                        writeln(fileOut,'the');
                        writeln(fileOut,chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1));
                        writeln(fileOut,'others');
                        writeln(fileOut,chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1),chr(random(254)+1));
                        writeln(fileOut,'###INCOMPAT_TIME###');
                        writeln(fileOut,'... memory error $07c3 ...');
                        close(fileout);
                        response := 'Game information saved to INFINITE.SAV.';
                        end

                else if (word1 = 'LOAD') or (word1 = 'RESTORE') then
                        response := 'Data corrupted. Check INFINITE.SAV.'

                else if (word1 = 'SCORE') then
                        begin
                        if wins = 1 then
                                word1 := 'win'
                        else
                                word1 := 'wins';
                        if losses = 1 then
                                word2 := 'loss'
                        else
                                word2 := 'losses';
                        tempRandomInt := games - 1;
                        if tempRandomInt = 1 then
                                response := 'game'
                        else
                                response := 'games';
                        str(tempRandomInt,tempString);
                        str(wins,word3);
                        str(losses,word4);
                        response := 'Out of '+tempString+' '+response+', there have been '+word3+' '+word1+' and '+word4+' '+word2+'.';
                        end

                else if (word1 = 'ABOUT') or (word1 = 'CREDITS') or (word1 = 'VERSION') then
                        begin
                        textbackground(0);
                        textcolor(6);
                        writeln;
                        writeln('/======================\');
                        writeln('|                      |');
                        writeln('|  Infinite Adventure  |');
                        writeln('|                      |');
                        writeln('X----------------------X');
                        writeln('|       (c) 1986       |');
                        writeln('|    by Adam Scotts    |');
                        writeln('|      for my mom!     |');
                        write('\======================/');
                        response := '';
                        textcolor(7);
                        end

                else if (word1 = 'E') or (word1 = 'EAST') then
                        if playery <= 6 then
                                if map[playerx,playery + 1] <> 0 then
                                        begin
                                        playery := playery + 1;
                                        description := roomDescribe();
                                        initialDisplay;
                                        response := '';
                                        exit;
                                        end
                                else
                                        response := 'You can''t go that way!'
                        else
                                response := 'You can''t go that way!'

                else if (word1 = 'W') or (word1 = 'WEST') then
                        if playery >= 2 then
                                if map[playerx,playery - 1] <> 0 then
                                        begin
                                        playery := playery - 1;
                                        description := roomDescribe();
                                        initialDisplay;
                                        response := '';
                                        exit;
                                        end
                                else
                                        response := 'You can''t go that way!'
                        else
                                response := 'You can''t go that way!'

                else if (word1 = 'N') or (word1 = 'NORTH') then
                        if playerx >= 2 then
                                if map[playerx - 1,playery] <> 0 then
                                        begin
                                        playerx := playerx - 1;
                                        description := roomDescribe();
                                        initialDisplay;
                                        response := '';
                                        exit;
                                        end
                                else
                                        response := 'You can''t go that way!'
                        else
                                response := 'You can''t go that way!'

                else if (word1 = 'S') or (word1 = 'SOUTH') then
                        if playerx <= 6 then
                                if map[playerx + 1,playery] <> 0 then
                                        begin
                                        playerx := playerx + 1;
                                        description := roomDescribe();
                                        initialDisplay;
                                        response := '';
                                        exit;
                                        end
                                else
                                        response := 'You can''t go that way!'
                        else
                                response := 'You can''t go that way!'

                else if (word1 = 'I') or (word1 = 'INVENTORY') then
                        begin
                        response := 'You are carrying ';
                        if playerInventory[1] <> '' then
                                begin
                                firstLetter := copy(playerInventory[1],1,1);
                                if (firstLetter = 'a') or (firstLetter = 'e') or (firstLetter = 'i') or (firstLetter = 'o') or (firstLetter = 'u') then
                                        article := 'n'
                                else
                                        article := '';
                                response := response + 'a' + article + ' ' + playerInventory[1];
                                end
                        else
                                response := response + 'nothing';
                        if playerInventory[2] <> '' then
                                begin
                                firstLetter := copy(playerInventory[2],1,1);
                                if (firstLetter = 'a') or (firstLetter = 'e') or (firstLetter = 'i') or (firstLetter = 'o') or (firstLetter = 'u') then
                                        article := 'n'
                                else
                                        article := '';
                                response := response + ', a' + article + ' ' + playerInventory[2];
                                end;
                        if playerInventory[3] <> '' then
                                begin
                                firstLetter := copy(playerInventory[3],1,1);
                                if (firstLetter = 'a') or (firstLetter = 'e') or (firstLetter = 'i') or (firstLetter = 'o') or (firstLetter = 'u') then
                                        article := 'n'
                                else
                                        article := '';
                                response := response + ', a' + article + ' ' + playerInventory[3];
                                end;
                        if playerInventory[4] <> '' then
                                begin
                                firstLetter := copy(playerInventory[4],1,1);
                                if (firstLetter = 'a') or (firstLetter = 'e') or (firstLetter = 'i') or (firstLetter = 'o') or (firstLetter = 'u') then
                                        article := 'n'
                                else
                                        article := '';
                                response := response + ', a' + article + ' ' + playerInventory[4];
                                end;
                        if playerInventory[5] <> '' then
                                begin
                                firstLetter := copy(playerInventory[5],1,1);
                                if (firstLetter = 'a') or (firstLetter = 'e') or (firstLetter = 'i') or (firstLetter = 'o') or (firstLetter = 'u') then
                                        article := 'n'
                                else
                                        article := '';
                                response := response + ', a' + article + ' ' + playerInventory[5];
                                end;
                        response := response + '.';
                        end

                else if (word1 = 'Q') or (word1 = 'QUIT') or (word1 = 'EXIT') then
                        response :=''

                else if (word1 = 'RESTART') then
                        response :=''

                else if (word1 = 'UNDO') then
                        response := 'You can''t undo the past.'

                else if (word1 = 'WAIT') or (word1 = 'Z') then
                        response := 'You wait around for a bit. Nothing happens.'

                else if (word1 = 'SHAZAM') then
                        response := 'Nothing happens here. Maybe someplace else.'

                else if (word1 = 'XYZZY') then
                        response := 'Gesundheit!'

                else if (word1 = 'LISTEN') then
                        if (pos('hear',roomDescription[playerx,playery]) <> 0 ) then
                                response := 'Listening again, you no longer hear anything. Maybe you''re imagining things.'
                        else
                                response := 'You only hear your breathing.'

                else if (word1 = 'SLEEP') then
                        response := 'You''d rather not. You''re worried this house might give you nightmares.'

                else if (word1 = 'SING') then
                        response := 'You''re not in the mood for a tune.'

                else if (word1 = 'SCREAM') or (word1 = 'SHOUT') then
                        response := 'You''re not sure you want to call attention to yourself.'

                else if (word1 = 'PUT') or (word1 = 'PLACE') or (word1 = 'SET') then
                        response := 'Try PUT [x] ON/IN [y] instead.'

                else if (word1 = 'TAKE') or (word1 = 'DROP') or (word1 = 'X') or (word1 = 'EXAMINE') or (word1 = 'GET') then
                        response := 'Please supply a noun with that command.'

                else if (word1 = 'GIVE') then
                        response := 'Try GIVE [x] TO [y] instead.'

                else if (word1 = 'TALK') or (word1 = 'ASK') or (word1 = 'TELL') or (word1 = 'SAY') then
                        response := 'Try TALK TO [x] instead.'

                else if (word1 = 'AMUSING') then
                        response := 'Try ABOUT ABOUT as a command.'

                else if (word1 = '') then
                        response := 'Try speaking audibly.'

                else if (word1 = 'M') or (word1 = 'MAP') then
                        begin
                        for x := 1 to 7 do
                                begin
                                for y := 1 to 7 do
                                        begin
                                        if map[x,y] <> 0 then
                                                if (x = playerx) and (y = playery) then
                                                        begin
                                                        textcolor(2);
                                                        write('X');
                                                        textcolor(7);
                                                        end
                                                else if (thingsinRooms[x,y] = person) then
                                                        begin
                                                        tempString := copy(person,1,1);
                                                        textcolor(3);
                                                        write(upcase(tempString));
                                                        textcolor(7);
                                                        end
                                                else if (thingsinRooms[x,y] = place) then
                                                        begin
                                                        tempString := copy(place,1,1);
                                                        textcolor(3);
                                                        write(upcase(tempString));
                                                        textcolor(7);
                                                        end
                                                else if (thingsInRooms[x,y] <> '') then
                                                        write('I')
                                                else
                                                        write('O')
                                        else
                                                write(' ');
                                        write(' ');
                                        end;
                                writeln;
                                end;
                        writeln;
                        exit;
                        end

                else if (ArrayContains(playerInventory,lowercase(word1))) or (ArrayContains(thingsInRooms[playerx,playery],lowercase(word1))) then
                        response := 'I don''t understand "'+word1+'" as a verb.'

                else if (ArrayContains(scenerylist,lowercase(word1))) or (ArrayContains(scenerylist2,lowercase(word1))) then
                        response := 'I don''t understand "'+word1+'" as a verb.'

                else
                        response := 'I don''t understand "'+word1+'".';

        if words = 2 then
                if (word1 = 'ABOUT') and (word2 = 'ABOUT') then
                        begin
                        textbackground(0);
                        textcolor(13);
                        writeln;
                        writeln('/======================\');
                        writeln('|                      |');
                        writeln('|  Infinite Adventure  |');
                        writeln('|                      |');
                        writeln('X----------------------X');
                        writeln('|       (c) 2021       |');
                        writeln('|     by B.J. Best     |');
                        writeln('|    for IFComp ''21!   |');
                        writeln('X----------------------X');
                        writeln('|                      |');
                        writeln('|  Written in Pascal,  |');
                        writeln('|  the champagne       |');
                        writeln('|  of languages.       |');
                        writeln('|                      |');
                        writeln('|  www.freepascal.org  |');
                        writeln('|                      |');
                        write('\======================/');
                        response := '';
                        textcolor(7);
                        end

                else if (word1 = 'TAKE') or (word1 = 'GET') then
                        if (lowercase(word2) = thingsInRooms[playerx,playery]) and (not (ArrayContains(placelist,lowercase(word2)))) and (not (ArrayContains(personlist,lowercase(word2)))) then
                                begin
                                response := 'You take the ' + thingsInRooms[playerx,playery] + '.';
                                for i := 1 to 5 do
                                        if playerInventory[i] <> '' then
                                                continue
                                        else
                                                begin
                                                playerInventory[i] := thingsInRooms[playerx,playery];
                                                thingsInRooms[playerx,playery] := '';
                                                description := roomDescribe();
                                                end;
                                end

                        else if word2 = 'TROPHY' then
                                response := '###INCOMPAT_ITEM###'

                        else if word2 = 'CABINET' then
                                response := '###INCOMPAT_ITEM###'

                        else if (word2 = 'COMPUTER') or (word2 = 'LAPTOP') then
                                response := 'It''s already yours.'

                        else if (word2 = 'DOS') or (word2 = 'DOSBOX') or (word2 = 'EMULATOR') then
                                response := 'The DOS emulator is already on your laptop.'

                        else if (word2 = 'ADVENTURE') or (word2 = 'INFINITE') then
                                response := 'You''re already playing ' + statusRight +'.'

                        else if (word2 = 'INFINITY') then
                                response := 'It''s difficult to take something endless.'

                        else if (lowercase(word2) = thingsInRooms[playerx,playery]) and (ArrayContains(placelist,lowercase(word2))) then
                                response := 'The ' + lowercase(word2) + ' is quite heavy. You can''t move it, much less carry it.'

                        else if (lowercase(word2) = thingsInRooms[playerx,playery]) and (ArrayContains(personlist,lowercase(word2))) then
                                response := 'But the ' + lowercase(word2) + ' isn''t taken with you!'

                        else if (ArrayContains(thinglist2,lowercase(word2))) or (ArrayContains(personlist,lowercase(word2))) then
                                response := 'You don''t see that here.'

                        else if ArrayContains(scenerylist,lowercase(word2)) or ArrayContains(scenerylist2,lowercase(word2)) then
                                response := 'You can''t take that.'

                        else
                                response := 'I don''t understand "' + word2 + '".'

                else if (word1 = 'TICKLE') and (lowercase(word2) = person) and (lowercase(word2) = thingsInRooms[playerx,playery]) then
                        response := 'The ' + person + ' doesn''t seem particularly ticklish.'

                else if (word1 = 'TICKLE') and (word2 = 'SHERIFF') then
                        response := 'The sheriff seems to have left for less mirthful pastures.'

                else if (word1 = 'X') or (word1 = 'EXAMINE') or (word1 = 'EXAM') or (word1 = 'EX') or (word1 = 'SEARCH') then
                        if (lowercase(word2) = thingsInRooms[playerx,playery]) or (ArrayContains(playerInventory,lowercase(word2))) then
                                begin
                                val(lowercase(word2),tempThing,i);
                                response := exam[tempthing];
                                end

                        else if (word2 = 'DOS') or (word2 = 'DOSBOX') or (word2 = 'EMULATOR') then
                                response := 'DOSBox version 0.7-3.'

                        else if (word2 = 'ADVENTURE') or (word2 = 'INFINITE') then
                                response := statusRight + '.'

                        else if (word2 = 'DESK') then
                                response := 'The desk upon which your computer sits might be made of wood, but it probably isn''t.'

                        else if (word2 = 'INFINITY') then
                                response := 'It appears to be endless.'

                        else if word2 = 'SHERIFF' then
                                response := 'In your experience, most sheriffs are mirthless.'

                        else if word2 = 'CABINET' then
                                response := '###INCOMPAT_ITEM###'

                        else if word2 = 'TROPHY' then
                                response := '###INCOMPAT_ITEM###'

                        else if word2 = 'RILEY' then
                                response := 'Riley isn''t here, Em.  But some of the others might be.'

                        else if (word2 = 'OTHERS') or (word2 = 'PEOPLE') then
                                response := 'Name someone more specific.'

                        else if (word2 = 'WITCH') or (word2 = 'ELISE') then
                                response := 'The witch isn''t quite here, exactly. But you could try talking to her.'

                        else if (word2 = 'WARRIOR') or (word2 = 'WARRIORS') or (word2 = 'XANMOR') or (word2 = 'GARDON') or (word2 = 'BRIAN') then
                                response := 'The warrior isn''t quite here, exactly. But you could try talking to him.'

                        else if (word2 = 'STRIPPER') or (word2 = 'STRIP') or (word2 = 'POKER') or (word2 = 'ASHLEY') then
                                response := 'The stripper isn''t quite here, exactly. But you could try talking to her.'

                        else if (word2 = 'COMPUDOCTOR') or (word2 = 'DOCTOR') or (word2 = 'COMPU') or (word2 = 'DOC') or (word2 = 'COMPUDOC') or (word2 = 'MURPHY') then
                                response := 'The doctor isn''t quite here, exactly. But you could try talking to him.'

                        else if (word2 = 'OFFICE') then
                                response := 'Sometimes you wonder what offices were like before there were computers.'

                        else if (word2 = 'COMPUTER') or (word2 = 'LAPTOP') then
                                response := 'Yeah, your laptop is pretty old, but it keeps chugging along.'

                        else if (ArrayContains(thinglist2,lowercase(word2))) or (ArrayContains(personlist,lowercase(word2))) then
                                response := 'You don''t see that here.'

                        else if (ArrayContains(scenerylist,lowercase(word2))) or (ArrayContains(scenerylist2,lowercase(word2))) then
                                begin
                                tempIndex := length(word2);
                                tempString := copy(word2,tempIndex,1);
                                if tempString <> 'S' then
                                        response := 'It seems ' + scenery1[random(5)] + ' but ' + scenery2[random(4)] + '.'
                                else
                                        response := 'They seem ' + scenery1[random(5)] + ' but ' + scenery2[random(4)] + '.';
                                end

                        else if (word2 = 'ME') or (word2 = 'SELF') or (word2 = 'MYSELF') then
                                response := 'You look precisely like the kind of person who would wander around an infinite number of spooky houses.'

                        else
                                response := 'I don''t understand "' + word2 + '".'

                else if word1 = 'DROP' then
                        if ArrayContains(playerInventory,lowercase(word2)) then
                                response := 'No, you might need that.'

                        else if lowercase(word2) = thingsInRooms[playerx,playery] then
                                response := 'You haven''t taken that yet.'

                        else if (ArrayContains(thinglist2,lowercase(word2))) or (ArrayContains(personlist,lowercase(word2))) then
                                response := 'You don''t see that here.'

                        else if ArrayContains(scenerylist,lowercase(word2)) or ArrayContains(scenerylist2,lowercase(word2)) then
                                response := 'That doesn''t make sense.'

                        else
                                response := 'I don''t understand "' + word2 + '".'

                else if ((word1 = 'READ') and (word2 = 'BOOK')) then
                        if ArrayContains(playerInventory,lowercase(word2)) then
                                response := 'You skim a few pages, but the book seems boring.'

                        else if lowercase(word2) = thingsInRooms[playerx,playery] then
                                response := 'Try taking it first.'

                        else
                                response := 'You don''t have a book.'

                else if ((word1 = 'WATCH') and (word2 = 'MOVIE')) then
                        if ArrayContains(playerInventory,lowercase(word2)) then
                                response := 'There''s no VCR in this mansion.'

                        else if lowercase(word2) = thingsInRooms[playerx,playery] then
                                response := 'There''s no VCR in this mansion.'

                        else
                                response := 'I don''t understand "WATCH" here.'

                else if word1 = 'GO' then
                        if (word2 = 'N') or (word2 = 'NORTH') then
                                response := 'Try using just NORTH instead.'
                        else if (word2 = 'S') or (word2 = 'SOUTH') then
                                response := 'Try using just SOUTH instead.'
                        else if (word2 = 'W') or (word2 = 'WEST') then
                                response := 'Try using just WEST instead.'
                        else if (word2 = 'E') or (word2 = 'EAST') then
                                response := 'Try using just EAST instead.'
                        else
                                response := 'I can''t go there.  Try using NORTH, SOUTH, EAST, or WEST.'

                else if word1 = 'OPEN' then
                        if (lowercase(word2) = 'chest') or (lowercase(word2) = 'box') then
                                begin
                                if (thingsInRooms[playerx,playery] = 'chest') or (thingsInRooms[playerx,playery] = 'box') then
                                        response := 'It''s already open.';
                                end

                        else if ((lowercase(word2) = 'umbrella') and ((thingsInRooms[playerx,playery] = lowercase(word2)) or (ArrayContains(playerInventory,lowercase(word2))))) then
                                response := 'It''s bad luck to open an umbrella inside!'

                        else if (thingsInRooms[playerx,playery] = lowercase(word2)) or (ArrayContains(playerInventory,lowercase(word2))) then
                                response := 'That doesn''t open.'

                        else if (word2 = 'COMPUTER') or (word2 = 'LAPTOP') then
                                response := 'It''s already open.'

                        else if (word2 = 'CABINET') then
                                response := '###INCOMPAT_ITEM###'

                        else
                                response := 'I don''t understand "OPEN" here.'

                else if word1 = 'CLOSE' then
                        if (lowercase(word2) = 'chest') or (lowercase(word2) = 'box') then
                                begin
                                if (thingsInRooms[playerx,playery] = 'chest') or (thingsInRooms[playerx,playery] = 'box') then
                                        response := 'It''s open and there''s no need to close it.';
                                end

                        else if ((lowercase(word2) = 'umbrella') and ((thingsInRooms[playerx,playery] = lowercase(word2)) or (ArrayContains(playerInventory,lowercase(word2))))) then
                                response := 'It''s already closed.'

                        else if (thingsInRooms[playerx,playery] = lowercase(word2)) or (ArrayContains(playerInventory,lowercase(word2))) then
                                response := 'That doesn''t close.'
                        else
                                response := 'I don''t understand "CLOSE" here.'

                else if (word1 = 'ATTACK') or (word1 = 'HIT') or (word1 = 'BREAK') or (word1 = 'KILL') or (word1 = 'KICK') or (word1 = 'SMASH') then
                        if (lowercase(word2) = thingsInRooms[playerx,playery]) or (ArrayContains(playerInventory,lowercase(word2))) then
                                response := 'There''s no need to be violent.'
                        else if (ArrayContains(scenerylist,lowercase(word2))) or (ArrayContains(scenerylist2,lowercase(word2))) then
                                response := 'There''s no need to be violent.'
                        else
                                response := 'I don''t understand "' + word2 + '" here.'

                else if (word1 = 'KISS') or (word1 = 'LOVE') or (word1 = 'HUG') then
                        if (lowercase(word2) = thingsInRooms[playerx,playery]) or (ArrayContains(playerInventory,lowercase(word2))) then
                                response := 'There''s no need to be romantic.'
                        else if (ArrayContains(scenerylist,lowercase(word2))) or (ArrayContains(scenerylist2,lowercase(word2))) then
                                response := 'There''s no need to be romantic.'
                        else
                                response := 'I don''t understand "' + word2 + '" here.'

                else if (word1 = 'TALK') or (word1 = 'ASK') or (word1 = 'TELL') or (word1 = 'SAY') then
                        if lowercase(word2) = person then
                                begin
                                word2 := 'TO';
                                word3 := person;
                                words := 3;
                                end
                        else if ArrayContains(otherslist, word2) then
                                begin
                                word3 := word2;
                                word2 := 'TO';
                                words := 3;
                                end
                        else
                                response := 'Try TALK TO [x] instead.'

                else if (word1 = 'PUT') or (word1 = 'PLACE') or (word1 = 'SET') then
                        if (ArrayContains(playerInventory,lowercase(word2))) and (thingsInRooms[playerx,playery] = place) then
                                begin
                                words := 4;
                                word3 := 'ON';
                                word4 := place;
                                end
                        else
                                response := 'Try PUT [x] ON/IN [y] instead.'

                else if (word1 = 'GIVE') or (word1 = 'SHOW') then
                        if (ArrayContains(playerInventory,lowercase(word2))) and (thingsInRooms[playerx,playery] = person) then
                                begin
                                words := 4;
                                word3 := 'ON';
                                word4 := person;
                                end
                        else
                                response := 'Try GIVE [x] TO [y] instead.'

                else if (word1 = 'SMELL') then
                        if (ArrayContains(playerInventory,lowercase(word2))) or (lowercase(word2) = thingsInRooms[playerx,playery]) then
                                if (ArrayContains(flowerlist,lowercase(word2))) then
                                        response := 'It smells ' + smell1[Random(4)] + '.'
                                else
                                        response := 'It smells like you would expect.'
                        else
                                response := 'I don''t understand "SMELL" here.'

                else if (word1 = 'WEAR') then
                        if (lowercase(word2) = thingsInRooms[playerx,playery]) or (ArrayContains(playerInventory,lowercase(word2))) then
                                if (ArrayContains(wearlist,lowercase(word2))) then
                                        response := 'You wear the ' + lowercase(word2) + ' for a while, then you take it back off.'
                                else
                                        response := 'You can''t wear that.'
                        else
                                response := 'I don''t understand "WEAR" here.'


                else if (word1 = 'EAT') then
                        if (ArrayContains(playerInventory,lowercase(word2))) or (lowercase(word2) = thingsInRooms[playerx,playery]) then
                                if (ArrayContains(eatlist,lowercase(word2))) then
                                        response := 'You''re not hungry.'
                                else
                                        response := 'You can''t eat that.'
                        else
                                response := 'I don''t understand "EAT" here.'

                else if (word1 = 'LISTEN') then
                        if (pos('hear',roomDescription[playerx,playery]) <> 0 ) then
                                response := 'Listening again, you no longer hear anything.  Maybe you''re imagining things.'
                        else
                                response := 'You only hear your breathing.'

                else if (word1 = 'ASK') or (word1 = 'TELL') or (word1 = 'SAY') then
                        response := 'Try TALK TO [x] instead.'

                else if (word1 = 'L') or (word1 = 'LOOK') or (word1 = 'I') or (word1 = 'INVENTORY') or (word1 = 'M') or (word1 = 'MAP') then
                        response := '"' + word1 +'" is a one-word command.'

                else if (word1 = 'N') or (word1 = 'NORTH') or (word1 = 'S') or (word1 = 'SOUTH') or (word1 = 'W') or (word1 = 'WEST') or (word1 = 'E') or (word1 = 'EAST') then
                        response := '"' + word1 +'" is a one-word command.'

                else if (ArrayContains(playerInventory,lowercase(word1))) or (ArrayContains(thingsInRooms[playerx,playery],lowercase(word1))) then
                        response := 'I don''t understand "'+word1+'" as a verb.'

                else if (ArrayContains(scenerylist,lowercase(word1))) or (ArrayContains(scenerylist2,lowercase(word1))) then
                        response := 'I don''t understand "'+word1+'" as a verb.'

                else
                        response := 'I don''t understand "' + word1 + '".';

        if words = 3 then

                if word1 = 'TALK' then
                        if (word3 = 'OTHERS') or (word3 = 'PEOPLE') then
                                response := 'Name someone more specific.'

                        else if (word3 = 'WITCH') or (word3 = 'ELISE') then
                                begin
                                textcolor(11);
                                writeln('Emmy, it''s great to see you, though if you''re looking for me here, it makes');
                                writeln('me a little worried, too. I wish I could know what you''re thinking about or');
                                writeln('what you remember. I hope at least some of it is our stories about SHAZAM and');
                                writeln('the worlds we could build from that simple word. Maybe that seems silly, now');
                                writeln('that you''ve grown up. But I hope your life is still magical, Emmy. In the end,');
                                write('that''s all I really wanted.');
                                response := '';
                                textcolor(7);
                                end

                        else if (word3 = 'WARRIOR') or (word3 = 'BRIAN') or (word3 = 'GARDON') then
                                begin
                                textcolor(11);
                                writeln('Hello, warrior Emerson! Hah. Man, that was such a weird gig. Apparently you''ve');
                                writeln('been researching us on the Internet. But I guess there''s more to say than my');
                                writeln('dead Facebook page would tell you. So I thought I''d let you know that I');
                                writeln('did get on a soap opera. I was an evil doctor who has having an affair with');
                                writeln('one of the main characters. Typical stuff. Then I was killed off in an');
                                writeln('elevator shaft. Typical stuff too, but I thought I played it well. The roles');
                                writeln('didn''t really come after that, lackaday, and eventually my agent stopped');
                                writeln('returning my calls. So back to Cincinnati I went and now I work at my');
                                writeln('father''s accounting firm. Sometimes I get to do a local show. I don''t know if');
                                writeln('there''s a moral there. Typical failed actor, probably. But my life is good');
                                write('enough. Fare thee well, loyal Emerson. May you win all of your battles.');
                                response := '';
                                textcolor(7);
                                end

                        else if (word3 = 'DOCTOR') or (word3 = 'COMPUDOCTOR') or (word3 = 'DOC') or (word3 = 'COMPUDOC') or (word3 = 'MURPHY') then
                                begin
                                textcolor(11);
                                writeln('Emerson--it''s Ashley. I guess there''s no good way to say this. Dr. Murphy');
                                writeln('died a few years ago. He had a heart attack in his sleep. He really was a');
                                writeln('good man. We got to know each other well when we played cards. It was weird,');
                                writeln('some middle-aged dork and me, but maybe we were both lonely. Anyway, after his');
                                writeln('son''s death, he and his wife adopted a baby girl. She''s out of college and in');
                                writeln('podiatry school, following in her father''s footsteps. (Maybe I shouldn''t make');
                                writeln('a joke like that, but I think he would approve.) I remember how he was happy');
                                writeln('that you visited him. I think it was nice for him to see another child during');
                                write('his time of grief. I just wanted to let you know.');
                                response := '';
                                textcolor(7);
                                end

                        else if (word3 = 'STRIPPER') or (word3 = 'ASHLEY') then
                                begin
                                textcolor(11);
                                writeln('Nice to see you back, Em. Never thought I''d find you snooping around the');
                                writeln('Internet for me. Most people searching for me have a different reason, as you');
                                writeln('might guess. Anyway, I continued dancing for a while until the scene just got');
                                writeln('old. Never did another computer game. Also never thought I''d go to school,');
                                writeln('but I did, worked in an office, met my husband, white picket fence, two and');
                                writeln('a half kids, blah blah blah. The stripper-turned-wife American dream. I hope');
                                writeln('you and Riley grew up all right. On my happier days I like to think that I');
                                writeln('sold something beautiful. I guess you can decide if that''s true.');
                                write('Ashley.');
                                response := '';
                                textcolor(7);
                                end

                        else if (word3 = 'RILEY') then
                                response := 'Riley isn''t here, Em.  But some of the others might be.'

                        else if (lowercase(word3) = person) and (person = thingsInRooms[playerx,playery]) then
                                if talkCycle = 1 then
                                        begin
                                        if victory = 'fun' then
                                                response := '"Greetings!" the '+person+' says. "I sure am bored. Can you bring me something fun to do?"'
                                        else if victory = 'eat' then
                                                response := '"Hello there!" the '+person+' says. "I feel like I''m starving. Can you bring me something to eat?"'
                                        else if victory = 'flower' then
                                                response := '"Welcome!" the '+person+' says. "It sure is drab here in the '+rooms[playerx][playery]+'. Could you bring me a flower to make it prettier?"'
                                        else if victory = 'value' then
                                                response := '"Hello!" the '+person+' says. "If you give me something valuable, I can help you get out of this house!"'
                                        else if victory = 'rain' then
                                                response := '"Hi there! It looks like it might rain," the '+person+' says. "But I need to go outside. Do you have anything to keep me dry?"';
                                        talkCycle := 2;
                                        end

                                else if talkCycle = 2 then
                                        begin
                                        if victory = 'fun' then
                                                response := '"I''d really like something to entertain myself with," the '+person+' says.'
                                        else if victory = 'eat' then
                                                response := '"Really, I''m very hungry," the '+person+' says.'
                                        else if victory = 'flower' then
                                                response := '"Such a dingy room," the '+person+' says. "A flower would really brighten it up."'
                                        else if victory = 'value' then
                                                response := '"The more valuable, the better!" the '+person+' says.'
                                        else if victory = 'rain' then
                                                response := '"I do hate getting wet," the '+person+' says.';
                                        talkCycle := 3;
                                        end

                                else if talkCycle = 3 then
                                        begin
                                        if (random(2)) = 1 then
                                                response := 'You and the ' + person + ' ' + talkverb1[random(3)] + ' ' + conversation3a[random(8)] + '.'
                                        else
                                                response := 'You and the ' + person + ' ' + talkverb1[random(3)] + ' ' + conversation3b[random(10)] + '.';
                                        talkcycle := 4;
                                        end

                                else
                                        begin
                                        if (random(2)) =1 then
                                                response := 'You and the ' + person + ' ' + talkverb2[random(3)] + ' ' + conversation4a[random(7)] + '.'
                                        else
                                                response := 'You and the ' + person + ' ' + talkverb2[random(3)] + ' ' + conversation4a[random(7)] + '.';
                                        talkCycle := 2;
                                        end

                        else if (lowercase(word3)) = person then
                                response := 'You don''t see the ' + person + ' here.'

                        else if (ArrayContains(personlist,lowercase(word3))) then
                                response := 'You can only talk to people you can see. Usually.'

                        else if (lowercase(word3) = thingsInRooms[playerx,playery]) or (ArrayContains(playerInventory,lowercase(word3))) then
                                response := 'You try but fail to engage the ' + lowercase(word3) + ' in conversation.'

                        else if (word3 = 'SHERIFF') then
                                response := 'You can only talk to people you can see. Usually.'

                        else
                                response := 'I don''t understand "' + word3 + '" as someone you can talk to.'

                else if (word1 = 'ASK') or (word1 = 'TELL') or (word1 = 'SAY') then
                        response := 'Try TALK TO [x] instead.'

                else if (word1 = 'PUT') or (word1 = 'PLACE') or (word1 = 'SET') then
                        response := 'Try PUT [x] ON/IN [y] instead.'

                else if (word1 = 'GIVE') or (word1 = 'SHOW') then
                        if (lowercase(word2) = person) and (ArrayContains(playerInventory,lowercase(word3))) then
                                begin
                                words := 4;
                                word4 := word2;
                                word2 := word3;
                                word3 := 'TO';
                                end
                        else
                                response := 'Try GIVE [x] TO [y] instead.'

                else if (word1 = 'LISTEN') then
                        if (pos('hear',roomDescription[playerx,playery]) <> 0 ) then
                                response := 'Listening again, you no longer hear anything. Maybe you''re imagining things.'
                        else
                                response := 'You only hear your breathing.'

                else if (ArrayContains(commandList,lowercase(word1))) then
                        response := '"' + word1 + '" does not work with three words.'

                else if (ArrayContains(playerInventory,lowercase(word1))) or (ArrayContains(thingsInRooms[playerx,playery],lowercase(word1))) then
                        response := 'I don''t understand "'+word1+'" as a verb.'

                else if (ArrayContains(scenerylist,lowercase(word1))) or (ArrayContains(scenerylist2,lowercase(word1))) then
                        response := 'I don''t understand "'+word1+'" as a verb.'

                else
                        response := 'I don''t understand "'+word1+'".';

        if words = 4 then
                if (word1 = 'GIVE') or (word1 = 'SHOW') then
                        if (ArrayContains(playerInventory,lowercase(word2))) then
                        if (lowercase(word4) = thingsinRooms[playerx][playery]) and (lowercase(word4) = person) then
                                if (victory = 'fun') and (ArrayContains(funlist,lowercase(word2))) then
                                        begin
                                        response := 'The '+person+' seems to like the '+lowercase(word2)+'! "Thank you," '+pronounLower+' says. "Let''s enjoy this '+lowercase(word2)+' together!"';
                                        gameResult := 'win';
                                        end
                                else if (victory = 'eat') and (ArrayContains(eatlist,lowercase(word2))) then
                                        begin
                                        response := 'The '+person+' devours the '+lowercase(word2)+'. "Thank you, friend," '+pronounLower+' says. "You''ve made a hungry '+person+' very happy."';
                                        gameResult := 'win';
                                        end
                                else if (victory = 'flower') and (ArrayContains(flowerlist,lowercase(word2))) then
                                        begin
                                        response := 'The '+person+' sets the '+lowercase(word2)+' on a windowsill. "So much better," '+pronounLower+' says. "Let us enjoy this house together."';
                                        gameResult := 'win';
                                        end
                                else if (victory = 'value') and (ArrayContains(valuelist,lowercase(word2))) then
                                        begin
                                        response := 'The '+person+' takes the '+lowercase(word2)+'. "You have made me rich today, friend," '+pronounLower+' says. "But it is you who has the richest soul."';
                                        gameResult:= 'win';
                                        end
                                else if (victory = 'rain') and (ArrayContains(rainlist,lowercase(word2))) then
                                        begin
                                        response := 'Suddenly, you notice it''s pouring. You give the '+lowercase(word2)+' to the '+person+' and '+pronounLower+' leaves. You''re content, knowing '+pronounLower+'''ll be dry.';
                                        gameResult := 'win';
                                        end
                                else
                                        begin
                                        response := '"Why would you ever think I would want a '+lowercase(word2)+'?" the '+person+' says angrily, then proceeds to murder you murderously.';
                                        gameResult := 'lose';
                                        end

                        else if lowercase(word4) = person then
                                response := 'You don''t see the '+person+' here.'

                        else if ArrayContains(personlist,lowercase(word4)) then
                                response := 'You can only give things to people you can see.'

                        else if (gameType = 'place') and (ArrayContains(playerInventory,lowercase(word2))) and (lowercase(word4) = place) then
                                response := 'Try PUT '+word2+' IN/ON '+word4+' instead.'

                        else
                                response := 'I don''t understand "'+word4+'" as someone you can give something to.'

                        else if ArrayContains(thinglist2,lowercase(word2)) then
                                response := 'You can''t give that to someone because you don''t have it.'

                        else if (ArrayContains(scenerylist,lowercase(word2))) or (ArrayContains(scenerylist2,lowercase(word2))) then
                                if (ArrayContains(scenerylist,lowercase(word4))) or (ArrayContains(scenerylist2,lowercase(word4))) or (ArrayContains(playerInventory,lowercase(word4))) then
                                        response := 'I don''t understand "'+word4+'" as someone you can give something to.'
                                else
                                        response := 'I don''t understand "'+word4+'".'

                        else if (lowercase(word2) = person) and (ArrayContains(playerInventory,lowercase(word4))) then
                                response := 'Try GIVE ' + word4 + ' TO ' + word2 + ' instead.'

                        else if (lowercase(word2) = person) then
                                response := 'Try GIVE [x] TO ' + word2 + ' instead.'

                        else
                                response := 'I don''t understand "'+word2+'".'

                else if (word1 = 'PUT') or (word1 = 'PLACE') or (word1 = 'SET') then
                        if (ArrayContains(playerInventory,lowercase(word2))) then
                                if ((lowercase(word4)) = thingsInRooms[playerx,playery]) and (lowercase(word4) = place) then
                                        if (lowercase(word2) = victoryItem) then
                                                begin
                                                if (place = 'box') or (place = 'chest') then
                                                        response := 'You put the '+victoryItem+' in the '+place+'.'
                                                else
                                                        response := 'You put the '+victoryItem+' on the '+place+'.';
                                                response := response+' '+placewin1[random(3)] +' Outside, you see '+placewin2[random(3)]+'. Now the house isn''t '+placewin3[random(3)]+'!';
                                                gameResult := 'win';
                                                end
                                        else
                                                begin
                                                if (place = 'box') or (place = 'chest') then
                                                        word3 := 'in'
                                                else
                                                        word3 := 'on';
                                                response := 'You put the '+lowercase(word2)+' '+word3+' the '+place+'.';
                                                response := response + ' Suddenly, a '+placelose1[random(3)]+' voice '+placelose2[random(3)];
                                                response := response +': "You have desecrated this house! I will make it '+placelose3[random(3)]+'! You will die!"';
                                                response := response +' Then it does. And you do.';
                                                gameResult := 'lose';
                                                end


                                else if ((ArrayContains(scenerylist,lowercase(word4))) or (ArrayContains(scenerylist2,lowercase(word4)))) then
                                        response := 'You can''t put that there.'

                                else if ((lowercase(word4) = place) and (thingsInRooms[playerx,playery] <> place)) then
                                        response := 'You don''t see the '+place+' here.'

                                else if (ArrayContains(placelist,lowercase(word4))) then
                                        response := 'You haven''t seen a '+lowercase(word4)+' in this house.'

                                else if (ArrayContains(thinglist2,lowercase(word4))) then
                                        response := 'You can''t put those two things together.'

                                else if (ArrayContains(personlist,lowercase(word4))) then
                                         response := 'Try GIVE [x] TO [y] instead.'

                                else
                                        response := 'I don''t understand "'+word4+'".'

                        else if ((ArrayContains(scenerylist,lowercase(word2))) or (ArrayContains(scenerylist2,lowercase(word2)))) then
                                response := 'You can''t put that anywhere.'

                        else if ArrayContains(thinglist2,lowercase(word2)) then
                                response := 'You don''t have the '+lowercase(word2)+', so you can''t put it anywhere.'

                        else if not ((ArrayContains(thinglist2,lowercase(word2))) or (ArrayContains(scenerylist2,lowercase(word2))) or (ArrayContains(scenerylist,lowercase(word2)))) then
                                response := 'I don''t understand "'+word2+'".'

                        else if (lowercase(word4) = place) then
                                response := 'You don''t see the '+place+' here.'

                        else if (lowercase(word2) = thingsInRooms[x,y]) and (ArrayContains(playerInventory,lowercase(word4))) then
                                response := 'You can''t put those two things together.'

                        else if (lowercase(word4) = thingsInRooms[x,y]) and (ArrayContains(playerInventory,lowercase(word2))) then
                                response := 'You can''t put those two things together.'

                        else
                                response := 'I don''t understand "'+word2+'" as something you could put somewhere.'

                else if (word1 = 'ASK') or (word1 = 'TELL') or (word1 = 'SAY') then
                        response := 'Try TALK TO [x] instead.'

                else if ArrayContains(commandList,lowercase(word1)) then
                        response := '"'+word1+'" is a command requiring less than four words.'

                else
                        response := 'I don''t understand "'+word1+'".';

        if words = 5 then
                response := 'Please type a command of four words or fewer.';

        if (word1 <> 'Q') and (word1 <> 'QUIT') and (word1 <> 'EXIT') and (word1 <> 'RESTART') and (word1 <> 'HELP') then
                begin
                printNice(response);
                if response2 <> '' then
                        begin
                        writeln(response2);
                        response2 := '';
                        end
                end
        else if (word1 = 'Q') or (word1 = 'QUIT') or (word1 = 'EXIT') then
                begin
                textcolor(14);
                writeln;
                writeln('Do you really want to quit (Y/N)?');
                keyPress := '~';
                while (keyPress <> 'Y') and (keyPress <> 'y') and (keyPress <> 'N') and (keyPress <> 'n') do
                keyPress := readkey;
                if (keyPress = 'Y') or (keyPress = 'y') then
                        begin
                        textcolor(7);
                        writeln;
                        writeln('Press any key to exit INFINITE ADVENTURE.');
                        keyPress := readKey;
                        end
                else
                        begin
                        textcolor(7);
                        writeln;
                        writeln('Ok. Press any key to continue. Let''s keep infinitely adventuring!');
                        keyPress := readKey;
                        word1 := 'null';
                        end
                end
        else if (word1 = 'HELP') then
                begin
                writeInfiniteHelp;
                description := roomDescribe();
                initialDisplay;
                end
        else if (word1 = 'RESTART') then
                begin
                textcolor(14);
                writeln;
                writeln('Do you really want to restart (Y/N)?');
                keyPress := '~';
                while (keyPress <> 'Y') and (keyPress <> 'y') and (keyPress <> 'N') and (keyPress <> 'n') do
                keyPress := readkey;
                if (keyPress = 'Y') or (keyPress = 'y') then
                        begin
                        textcolor(7);
                        writeln;
                        writeln('Press any key to restart.');
                        keyPress := readKey;
                        end
                else
                        begin
                        textcolor(7);
                        writeln;
                        writeln('Ok. Press any key to continue. Let''s keep infinitely adventuring!');
                        keyPress := readKey;
                        word1 := 'null';
                        end
                end;

        writeln;

end;

procedure processEnd;

begin

        writeln;
        if gameResult = 'win' then
                begin
                textcolor(26);
                writeln ('*** You win! ***');
                writeln;
                wins := wins + 1;
                end
        else
                begin
                textcolor(28);
                writeln ('*** You lose! ***');
                writeln;
                losses := losses + 1;
                end;
        if wins = 1 then
                word1 := 'win'
        else
                word1 := 'wins';
        if losses = 1 then
                word2 := 'loss'
        else
                word2 := 'losses';
        if games = 1 then
                response := 'game'
        else
                response := 'games';
        textcolor(7);
        str(games,tempString);
        str(wins,word3);
        str(losses,word4);
        writeln;
        writeln ('Out of '+tempString+' '+response+', there have been '+word3+' '+word1+' and '+word4+' '+word2+'.');
        writeln;
        games := games + 1;
        textcolor(11);
        writeln('Do you want to play again (Y/N)?');
        keyPress := '~';
        while (keyPress <> 'Y') and (keyPress <> 'y') and (keyPress <> 'N') and (keyPress <> 'n') do
                keyPress := readkey;
        writeln;
        if (keyPress = 'Y') or (keyPress = 'y') then
                begin
                flavorText := false;
                textcolor(7);
                writeln;
                writeln('Press any key to begin your next adventure!');
                keyPress := readKey;
                gameResult := 'again';
                end
        else
                begin
                textcolor(7);
                writeln;
                writeln('Press any key to exit INFINITE ADVENTURE.');
                keyPress := readKey;
                gameResult := 'quit';
                end;

end;


begin {main program}
        games  := 1;
        losses := 0;
        wins := 0;
        gameType := '';
        flavorText := false;
        randomize;
        start:
        clrscr;
        //textbackground(1);
        //textcolor(14);
        textbackground(0);
        textcolor(7);
        clrscr;
        another:
        //getCommand;
        buildMap;
        assignRooms;
        assignThings;
        assignVictory;
        description := roomDescribe();
        titleDisplay;
        initialDisplay;
        parseLoop:
        getCommand;
        parseCommand;
        if gameResult<>'' then
                processEnd;
        if gameResult = 'again' then
                goto start;
        if gameResult = 'quit' then
                exit;
        if word1 = 'RESTART' then
                goto start;
        if (word1 <> 'Q') and (word1 <> 'QUIT') and (word1 <> 'EXIT') then
                goto parseLoop
        else
                exit;
end.
