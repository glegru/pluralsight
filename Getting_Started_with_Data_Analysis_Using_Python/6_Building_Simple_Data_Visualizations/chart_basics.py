"""
stock_market_analysis.py
date: 2017-10-09
author : Guillaume LEGRU

A quick demo of the pygal chart basics.
"""

import pygal
from pygal.style import CleanStyle
from pygal.style import DarkGreenStyle

data1 = {1: 10,
         2: 20,
         3: 30,
         4: 25,
         5: 17}

data2 = {1: 40,
         2: 33,
         3: 20,
         4: 15,
         5: 11}

# bar chart
barchart = pygal.Bar(style=CleanStyle)
barchart.title = 'Bar Chart'
barchart.x_labels = data1.keys()
barchart.add('data1', data1)
barchart.add('data2', data2)

# save as svg file
barchart.render_to_file('charts\\bar_chart.svg')


#line chart
linechart = pygal.Line(style=CleanStyle)
linechart.title = 'Line Chart'
linechart.x_labels = data1.keys()
linechart.add('data1', data1)
linechart.add('data2', data2)

# save as svg file
linechart.render_to_file('charts\\line_chart.svg')