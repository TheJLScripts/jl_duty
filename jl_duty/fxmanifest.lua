fx_version 'cerulean'
game 'gta5'

author 'JLScripts'
description 'Job Duty'
version '1.0.1'

shared_scripts {
    '@es_extended/imports.lua', 
    'shared/config.lua'

}
client_script 'client/client.lua'
server_script 'server/server.lua'

dependencies {
    "es_extended",
    "ox_target"
}
