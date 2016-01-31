CLS
TIMER ON
ON TIMER(1) GOSUB health
REM works in windows QB64 with URL2File only not sure about URL2File in Linux
REM In Linux use a$="wget -O file.txt http://loklak.org/api/search.rss?timezoneOffset=-480&q=youtube"
REM Must have program URL2File on windows to match location with some ascci coding
REM Will incorprate timed load tester with other search varibles later on.

REM File to log speed of peer for complete RSS output.
OPEN "e:\qb\loklak\profile.csv" FOR OUTPUT AS #1

REM String to open to the shell command last on list gets hit.
REM   Drive   :          \        dir      \          dir          \          exe file          "        http         :        /          /         Address and port maybe :  /              search.rss              ?                                &                                         Note the space is needed

REM loklak.org
'a$ = "e" + CHR$(58) + CHR$(92) + "qb" + CHR$(92) + "url2file" + CHR$(92) + "url2file.exe " + CHR$(34) + "http" + CHR$(58) + CHR$(47) + CHR$(47) + "loklak.org" + CHR$(47) + "api" + CHR$(47) + "search.rss" + CHR$(63) + "timezoneOffset=-480" + CHR$(38) + "q" + "=" + "youtube" + CHR$(34) + " youtube.txt"
REM
REM 104.155.233.33
'a$ = "e" + CHR$(58) + CHR$(92) + "qb" + CHR$(92) + "url2file" + CHR$(92) + "url2file.exe " + CHR$(34) + "http" + CHR$(58) + CHR$(47) + CHR$(47) + "104.155.233.33" + CHR$(47) + "api" + CHR$(47) + "search.rss" + CHR$(63) + CHR$(38) + "q" + "=" + "youtube" + CHR$(34) + " loklak.txt"
REM loklak.net:3001
'a$ = "e" + CHR$(58) + CHR$(92) + "qb" + CHR$(92) + "url2file" + CHR$(92) + "url2file.exe " + CHR$(34) + "http" + CHR$(58) + CHR$(47) + CHR$(47) + "loklak.net" + CHR$(58) + "3001 " + "youtube.html"
REM 104.197.59.22
'a$ = "e" + CHR$(58) + CHR$(92) + "qb" + CHR$(92) + "url2file" + CHR$(92) + "url2file.exe " + CHR$(34) + "http" + CHR$(58) + CHR$(47) + CHR$(47) + "104.197.59.22" + CHR$(47) + "api" + CHR$(47) + "search.rss" + CHR$(63) + CHR$(38) + "q" + "=" + "youtube" + CHR$(34) + " loklak.txt"
REM 54.169.313.205
'a$ = "e" + CHR$(58) + CHR$(92) + "qb" + CHR$(92) + "url2file" + CHR$(92) + "url2file.exe " + CHR$(34) + "http" + CHR$(58) + CHR$(47) + CHR$(47) + "54.169.313.205" + CHR$(47) + "api" + CHR$(47) + "search.rss" + CHR$(63) + CHR$(38) + "q" + "=" + "youtube" + CHR$(34) + " loklak.txt"
REM 54.201.89.229
'a$ = "e" + CHR$(58) + CHR$(92) + "qb" + CHR$(92) + "url2file" + CHR$(92) + "url2file.exe " + CHR$(34) + "http" + CHR$(58) + CHR$(47) + CHR$(47) + "54.201.89.229" + CHR$(47) + "api" + CHR$(47) + "search.rss" + CHR$(63) + CHR$(38) + "q" + "=" + "youtube" + CHR$(34) + " loklak.txt"
REM 54.169.241.66
'a$ = "e" + CHR$(58) + CHR$(92) + "qb" + CHR$(92) + "url2file" + CHR$(92) + "url2file.exe " + CHR$(34) + "http" + CHR$(58) + CHR$(47) + CHR$(47) + "54.169.241.66" + CHR$(47) + "api" + CHR$(47) + "search.rss" + CHR$(63) + CHR$(38) + "q" + "=" + "youtube" + CHR$(34) + " loklak.txt"
REM 130.211.252.124
'a$ = "e" + CHR$(58) + CHR$(92) + "qb" + CHR$(92) + "url2file" + CHR$(92) + "url2file.exe " + CHR$(34) + "http" + CHR$(58) + CHR$(47) + CHR$(47) + "130.211.252.124" + CHR$(47) + "api" + CHR$(47) + "search.rss" + CHR$(63) + CHR$(38) + "q" + "=" + "youtube" + CHR$(34) + " loklak.txt"
REM 45.32.64.207  lok.mnsnet.ca
'a$ = "e" + CHR$(58) + CHR$(92) + "qb" + CHR$(92) + "url2file" + CHR$(92) + "url2file.exe " + CHR$(34) + "http" + CHR$(58) + CHR$(47) + CHR$(47) + "45.32.64.207:9000" + CHR$(47) + "api" + CHR$(47) + "search.rss" + CHR$(63) + CHR$(38) + "q" + "=" + "youtube" + CHR$(34) + " loklak.txt"
REM quad core LAN
a$ = "e" + CHR$(58) + CHR$(92) + "qb" + CHR$(92) + "url2file" + CHR$(92) + "url2file.exe " + CHR$(34) + "http" + CHR$(58) + CHR$(47) + CHR$(47) + "192.168.2.50:9001" + CHR$(47) + "api" + CHR$(47) + "search.rss" + CHR$(63) + CHR$(38) + "q" + "=" + "youtube" + CHR$(34) + " loklak.txt"



'PRINT LEN(a$)
index# = 0
starttime# = TIMER
PRINT " The URL I am using  "; a$
PRINT " Please leave running for 150 records min."
INPUT " Ping time to host Average mS 250 default"; a#
IF a# = 0 THEN a# = 250
ping# = a# / 1000


DO UNTIL INKEY$ = CHR$(27)

    eltime# = TIMER
    
    REM rollover midnight
    IF eltime# < 0 THEN starttime# = TIMER
    REM you can increase the + 1 if you like
    IF eltime# > starttime# + 1 THEN
        IF INKEY$ = CHR$(27) THEN GOTO shutdown
        starttime# = TIMER
        '    PRINT a$
        SHELL _HIDE a$
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
PRINT " Average time         "; tottime# / index#; "          "
PRINT " Number of records    "; index#; "        "
PRINT
PRINT " config.properties Settings Guessing only"
PRINT
PRINT " Using ping of "; ping#; "seconds"; "       "
PRINT " DoS.blackout         "; INT(((tottime# / index#) + .8 - ping#) * 100); "         "
PRINT " DoS.servicereduction "; INT(((tottime# / index#) + .8 - ping#) * 1000); "         "
RETURN


shutdown:
END



