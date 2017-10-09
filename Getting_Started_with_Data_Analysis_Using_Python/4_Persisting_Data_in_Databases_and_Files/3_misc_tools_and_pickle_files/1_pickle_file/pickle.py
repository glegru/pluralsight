"""
pickle.py
date: 2017-10-04
author : Guillaume LEGRU

Using pickle files to store presisting data.
"""

import sqlite3
import cPickle

# create a list of tuples
def getstocks():
    stocklist = []
    conn = sqlite3.connect('..\\..\\stocks.db')
    c = conn.cursor()
    c.execute("""SELECT date, close, high, low, open, volume, symbol 
                 FROM stockprices""")

    for row in c.fetchall():
        stocklist.append((row[0], row[1], row[2], row[3], row[4], row[5], row[6]))

    return stocklist

stocklist = getstocks()
print len(stocklist)

# write pickle
# r = read; w = write; rb = read binary; wb = write binary
with open('stockpickle.dat', 'wb') as myfile:
    #protocol version 0 (ascii), 1 (binary), or 2 (binary)
    cPickle.dump(stocklist, myfile, 2)
