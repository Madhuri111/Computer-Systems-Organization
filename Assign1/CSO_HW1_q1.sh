#Execute this code in the folder location that you want to check for
#cd $1
du -ah | sort -n -r | awk -F"/" '{print $2}' | head -n 1

