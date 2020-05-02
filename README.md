# vrp_save
by oMarkez#6666

Video - https://streamable.com/frfk38

[DK]
vrp_save er en resource som giver dig mulighed for at gemme alle spillers data i vRP gennem /gem. Dette vil formindske rollback når serveren f.eks genstartes. Spillere kan også selv manuelt gemme deres data.

BRUG:
/gem - Gemmer kun data for den person, der skriver kommandoen. Kan kun bruges hvert 30 sekund for folk ikke spammer SQL queries.

/gemalle [timer] - Kræver en permission, som angives i config.lua. Denne kommando gemmer alle online spillers data. [timer] kan bruges til at udskyde dette data gem, i sekunder. F.eks: /gemalle 20, udskyder det med 20 sekunder.

[EN]
vrp_save is a resource that gives you the option to save all currently online player's data with a specified command. This minimizes rollback when for example restarting the server. Players can also manually save their data.

Usage:
/config.command - Only saves data for the specific player, that executes the command. Can only be used every 30 second so people don't spam SQL queries

/config.commandall [timer] - Saves all currently connected player's data, and requires a permission [config.permall]. [timer] can be used to postpone the save, in seconds. For example: [config.commandall] 20, will postpone the save with 20 seconds.

Edit config.command & config.commandall in the config.lua file, that is currently in danish.
