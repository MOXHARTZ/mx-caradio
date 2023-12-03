fx_version 'cerulean'
games { 'gta5' }
author 'https://github.com/MOXHARTZ'
repository 'https://github.com/MOXHARTZ/mx-caradio'
version '1.0.5'
lua54 'yes'

shared_script 'config.lua'

client_scripts {
    'client/*.lua'
}
server_scripts {
    'server/*.lua'
}

dependencies {
    'mx-surround',
    'mx-audioplayer'
}
