"""
stock_market_application.py
date: 2017-10-03
author : Guillaume LEGRU

Applying DB basics to Ford stocks.
"""

import sqlite3

F = []
with open('mystocks.csv', 'r') as f:
    for l in f:
        stock = l[:-2].split(',')
        if stock[0] == 'F':
            stock.append(stock[0])
            F.append(tuple(stock[1:]))

print 'F: \n  count:{}\n  example {}'.format(len(F), F[0])

conn = sqlite3.connect('..\\stocks.db')
c = conn.cursor()

c.executemany('INSERT INTO stockprices VALUES(?,?,?,?,?,?,?)', F)

conn.commit()
conn.close()
print c.rowcount