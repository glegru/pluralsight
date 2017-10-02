"""
dict.py
date: 2017-09-29
author : Guillaume LEGRU

Using dictionnaries to handle data.
"""

# ============================================================
#                                                       BASICS
# Basics: dictionnaries modification

mydict = {}
print mydict

mydict['ABC'] = 'ABC company'
mydict['XYZ'] = 'XYZ corporation'
mydict['ZZZ'] = 'ZZZ company'
print mydict

del mydict['ZZZ']
print mydict

mydict['XYZ'] = 'Updated XYZ Company'
print mydict

# Basics : membership testing
print 'XYZ' in mydict

for x in mydict.keys():
    print x

for x in mydict.values():
    print x

# ============================================================
#                                              LET'S PRACTICE!
import csv

def getstockdict():
    datafile = 'data\\companylist.csv'
    f = open(datafile, 'r')
    reader = csv.reader(f)
    
    mydict = {}
    
    for data in reader :
        mydict[data[0]] = data[1]
    
    f.close()

    return mydict

mydict = getstockdict()

mystocks = ['IBM', 'F', 'DIS']

for x in mystocks:
    if x in mydict:
        print mydict[x]
    else:
        print x, 'not found'
