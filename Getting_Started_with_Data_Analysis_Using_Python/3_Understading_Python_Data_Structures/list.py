"""
list.py
date: 2017-09-19
author : Guillaume LEGRU

Using list to handle data.
"""

# ============================================================
#                                                       BASICS
# Basics: list modification
mylist = []
print mylist

mylist = ['F', 'GOOG']
print mylist

mylist.append('AAPL')
print mylist

mylist.insert(1, 'QCOM')
print mylist

x = sorted(mylist)
print x

x.pop(1)
print x

# Basics: test membership
MYSTOCKS = ['F', 'QCOM', 'MSFT', 'AAPL']
if 'GM' in MYSTOCKS:
    print 'True'

if 'GM' not in MYSTOCKS:
    print 'False'

# more concise way: print 'GM' in mystocks

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

count = 0
two_percents = []
STOCKS = {'AAPL': AAPL, 'F': F}
for s in range(len(STOCKS)):
    for l in STOCKS.values()[s]:
        cls = float(l[1])
        opn = float(l[4])
        chg = (cls - opn) / opn
        if chg > 0.02:
            two_percents.append([STOCKS.keys()[s], chg])
            count += 1

print count
for i in two_percents:
    print i     