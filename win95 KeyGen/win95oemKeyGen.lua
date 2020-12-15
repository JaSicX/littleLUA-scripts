
-- function for generating the key parts an print them out
function main()

    -- set the loop variable for how many keys to be generatet (if no parameter was handedover 1 is standart)
    if arg[1] == nil then
        Loops = 1;
    else
        Loops = arg[1];
    end

    for i = 1, Loops do
        
        -- if an seed is input than set that as starting point for the rand function
        if(arg[2] ~= nil) then
            math.randomseed(arg[2] + i);
        end

        -- generates a randome 3 digit number for the day in a year
        local dayN = math.random( 1,366 );
        local day = tostring(dayN);
        if #day == 1 then
            day = "00" .. day;
        elseif #day == 2 then
            day = "0" .. day;
        end

        -- generation of individual parts of the key
        local year = GenYear();
        local numberDevi7 = MakeNumberDeviseBy7();
        local number5Digit = Make5DigNum();

        local key = KeyBuilder(day,year,numberDevi7,number5Digit);
        print(key);

    end
 end

 -- generates a valid year that consits of 2 digits (valid 95 to 03)
 function GenYear()
    local year;
    local rand = math.random( 5,13 );

    if rand == 5 then
        year = "95";
    elseif rand == 6 then
        year = "96";
    elseif rand == 7 then
        year = "97";
    elseif rand == 8 then
        year = "98";
    elseif rand == 9 then
        year = "99";
    elseif rand == 10 then
        year = "00";
    elseif rand == 11 then
        year = "01";
    elseif rand == 12 then
        year = "02";
    elseif rand == 13 then
        year = "03";
    end
    return year;
 end

 -- generates a 5 digit randome number (last 5 digits)
function Make5DigNum()
    local first = math.random( 0,9 );
    local second = math.random( 0,9 );
    local third = math.random( 0,9 );
    local fourth = math.random( 0,9 );
    local fifth = math.random( 0,9 );
   
    return (first .. second .. third .. fourth .. fifth);
end

-- makes an 6 digit randome number that is deviseable by 7
function MakeNumberDeviseBy7()
    local numberDiv;
    while true do
        local first = math.random( 0,9 );
        local second = math.random( 0,9 );
        local third = math.random( 0,9 );
        local fourth = math.random( 0,9 );
        local fifth = math.random( 0,9 );
        local sixth = math.random( 1,7 );

        local sum = first + second + third + fourth + fifth + sixth;

        if (sum % 7 == 0) then
            numberDiv = (first .. second .. third .. fourth .. fifth .. sixth);
            break;
        end
    end
    return numberDiv;
end

-- builds the key thogether out of the individual parts an makes it into an pretty form
function KeyBuilder(day,year,numberDeviseable7,number5Digits)
    local key = (day .. year .. " - OEM - 0" .. numberDeviseable7 .. " - " .. number5Digits);
    return key;
end

-- call main function
main()