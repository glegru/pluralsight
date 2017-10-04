"""
pickleread.py
date: 2017-10-04
author : Guillaume LEGRU

Applying DB basics to Ford stocks.
"""

import cPickle

# r = read; w = write; rb = read binary; wb = write binary
# r/W for ascii (protocol 0); rb/wb for binary (protocol 2)
my_pickle_list=[]
with open('stockpickle.dat', 'rb') as f:
    my_pickle_list = cPickle.load(f)

for x in my_pickle_list:
    print x[0], x[1], x[6]