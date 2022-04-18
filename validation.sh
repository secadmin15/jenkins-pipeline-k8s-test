docker run -d secadmin15/labuser:latest sleep 30 > /dev/null 2>&1

sudo rm -rf docker-bench-security

unzip docker-bench-security.zip > /dev/null 3>&1
cd docker-bench-security

sudo chmod +x docker-bench-security.sh
sudo bash docker-bench-security.sh > /jobsdata/stdout.txt
chmod +x /jobsdata/stdout.txt
a=`cat /jobsdata/stdout.txt | grep -i Score: | awk {'print $3'}`

if [ $a -gt 5 ];
then
        echo "\e[1;32m >>>>>SUCCESS<<<<< \e[0m"
else
        echo "\e[1;31m >>>>>FAILURE<<<<< \e[0m"
fi
#cp -f /jobsdata/stdout.txt /jobsdata/stdout-`date`.txt
#rm -f /jobsdata/stdout.txt
