#!/bin/sh
workspaces() {

ws1="1"
ws2="2"
ws3="3"
ws4="4"
ws5="5"

# Unoccupied
un="0"

# check if Occupied
o1=$(bspc query -D -d .occupied --names | grep "$ws1" )
o2=$(bspc query -D -d .occupied --names | grep "$ws2" )
o3=$(bspc query -D -d .occupied --names | grep "$ws3" )
o4=$(bspc query -D -d .occupied --names | grep "$ws4" )
o5=$(bspc query -D -d .occupied --names | grep "$ws5" )

# check if Focused
f1=$(bspc query -D -d focused --names | grep "$ws1" )
f2=$(bspc query -D -d focused --names | grep "$ws2" )
f3=$(bspc query -D -d focused --names | grep "$ws3" )
f4=$(bspc query -D -d focused --names | grep "$ws4" )
f5=$(bspc query -D -d focused --names | grep "$ws5" )

ic_1="󰜌"
ic_2="󰜌"
ic_3="󰜌"
ic_4="󰜌"
ic_5="󰜌"

cl_1="nf"
cl_2="nf"
cl_3="nf"
cl_4="nf"
cl_5="nf"

if [ $f1 ]; then
     ic_1="󰜋"
 elif [ $f2 ]; then
     ic_2="󰜋"
 elif [ $f3 ]; then
     ic_3="󰜋"
 elif [ $f4 ]; then
     ic_4="󰜋"
 elif [ $f5 ]; then
     ic_5="󰜋"
fi

#  

if [ $f1 ]; then
    cl_1="focused"
elif [ $f2 ]; then
    cl_2="focused"
elif [ $f3 ]; then
    cl_3="focused"
elif [ $f4 ]; then
    cl_4="focused"
elif [ $f5 ]; then
    cl_5="focused"
fi



#echo 	"(box	:class \"works\" :spacing \"4\" :orientation \"h\" :halign \"center\" :valign \"fill\" :space-evenly \"false\" :vexpand \"true\" (eventbox :onclick \"bspc desktop -f $ws1\"	:class	\"$cl_1\"	\"$ic_1\") (eventbox :onclick \"bspc desktop -f $ws2\"	:class \"$cl_2\"	 \"$ic_2\") (eventbox :onclick \"bspc desktop -f $ws3\"	:class \"$cl_3\" \"$ic_3\") (eventbox :onclick \"bspc desktop -f $ws4\"	:class \"$cl_4\"	\"$ic_4\") (eventbox :onclick \"bspc desktop -f $ws5\"	:class \"$cl_5\" \"$ic_5\")  (eventbox :onclick \"bspc desktop -f $ws6\"	:class \"$cl_6\" \"$ic_6\") (eventbox :onclick \"bspc desktop -f $ws7\"	:class \"$cl_7\" \"$ic_7\") (eventbox :onclick \"bspc desktop -f $ws8\"	:class \"$cl_8\"	\"$ic_8\") (eventbox :onclick \"bspc desktop -f $ws9\"	:class \"$cl_9\"	\"$ic_9\"))"

#echo 	"(box	:class \"works\" :spacing \"-1\" :orientation \"v\" :halign \"center\" :space-evenly \"false\" (eventbox :onclick \"bspc desktop -f $ws1\"	(label :class	\"$cl_1\"	:text \"$ic_1\")) (eventbox :onclick \"bspc desktop -f $ws2\"	(label :class \"$cl_2\"	 :text \"$ic_2\")) (eventbox :onclick \"bspc desktop -f $ws3\"	(label :class \"$cl_3\" :text \"$ic_3\")) (eventbox :onclick \"bspc desktop -f $ws4\"	(label :class \"$cl_4\"	:text \"$ic_4\")) (eventbox :onclick \"bspc desktop -f $ws5\"	(label :class \"$cl_5\" :text \"$ic_5\"))  (eventbox :onclick \"bspc desktop -f $ws6\"	(label :class \"$cl_6\" :text \"$ic_6\")) (eventbox :onclick \"bspc desktop -f $ws7\"	(label :class \"$cl_7\" :text \"$ic_7\")) (eventbox :onclick \"bspc desktop -f $ws8\"	(label :class \"$cl_8\"	:text \"$ic_8\")) (eventbox :onclick \"bspc desktop -f $ws9\"	(label :class \"$cl_9\"	:text \"$ic_9\")))"

echo 	"(box	:class \"works\" :spacing \"-8\" :orientation \"v\" :halign \"center\" :valign \"fill\" :space-evenly \"false\" :vexpand \"true\" (eventbox :onclick \"bspc desktop -f $ws1\"	:class	\"$cl_1\"	\"$ic_1\") (eventbox :onclick \"bspc desktop -f $ws2\"	:class \"$cl_2\"	 \"$ic_2\") (eventbox :onclick \"bspc desktop -f $ws3\"	:class \"$cl_3\" \"$ic_3\") (eventbox :onclick \"bspc desktop -f $ws4\"	:class \"$cl_4\"	\"$ic_4\") (eventbox :onclick \"bspc desktop -f $ws5\"	:class \"$cl_5\" \"$ic_5\"))"

}
workspaces
bspc subscribe all | while read -r _ ; do
workspaces
done
