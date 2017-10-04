"""
insert.py
date: 2017-10-03
author : Guillaume LEGRU

Playing with SQL basics in Python.
"""

import sqlite3
from os import path

conn = sqlite3.connect('..\\sample.db')
c = conn.cursor()

x = 'john@mail.com','John','Doe',
c.execute('INSERT INTO users values(?,?,?)', x)

x = 'jane@mail.com','Jane','Doe',
c.execute('INSERT INTO users values(?,?,?)', x)
conn.commit()
conn.close()
print c.rowcount
