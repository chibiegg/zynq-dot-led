# DOT-LED board with Zynq-7000

## Hardware

* PYNQ-Z1
* 32x16DOT-0158-DJK




import json
import time
from dotled import DotLED


with open("/home/xilinx/telop.json") as f:
    data = json.load(f)

l = DotLED()

l.rdata = 0
l.gdata = 0
for a in range(17):
    l.addr = a % 16
    l.send()

while True:
    for (rdata, gdata) in data:
        for a in range(16):
            l.addr = a
            l.rdata = rdata[a]
            l.gdata = gdata[a]
            l.send()
        l.addr = 0
        l.send()
        time.sleep(0.05)
