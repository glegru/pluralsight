"""
insertmany.py
date: 2017-10-03
author : Guillaume LEGRU

Playing with SQL basics in Python.
"""

import sqlite3

conn = sqlite3.connect('..\\sample.db')
c = conn.cursor()

employees = [('jill@mail.com', 'AppleTree', 'Jill',),
             ('frank@mail', 'AppleTree', 'Frank'),
             ('desi@mail', 'AppleTree', 'Desi'),]
c.executemany('INSERT INTO users values(?,?,?)', employees)

conn.commit()
conn.close()
print c.rowcount
