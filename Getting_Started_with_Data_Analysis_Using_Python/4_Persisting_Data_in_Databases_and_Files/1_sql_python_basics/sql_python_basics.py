"""
sql_python_basics.py
date: 2017-10-03
author : Guillaume LEGRU

Playing with SQL basics in Python.
"""

import sqlite3
from os import path

conn = sqlite3.connect('..\\sample.db')
c = conn.cursor()

c.execute('SELECT * FROM users')
for row in c.fetchall():
    print row[0], row[1], row[2]
print

x = 'Kirk','Chan',
c.execute('SELECT email, last, first FROM users WHERE last = ? OR last = ? ORDER BY last', x)
for row in c.fetchall():
    print row[0], row[1], row [2]
print

c.execute('SELECT count(email) from users')
for row in c.fetchall():
    print row[0]
