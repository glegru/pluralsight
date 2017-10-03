"""
tuple.py
date: 2017-10-02
author : Guillaume LEGRU

Using tuple to handle data.
"""

# ============================================================
#                                                       BASICS
# Basics: tuples modification

mytupl1 = ('ABC', 'Company ABC', 90.25)
mytupl2 = ('XYZ', 'Corporation XYZ', 20.84)
mytupl3 = ('ZZZ', 'Better Sleep Company', 7.32)

print mytupl1
print mytupl2
print mytupl3

print mytupl1[0]
print mytupl3[0:1]
print mytupl3[0:2]

print len(mytupl1)

mynum = (1,4,5.7,9,-2)
print min(mynum)

# Basics : membership testing
print 7 in mynum

mylist =[]
mylist.append(mytupl1)
mylist.append(mytupl2)
mylist.append(mytupl3)

print mylist

for x in mylist:
    print x

for x in mylist:
    print x[2]

# ============================================================
#                                              LET'S PRACTICE!

AAPL = []
F = []
with open('data/mystocks.csv', 'r') as f:
    for l in f:
        stock = l[:-2].split(',')
        if stock[0] == 'AAPL':
            AAPL.append(stock[1:])
        elif stock[0] == 'F':
            F.append(stock[1:])
        else:
            print 'This company has to be considered: {}'.format(stock[0])

print 'AAPL: \n  count:{}\n  example{}'.format(len(AAPL), AAPL[0])
print 'F: \n  count:{}\n  example{}'.format(len(F), F[0])


stocklist = []
for s in AAPL:
    stocklist.append((s[0], s[1], s[5]))

print len(stocklist)

for x in stocklist:
    print x


stockdict = {}
for s in AAPL:
    stockdict[('AAPL', s[0])] = s[1]

print len(stockdict)
print stockdict[('AAPL', '20160412')]




