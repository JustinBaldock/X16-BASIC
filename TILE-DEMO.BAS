1 REM TILE AND TILE MOVEMENT DEMO
2 REM BY JUSTIN BALDOCK

10 REM VARIABLES
11 REM I AM USING 64 X 64 TILES, EACH 16X16. SO WE HAVE 1024 PIXELS EAC WAY
11 REM TH = TILE MAP HORIZONAL LOCATION 0-1023
12 REM TV = TILE MAP VERTICAL LOCATION 0-1023
13 REM HH AND HL = HORIZONAL HIGH (ABOVE 256) AND LOW (UNDER 256)
14 REM VH AND VL = VERTICAL HIGH AND LOW

90 SCREEN $00
100 GOSUB 10000: REM SETUP TILES
110 GOSUB 20000: REM SETUP TILE MAP
120 GOSUB 30000: REM DISPLAY
130 GOSUB 400: REM THE MAIN LOOP

400 REM RUN LOOP
401 LET TH=0: TV=0
402 LET HH=0: HL=0: VH=0: VL=0
403 LET MV=2: REM OUR MOVEMENT SPEED
410 GET K$: REM READ IN KEYPRESSES
420 IF K$="A" THEN GOSUB 1000: REM MOVE LEFT
440 IF K$="D" THEN GOSUB 1100: REM MOVE RIGHT
450 IF K$="W" THEN GOSUB 1300: REM MOVE UP
460 IF K$="S" THEN GOSUB 1400: REM MOVE DOWN
490 IF K$="Q" THEN END
500 GOTO 410

1000 REM MOVE VIEW LEFT
1010 IF TH = 0 THEN RETURN
1020 TH=TH-MV
1030 GOSUB 1200: REM CALULATE 8BIT 
1040 GOSUB 1800: REM UPDATE SCROLL 
1050 RETURN

1100 REM MOVE VIEW RIGHT
1110 IF TH = 704 THEN RETURN: REM 1024-320
1120 TH=TH+MV
1130 GOSUB 1200: REM CALULATE 8BIT 
1140 GOSUB 1800: REM UPDATE SCROLL 
1150 RETURN 

1200 REM CALULCATE HORITZONAL HIGH AND LOW VALUES TO POKE IN TO LAYER SCROLL
1210 HH = INT(TH / 255)
1220 HL = TH - (HH * 255)
1230 RETURN

1300 REM MOVE UP
1310 IF TV = 0 THEN RETURN
1320 TV=TV-MV
1330 GOSUB 1500: REM CALULATE 8BIT
1340 GOSUB 1800: REM UPDATE SCROLL
1350 RETURN

1400 REM MOVE DOWN
1410 IF TV = 768 THEN RETURN: REM 1024-240
1420 TV=TV+MV
1430 GOSUB 1500: REM CALULATE 8BIT
1440 GOSUB 1800: REM UPDATE SCROLL
1450 RETURN

1500 REM CALULCATE VERTICAL HIGH AND LOW VALUES TO POKE IN TO LAYER SCROLL
1510 VH = INT(TV / 255)
1520 VL = TV - (VH * 255)
1530 RETURN

1800 REM UPDATE VERA FOR NEW LAYER SCROLL
1810 POKE $9F30,HL
1820 POKE $9F31,HH
1830 POKE $9F32,VL 
1840 POKE $9F33,VH
1850 RETURN 

10000 REM SETUP 2 TILES EACH 16 X 8
10010 VLOAD "LANDER-TILES.BIN",8,0,$4000
10020 RETURN

20000 REM SETUP A TILE MAP
20020 VLOAD "LANDER-MAP.BIN",8,0,$9000
20030 RETURN

30000 REM CONFIGURE LAYER 0 AND DISPLAY TILES
30010 POKE $9F29, %00110001: REM TURN ON LAYER 0,1 AND VGA OUTPUT
30020 POKE $9F2D, %01010010: REM MAP H X W, T256C, BITMAPE MODE, COLOR DEPTH
30030 POKE $9F2E, %01001000: REM MAP BASE AT $9000
30040 POKE $9F2F, %00100011: REM SET TILE BASE AT $4000 AND H=16 W=16
30050 REM CONFIGURE LAYER 1
30060 COLOR 1,0
30070 CLS
30080 PRINT "MOVE VIEW USING WASD. Q TO QUIT"
30090 RETURN

