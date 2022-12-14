local sqlAdatok = {
    ["host"] = "host",
    ["user"] = "felhasznalonev", 
    ["pw"] = "jelszo", 
    ["database"] = "adatbazis neve",
}

function connectToMysql()
    dbHandler = dbConnect( "mysql", "dbname="..sqlAdatok["database"].."; host="..sqlAdatok["host"], sqlAdatok["user"], sqlAdatok["pw"], "autoreconnect=1" )
    if dbHandler then 
        outputDebugString( "mysql -> Sikeres sql kapcsolat!", 3 )
    else 
        outputChatBox( "Mysql kapcsolat sikertelen!", getRootElement(), 255, 255, 255, true )
        cancelEvent()
    end
end 
addEventHandler( "onResourceStart", resourceRoot, connectToMysql )

function getConnection()
    return dbHandler
end 