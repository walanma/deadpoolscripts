sqlcmd -i c:\dp\deadpoolscripts\dp.sql -o c:\dp\deadpooldata\1.csv -s, -W
findstr /v /c:"---" c:\dp\deadpooldata\1.csv > c:\dp\deadpooldata\2.csv 
findstr /v /c:"bottle" c:\dp\deadpooldata\2.csv > c:\dp\deadpooldata\3.csv 
findstr /v /c:"Changed database context to 'ToniqDatabase'." c:\dp\deadpooldata\3.csv > c:\dp\deadpooldata\x.csv 
cd C:\dp\deadpooldata
del /f 1.csv, 2.csv, 3.csv
git config --global user.email "deadpooldata@gmail.com"
git config --global user.name "deadpooldata"
git config --global credential.helper store
git init
git remote add origin git@github.com:watermelonma/deadpooldata.git
git checkout master
git add .
git commit -am "Daily update"
git push -u origin master 
cd .. 
rmdir deadpooldata /s /q 
rmdir deadpoolscripts /s /q
