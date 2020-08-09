echo "Logout time" >datef.txt 
date /t >>datef.txt
time /t >>datef.txt
Echo ********************* >>Logfile.txt
type datef.txt >>logfile.txt
Echo ========================== >>Logfile.txt

del /q datef.txt

shutdown /s
