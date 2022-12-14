local conn = exports.mysql:getConnection()


function checkHandler()
    if conn then 
        outputDebugString( "whitelist -> sikeres mysql kapcsolat", 3 )
    else
        outputChatBox( "Whitelist -> Nem sikerült csatlakozni a mysqlhez!", getRootElement(), 255, 0, 0, true )
    end
end 
addEventHandler( "onResourceStart", resourceRoot, checkHandler )

function checkSerial( playerNick, playerIP, playerUsername, playerSerial )
    local qh = dbQuery( conn, "SELECT * FROM devserials WHERE serial = ?", playerSerial )
    local result, irow = dbPoll( qh, -1 )
    if irow > 0 then 
        outputChatBox( "[Whitelist] Fejlesztő serial érzékelve, üdv a szerveren!", source, 255, 255, 255, true )
    else 
        cancelEvent( true, "A serialod nincs engedélyezve a szerveren, keresd fel XomoXX-ot!" )
        outputChatBox( "[Whitelist] "..playerNick.." megpróbált felcsatlakozni a szerverre. IP:"..playerIP, getRootElement(), 255, 255, 255, true )
    end 
    end 
    addEventHandler( "onPlayerConnect", getRootElement(), checkSerial )

function addToWhitelist( player, cmd, name, serial )
        if ( name ) and ( serial ) then 
            dbExec( conn, " INSERT INTO whitelist SET username = ?, serial = ?  ", name, serial )
            outputChatBox( "[Whitelist] Sikeresen hozzáadtad "..name.." játékost a whitelisthoz!", getRootElement(), 255, 255, 255, true )
        else 
            outputChatBox( "[Whitelist] Használat: /"..cmd.." [Név] [Serial]", source, 255, 255, 255, true )
        end
    end 
    addCommandHandler( "addserial", addToWhitelist )
    
    
    