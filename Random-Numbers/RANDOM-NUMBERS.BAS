10 DIM AR(999): DIM DE(999)
20 FOR N = 0 TO 999
30 AR(N)= 0 + SQR(-1.3*LOG(RND(1))) * COS(1.2*PI*RND(1))
40 NEXT N
50 :
60 REM SUM
70 LET SU = 0
80 FOR N = 0 TO 999
90 LET SU = SU + AR(N)
100 NEXT N
110 :
120 REM MEAN
130 LET ME= 0
140 LET ME = SU/1000
150 :
160 REM DEVIATION
170 FOR N = 0 TO 999
180 T = AR(N)-ME: REM SUBTRACT MEAN FROM NUMBER
190 T = T * T: REM SQUARE THE RESULT
200 DE(N) = T : REM STORE IN DEVIATION ARRAY
210 NEXT N
220 LET DS=0: REM SUM OF DEVIATION ARRAY
230 FOR N = 0 TO 999
240 LET DS = DS + DE(N)
250 NEXT N
260 LET DM=0: REM MEAN OF DEVIATION ARRAY
270 LET DM = DS / 1000
280 LET DE = 0:
290 LET DE = SQR(DM)
300 :
310 PRINT "MEAN = "ME
320 PRINT "STANDARD DEVIATION ="DE
330 END
