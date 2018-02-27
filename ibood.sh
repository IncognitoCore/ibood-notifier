title=''
suffix="- Internet's Best Online Offer Daily - iBOOD.com"
while [ true ]
do
    var=$(wget -q 'http://www.ibood.com/nl/nl/' -O - | grep -o '<title>.*</title>' | sed 's/\(<title>\|<\/title>\)//g' |sed "s/$suffix$//" | sed -e 's/<[^>]*>//g')
     if [[ $var != $title ]]
     then
       echo $(date '+%d/%m/%Y %H:%M:%S') "::" $var
       echo $var | terminal-notifier -appIcon $(pwd)/ibood.png -contentImage $(pwd)/hunt.gif -title 'New iBOOD sale!' -open 'http://www.ibood.com/nl/nl/'
	     title=$var
    fi
    sleep 1
done
