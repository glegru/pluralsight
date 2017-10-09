"""
pickleread.py
date: 2017-10-04
author : Guillaume LEGRU

Using pickle files to store presisting data.
"""

import cPickle

class Stock:
    pass

# r = read; w = write; rb = read binary; wb = write binary
# r/W for ascii (protocol 0); rb/wb for binary (protocol 2)
my_pickle_list=[]
with open('objectpickle.dat', 'rb') as f:
    my_pickle_list = cPickle.load(f)

for stk in my_pickle_list:
    print stk.close, stk.volume, stk.date, stk.symbol