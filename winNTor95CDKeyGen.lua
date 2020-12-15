

function Main()

     -- set the loop variable for how many keys to be generatet (if no parameter was handedover 1 is standart)
     if arg[1] == nil then
        Loops = 1;
    else
        Loops = arg[1];
    end

    for i = 1, Loops do
        
        -- if an seed is input than set as starting point for the rand function
        if(arg[2] ~= nil) then
            math.randomseed(arg[2] + i);
        end

		-- generates the first 3 digits
        local first3;
        while true do
            local first = math.random( 0,9 );
            local second = math.random( 0,9 );
            local third = math.random( 0,9 );

            first3 = first .. second .. third;

            local listForbidden = {333,444,555,666,777,888,999}
            local braker = false;
            for key,value in pairs(listForbidden) do
                if value ~= first3 then
                    braker = true;
                    break;
                end
            end
            if braker then
                break;
            end 
        end
        
        local SevenDigitNumber = MakeNumberDeviseBy7();
        
        print(KeyBuilder(first3,SevenDigitNumber));

    end
    
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
        local sixth = math.random( 0,9 );
        local seventh = math.random( 1,7 );

        local sum = first + second + third + fourth + fifth + sixth + seventh;

        if (sum % 7 == 0) then
            numberDiv = (first .. second .. third .. fourth .. fifth .. sixth .. seventh);
            break;
        end
    end
    return numberDiv;
end

function KeyBuilder(first3Digit, last7Digit)
    return ( first3Digit .. " - " .. last7Digit);
end

Main()