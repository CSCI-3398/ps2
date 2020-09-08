# read in the .wav and .TextGrid
Read from file: "/Users/emilypx/Desktop/CSCI-3398/ProblemSets/ps2/data/audio/sea-amoeba.TextGrid"
Read from file: "/Users/emilypx/Desktop/CSCI-3398/ProblemSets/ps2/data/audio/sea-amoeba.wav"

# create a Formant object for the sound
selectObject: "Sound sea-amoeba"
To Formant (burg): 0, 5, 5500, 0.025, 50

# get the number of intervals in the TextGrid 
# intervals = labeled segments
selectObject: "TextGrid sea-amoeba"
intv=Get number of intervals... 1

# this clears the output window
clearinfo

# for every interval (segment)
for k from 1 to 'intv'
	selectObject: "TextGrid sea-amoeba"

	# get the label, and if the label is "i"...

	mylabel$ = Get label of interval... 1 'k'
	if mylabel$ = "i"

		# ... find the midpoint...
		vowel_onset = Get starting point... 1 'k'
		vowel_offset = Get end point... 1 'k'
		midpoint = vowel_onset + ((vowel_offset - vowel_onset) / 2)

		# ... and get the formant values at the midpoint
		selectObject: "Formant sea-amoeba"
		f_one = Get value at time... 1 'midpoint' Hertz Linear
		f_two = Get value at time... 2 'midpoint' Hertz Linear

		# print it out
		appendInfoLine: f_one, " ", f_two
	endif
endfor