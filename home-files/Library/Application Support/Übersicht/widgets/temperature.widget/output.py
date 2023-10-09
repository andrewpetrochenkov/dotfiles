#!/usr/bin/env python
import hwmonitor
from pyquery import PyQuery as pq

URL = 'https://www.meteonova.ru/hourly/26686-pogoda-Saphonovo.htm'
inside_t = hwmonitor.sensor("air")
LOW = inside_t < 18
HIGH = inside_t > 25
OK = not LOW and not HIGH

cssclass = "ok"
if LOW:
    cssclass = "low"
if HIGH:
    cssclass = "high"
d = pq(url=URL)
src = d("tr.display img").attr["src"]

outside_t = d(".temper:eq(1)").text()
print("""<table>
    <tr>
        <td><img src="https://www.meteonova.ru%s" class="weather" /></td>
        <td>%s°</td>
    </tr>
    <tr>
        <td><img src="temperature.widget/images/imac.png" class="imac" /></td>
        <td><div class="%s">+%s°</div></td>
    </tr>
<table>""" % (src,outside_t,cssclass,inside_t))

