#!/bin/bash
# CD 3377.002 Project 2 ati140030 Anthony Iorio

# args == 0: rando draw {select, print, and remove} 6/108 tiles.
# args == 1: read in as number of tiles to be drawn. error check.
# args == 2: (number, fileName). print to both. overwrite/create.

colors=(o p y r g b)
shapes=(\# \% \& \^ \@ \$)
bag=()
hand=()

# fillBags and stores all 108 tiles in the bag (of tiles)
fillBag (){
	bagCount=0
	for i in {0..2}; do
		for j in {0..5}; do
			for k in {0..5}; do
				tile=${colors[j]}\|${shapes[k]}
				bag[$bagCount]=$tile
				(( bagCount++ ))
			done
		done
	done
}

# draws a random tile from the bag
drawTile (){
	i=0
	# draws until requested hand size is met
	while [ $i -le $(( $1 -1 )) ]; do
		rand=$(( (RANDOM%108) ))
		# redraw if tile does not exist
		while ! [ ${bag[rand]} ]; do
			rand=$(( (RANDOM%108) ))
		done

		hand[$i]=${bag[rand]}
		printf '%s\n' "${hand[i]}"
		(( i++ ))

		# remove tile from bag
		bag[$rand]=""
	done
}


# call fillBag function
fillBag

# 0 arg
if [ $# -eq 0 ]; then
	drawTile 6
# 1 arg
elif [ $1 -ge 0 -a $1 -le 108 2>/dev/null ]; then
	drawTile $1
	
# 2 arg
	if [ $2 ]; then
		printf '%s\n' "${hand[@]}" > $2
	fi
else
	echo Please enter a number between 0 and 108
fi


