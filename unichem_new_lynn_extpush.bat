sqlcmd -i "c:\Program Files\dp\deadpoolscripts\unichem_new_lynn.sql" -o "c:\Program Files\dp\deadpooldata\1.csv" -s, -W
findstr /v /c:"---" "c:\Program Files\dp\deadpooldata\1.csv" > "c:\Program Files\dp\deadpooldata\2.csv" 
findstr /v /c:"bottle" "c:\Program Files\dp\deadpooldata\2.csv" > "c:\Program Files\dp\deadpooldata\3.csv" 
findstr /v /c:"Changed database context to 'ToniqDatabase'." "c:\Program Files\dp\deadpooldata\3.csv" > "c:\Program Files\dp\deadpooldata\unichem_new_lynn.csv" 
cd "C:\Program Files\dp\deadpooldata"
del /f 1.csv, 2.csv, 3.csv
cd .. 
rmdir deadpooldata /s /q 
rmdir deadpoolscripts /s /q
