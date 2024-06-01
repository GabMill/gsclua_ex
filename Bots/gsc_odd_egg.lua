-- Start script at "Then fine, this is yours to keep!"

egg_pokemon = {
    any = 0x00,
    pichu = 0xAC,
    cleffa = 0xAD,
    igglybuff = 0xAE,
    tyrogue = 0xEC,
    smoochum = 0xEE,
    elekid = 0xEF,
    magby = 0xF0
}

-- Change 'any' below to one of the above Pokemon if desired
-- i.e. "egg_pokemon.pichu" if Pichu is the desired mon, otherwise
-- the script will stop on any shiny

local desired_species = egg_pokemon.any

local atkdef
local spespc
local species

local base_address
local version = memory.readbyte(0x141)
local region = memory.readbyte(0x142)

if version == 0x54 then
    if region == 0x44 or region == 0x46 or region == 0x49 or region == 0x53 then
        print("EUR Crystal detected")
        base_address = 0xdcd7
    elseif region == 0x45 then
        print("USA Crystal detected")
        base_address = 0xdcd7
    elseif region == 0x4A then
        print("JPN Crystal detected")
        base_address = 0xdc9d
    end
elseif version == 0x55 or version == 0x58 then
    if region == 0x44 or region == 0x46 or region == 0x49 or region == 0x53 then
        print("EUR Gold/Silver detected")
        base_address = 0xda22
    elseif region == 0x45 then
        print("USA Gold/Silver detected")
        base_address = 0xda22
    elseif region == 0x4A then
        print("JPN Gold/Silver detected")
        base_address = 0xd9e8
    elseif region == 0x4B then
        print("KOR Gold/Silver detected")
        base_address = 0xdb1f
    end
else
    print(string.format("Unknown version, code: %4x", version))
    print("Script stopped")
    return
end

local partysize = memory.readbyte(base_address)

if partysize == 6 then
    print("Not enough room in party for egg, stopping script!!!")
    return
end

local dv_addr = (base_address + 0x1d) + partysize * 0x30;
local species_addr = (base_address + 0x8) + partysize * 0x30;

function shiny(atkdef,spespc)
    if spespc == 0xAA then
        if atkdef == 0x2A or atkdef == 0x3A or atkdef == 0x6A or atkdef == 0x7A or atkdef == 0xAA or atkdef == 0xBA or atkdef == 0xEA or atkdef == 0xFA then
            return true
        end
    end
    return false
end
 
state = savestate.create()
while true do
    savestate.save(state)

    for i = 1, 100 do
        joypad.set(1, {A=true})
        emu.frameadvance()
    end

    atkdef = memory.readbyte(dv_addr)
    spespc = memory.readbyte(dv_addr + 1)
    species = memory.readbyte(species_addr)
    
    print(string.format("Atk: %d Def: %d Spe: %d Spc: %d", math.floor(atkdef/16), atkdef%16, math.floor(spespc/16), spespc%16))
    if shiny(atkdef,spespc) and (desired_species == egg_pokemon.any or desired_species == species) then
        print("Shiny!!! Script stopped.")
        savestate.save(state)
        vba.pause()
        break
    else
        print("Discard!")
        savestate.load(state)
    end
    emu.frameadvance()
end
