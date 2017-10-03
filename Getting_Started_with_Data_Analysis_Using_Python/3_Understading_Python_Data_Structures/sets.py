"""
sets.py
date: 2017-10-02
author : Guillaume LEGRU

Using sets to handle data.
"""

# ============================================================
#                                                       BASICS
# Basics: tuples modification

s1 = set()
s1.add(1)
s1.update([1, 2, 3])
print s1

s1.add(4)
print s1

s2 = set([4, 5, 6])
print s2

print s1.union(s2)

print s1.intersection(s2)

# Basics : membership testing
print 7 in s1
print 3 in s1

# ============================================================
#                                              LET'S PRACTICE!

watchlist = ['MSFT', 'AAPL', 'QCOM']
openpos   = [('AAPL', 100.00, 100), ('F', 8.35, 100), ('DIS', 87.35, 100)]  # (symbol, buy, shares)
closedpos = [('MSFT', 25.50, 32.65, 100), ('INTC', 35.35, 27.89, 100)]      # (symbol, buy, sell, shares)

mystocks = set()

for x in watchlist:
    mystocks.add(x)

for x in openpos:
    mystocks.add(x[0])

for x in closedpos:
    mystocks.add(x[0])

# shorter version
# mystocks.update(watchlist)
# mystocks.update([x[0] for x in openpos])
# mystocks.update([x[0] for x in closedpos])
