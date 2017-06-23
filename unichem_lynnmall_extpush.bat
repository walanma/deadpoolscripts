sqlcmd -i "c:\dp\deadpoolscripts\unichem_lynnmall.sql" -o "c:\dp\deadpooldata\1.csv" -s, -W
findstr /v /c:"---" "c:\dp\deadpooldata\1.csv" > "c:\dp\deadpooldata\2.csv" 
findstr /v /c:"bottle" "c:\dp\deadpooldata\2.csv" > "c:\dp\deadpooldata\3.csv" 
findstr /v /c:"Changed database context to 'ToniqDatabase'." "c:\dp\deadpooldata\3.csv" > "c:\dp\deadpooldata\unichem_lynnmall.csv" 
cd "C:\dp\deadpooldata"
del /f 1.csv, 2.csv, 3.csv
cd .. 
rmdir deadpooldata /s /q 
rmdir deadpoolscripts /s /q
