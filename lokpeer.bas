CLS

REM Goto http://loklak.org/api/peers.json copy contents to peers.txt.
REM It Tests port 80 and 9000 for a web server.
REM Run the program then execute the peers.bat and wait for it to finish.
REM A 10 k txt output file is a loklak server. This can be checked by opening file also.
REM Look at output files are numbered eg 807.txt.
REM In peers.bat to find the IP address of the peer just match the file name.
REM The program creates peers.bat and uses windows Url2File
REM You could modify for Linux and use wget -O $filename http:// + $host


PRINT "Loklak Peer Checker"
OPEN "e:\qb\loklak\peers\peers.txt" FOR INPUT AS #1
OPEN "e:\qb\loklak\peers\peers.bat" FOR OUTPUT AS #2

index = 0
DO WHILE NOT EOF(1)
    LINE INPUT #1, a$
    IF MID$(a$, 6, 4) = "host" THEN
        hostlen = LEN(a$)
        host$ = MID$(a$, 15, (hostlen - 1))
        hostlen = LEN(host$)
        host$ = LEFT$(host$, hostlen - 2)
        index = index + 1
        IF host$ = "176.9.120.5" THEN GOTO skiphost
        filename$ = STR$(index) + ".txt"
        filename$ = RIGHT$(filename$, LEN(filename$) - 1)
        REM the old way CSV file WRITE #2, "c:\qb\url2file\url2file.exe" + CHR$(34) + " " + "http://" + host$ + " " + CHR$(34) + "e:\qb\loklak\peers\" + filename$
        PRINT #2, "e:\qb\url2file\url2file.exe " + "http://" + host$ + CHR$(58) + "9000" + " " + CHR$(34) + "e:\qb\loklak\peers\" + "9000" + filename$
        PRINT #2, "e:\qb\url2file\url2file.exe " + "http://" + host$ + CHR$(58) + "80" + " " + CHR$(34) + "e:\qb\loklak\peers\" + "80" + filename$

        skiphost:
    END IF




LOOP
PRINT "Now start peers.bat and wait"

CLOSE #1: CLOSE #2









