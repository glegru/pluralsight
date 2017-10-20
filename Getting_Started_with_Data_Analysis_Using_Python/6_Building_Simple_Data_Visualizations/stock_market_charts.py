"""
stock_market_analysis.py
date: 2017-10-11
author : Guillaume LEGRU

Applying the basics previously seen to stock market analysis.
"""

import csv
import pygal
from pygal.style import CleanStyle
from pygal.style import BlueStyle
from pygal.style import RedBlueStyle

stocksymbols = ['goog', 'amzn']
stockprices = {}

for symbol in stocksymbols:
    dataset = []
    dates = []
    cpt = 0

    with open('data\\{}.csv'.format(symbol), 'r') as f :
        r = csv.reader(f)
        r.next()  # skipping header
        
        # date, open, high, low, close, volume
        for x in r:
            cpt += 1
            if cpt % 10 == 0:
                dates.append(x[0])
                dataset.append(float(x[4]))
        stockprices[symbol] = list(reversed(dataset))

line_chart = pygal.Line(style=CleanStyle)
line_chart.title = 'Stock Prices'
line_chart.x_labels = dates
for symbol in stocksymbols:
    line_chart.add(symbol, stockprices[symbol])

# saving as svg file
line_chart.render_to_file('charts\\stock_chart.svg')


