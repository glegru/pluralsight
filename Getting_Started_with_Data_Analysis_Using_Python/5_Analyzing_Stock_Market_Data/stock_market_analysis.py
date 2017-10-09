"""
stock_market_analysis.py
date: 2017-10-09
author : Guillaume LEGRU

Getting stocks values and manipulating them (mainly sorting them) in order to analyse them.
"""

import csv
from datetime import datetime
from dateutil.parser import parse
import operator

# key   = (symbol, date)
# value = (open,   close)
mydict = {} 
shares ={'goog':10, 'f':1000}
marketdates = []

for stocksymbol in shares:
    with open('data\\{}.csv'.format(stocksymbol)) as f:
        r = csv.reader(f)
        next(r, None) # skipping the header

        # date, open, high, low, close, volume
        for data in r:
            d = parse(data[0])
            if d not in marketdates:
                marketdates.append(d)
            mydict[(stocksymbol, d)] = (float(data[1]), float(data[4]))

total = {}

for d in sorted(marketdates):
    for stk in shares:
        if d in total:
            total[d] += mydict[(stk, d)][1] * shares[stk]
        else:
            total[d] = mydict[(stk, d)][1] * shares[stk]

for d in sorted(marketdates):
    print d, total[d]

diff = {}

for d in sorted(marketdates):
    for stk in shares:
        close_less_open = (mydict[(stk, d)][1] - mydict[(stk, d)][0])
        if d in diff:
            diff[d] += close_less_open * shares[stk]
        else:
            diff[d] = close_less_open * shares[stk]

for d in sorted(marketdates):
    print d, diff[d]

sorted_diff = sorted(diff.items(), key=operator.itemgetter(1))
for x in sorted_diff:
    print x[0], x[1]