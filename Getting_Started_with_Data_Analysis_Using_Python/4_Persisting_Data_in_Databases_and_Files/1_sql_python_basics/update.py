"""
update.py
date: 2017-10-03
author : Guillaume LEGRU

Playing with SQL basics in Python.
"""

import sqlite3
from os import path

conn = sqlite3.connect('..\\sample.db')
c = conn.cursor()

x = 'Johnny','john@mail.com',
c.execute('UPDATE users set first = ? where email = ?', x)
conn.commit()
conn.close()
print c.rowcount
