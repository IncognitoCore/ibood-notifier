lastPublishedDeal=''
suffix="- Internet's Best Online Offer Daily - iBOOD.com"
while [ true ]
do
    currentDeal=$(wget -q 'http://www.ibood.com/nl/nl/' -O - | grep -o '<title>.*</title>' | sed -e 's/<[^>]*>//g' | sed "s@$suffix@@g" | perl -MHTML::Entities -pe 'decode_entities($_);')
     if [[ $currentDeal != $lastPublishedDeal ]]
     then
       echo $(date '+%d/%m/%Y %H:%M:%S') "::" $currentDeal
       echo $currentDeal | terminal-notifier -appIcon $(pwd)/ibood.png -contentImage $(pwd)/hunt.gif -title 'New iBOOD sale!' -open 'http://www.ibood.com/nl/nl/'
	     lastPublishedDeal=$currentDeal
    fi
    sleep 1
done
