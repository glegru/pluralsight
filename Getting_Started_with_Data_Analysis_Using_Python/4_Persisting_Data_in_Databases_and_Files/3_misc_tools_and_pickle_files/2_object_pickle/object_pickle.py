"""
pickle.py
date: 2017-10-04
author : Guillaume LEGRU

Using pickle files to store presisting data.
"""

import sqlite3
import cPickle

class Stock:
    pass

# create a list of tuples
def getstocks():
    stocklist = []
    conn = sqlite3.connect('..\\..\\stocks.db')
    c = conn.cursor()
    c.execute("""SELECT date, close, high, low, open, volume, symbol 
                 FROM stockprices""")

    for row in c.fetchall():
        stock = Stock()
        stock.date   = row[0]
        stock.close  = row[1]
        stock.high   = row[2]
        stock.low    = row[3]
        stock.open   = row[4]
        stock.volume = row[5]
        stock.symbol = row[6]
        stocklist.append(stock)

    return stocklist

stocklist = getstocks()
print len(stocklist)

for x in stocklist:
    print x.close, x.symbol, x.date

# write pickle
# r = read; w = write; rb = read binary; wb = write binary
with open('objectpickle.dat', 'wb') as myfile:
    #protocol version 0 (ascii), 1 (binary), or 2 (binary)
    cPickle.dump(stocklist, myfile, 2)
