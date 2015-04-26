CLS
TIMER ON
ON TIMER(1) GOSUB health
REM works in windows QB64 with URL2File only not sure about URL2File in Linux
REM Must have program URL2File on windows
REM Will incorprate timed load tester with other search varibles later on.  

REM File to log speed of peer for complete RSS output.
OPEN "c:\qb\loklak\speed.csv" FOR OUTPUT AS #1

REM String to open to the shell command last on list gets hit.
REM   Drive   :          \        dir      \          dir          \          exe file          "        http         :        /          /         Address and port maybe :  /              /          search
'swlok.mooo
'a$ = "c" + CHR$(58) + CHR$(92) + "qb" + CHR$(92) + "url2file" + CHR$(92) + "url2file.exe " + CHR$(34) + "http" + CHR$(58) + CHR$(47) + CHR$(47) + "swlok.mooo.com" + CHR$(47) + "api" + CHR$(47) + "search.rss" + CHR$(63) + "timezoneOffset=-480" + CHR$(38) + "q" + "=" + "youtube" + CHR$(34) + " loklak" + "youtube" + ".txt"
REM swlok1.mooo
'a$ = "c" + CHR$(58) + CHR$(92) + "qb" + CHR$(92) + "url2file" + CHR$(92) + "url2file.exe " + CHR$(34) + "http" + CHR$(58) + CHR$(47) + CHR$(47) + "swlok1.mooo.com" + CHR$(47) + "api" + CHR$(47) + "search.rss" + CHR$(63) + "timezoneOffset=-480" + CHR$(38) + "q" + "=" + "youtube" + CHR$(34) + " loklak" + "youtube" + ".txt"
REM swlok2.mooo
a$ = "c" + CHR$(58) + CHR$(92) + "qb" + CHR$(92) + "url2file" + CHR$(92) + "url2file.exe " + CHR$(34) + "http" + CHR$(58) + CHR$(47) + CHR$(47) + "swlok2.mooo.com" + CHR$(47) + "api" + CHR$(47) + "search.rss" + CHR$(63) + "timezoneOffset=-480" + CHR$(38) + "q" + "=" + "youtube" + CHR$(34) + " loklak" + "youtube" + ".txt"
REM swlok3.mooo
'a$ = "c" + CHR$(58) + CHR$(92) + "qb" + CHR$(92) + "url2file" + CHR$(92) + "url2file.exe " + CHR$(34) + "http" + CHR$(58) + CHR$(47) + CHR$(47) + "swlok3.mooo.com" + CHR$(47) + "api" + CHR$(47) + "search.rss" + CHR$(63) + "timezoneOffset=-480" + CHR$(38) + "q" + "=" + "youtube" + CHR$(34) + " loklak" + "youtube" + ".txt"
REM swlok4.mooo
a$ = "c" + CHR$(58) + CHR$(92) + "qb" + CHR$(92) + "url2file" + CHR$(92) + "url2file.exe " + CHR$(34) + "http" + CHR$(58) + CHR$(47) + CHR$(47) + "swlok4.mooo.com" + CHR$(47) + "api" + CHR$(47) + "search.rss" + CHR$(63) + "timezoneOffset=-480" + CHR$(38) + "q" + "=" + "youtube" + CHR$(34) + " loklak" + "youtube" + ".txt"

REM holycow
'a$ = "c" + CHR$(58) + CHR$(92) + "qb" + CHR$(92) + "url2file" + CHR$(92) + "url2file.exe " + CHR$(34) + "http" + CHR$(58) + CHR$(47) + CHR$(47) + "holycow.allesehersonerdshier.net" + CHR$(47) + "api" + CHR$(47) + "search.rss" + CHR$(63) + "timezoneOffset=-480" + CHR$(38) + "q" + "=" + "youtube" + CHR$(34) + " loklak" + "youtube" + ".txt"
REM smokingwheels.mooo
'a$ = "c" + CHR$(58) + CHR$(92) + "qb" + CHR$(92) + "url2file" + CHR$(92) + "url2file.exe " + CHR$(34) + "http" + CHR$(58) + CHR$(47) + CHR$(47) + "smokingwheels.mooo.com" + CHR$(58) + "9100" + CHR$(47) + "api" + CHR$(47) + "search.rss" + CHR$(63) + "timezoneOffset=-480" + CHR$(38) + "q" + "=" + "youtube" + CHR$(34) + " loklak" + "youtube" + ".txt"
REM loklak.org:9100
'a$ = "c" + CHR$(58) + CHR$(92) + "qb" + CHR$(92) + "url2file" + CHR$(92) + "url2file.exe " + CHR$(34) + "http" + CHR$(58) + CHR$(47) + CHR$(47) + "loklak.org" + CHR$(58) + "9100" + CHR$(47) + "api" + CHR$(47) + "search.rss" + CHR$(63) + "timezoneOffset=-480" + CHR$(38) + "q" + "=" + "youtube" + CHR$(34) + " loklak" + "youtube" + ".txt"
REM loklak.org
'a$ = "c" + CHR$(58) + CHR$(92) + "qb" + CHR$(92) + "url2file" + CHR$(92) + "url2file.exe " + CHR$(34) + "http" + CHR$(58) + CHR$(47) + CHR$(47) + "loklak.org" + CHR$(47) + "api" + CHR$(47) + "search.rss" + CHR$(63) + "timezoneOffset=-480" + CHR$(38) + "q" + "=" + "youtube" + CHR$(34) + " loklak" + "youtube" + ".txt"



'PRINT LEN(a$)
index# = 0
starttime# = TIMER
PRINT " The URL I am using  "; a$

DO UNTIL INKEY$ = CHR$(27)

    eltime# = TIMER
    REM the + 10 is every 10 seconds to hit the loklak server if slower of faster adjust to suit

    REM rollover midnight
    IF eltime# < 0 THEN starttime# = TIMER
    IF eltime# > starttime# + 10 THEN
        IF INKEY$ = CHR$(27) THEN GOTO shutdown
        starttime# = TIMER

        SHELL a$
        IF INKEY$ = CHR$(27) THEN GOTO shutdown
        index# = index# + 1
        WRITE #1, index#, TIMER - eltime#, tottime# / index#
        tottime# = tottime# + (TIMER - eltime#)
        LOCATE 5, 1
        PRINT " Resquest current completed in "; TIMER - eltime#; "          "
    END IF

    REM Remove REM to see whats going on and watch the clock
    REM    PRINT index#, eltime# - starttime#

LOOP

END


health:
LOCATE 7, 1
PRINT " Average time "; tottime# / index#; "          "
PRINT " Number of records "; index#; "        "
RETURN


shutdown:
END



