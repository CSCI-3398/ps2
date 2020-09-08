#!/usr/bin/python

import matplotlib.pyplot as plt
import sys
import numpy as np

fvalues = []

# read in the file vowel-formants.csv
f = open(sys.argv[1])
for line in f:
    parts = line.rstrip().split(",")

    # make sure to only get the parts that are F1 and F2 values
    fvalues.append([float(parts[2]), float(parts[3]), float(parts[5]), float(parts[6]), float(parts[8]), float(parts[9])])
f.close()

# turn that into an nparray so you can easily access columns
npfvalues = np.array(fvalues)

# plot the F1 and F2 values
plt.plot(npfvalues[:,0],npfvalues[:,1],'ro', label="i") 
plt.plot(npfvalues[:,2],npfvalues[:,3], 'bo', label="a")
plt.plot(npfvalues[:,4],npfvalues[:,5], 'go', label="u")
plt.axis([100, 1000, 500, 3000])
plt.legend()
plt.show()
