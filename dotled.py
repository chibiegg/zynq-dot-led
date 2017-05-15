from pynq.pl import Bitstream
from pynq.mmio import MMIO

class DotLED(object):

    def __init__(self):
        self.mmio = MMIO(0x43c00000, 16)


    def set_addr(self, value):
        self.mmio.write(4*1, value & 0x0f)
    def get_addr(self):
        return self.mmio.read(4*1) & 0x0f
    addr = property(get_addr, set_addr)

    def set_rdata(self, value):
        self.mmio.write(4*2, value)
    def get_rdata(self):
        return self.mmio.read(4*2)
    def set_gdata(self, value):
        self.mmio.write(4*3, value)
    def get_gdata(self):
        return self.mmio.read(4*3)
    rdata = property(get_rdata, set_rdata)
    gdata = property(get_gdata, set_gdata)

    def send(self):
        value = self.mmio.read(0) | 0x04
        self.mmio.write(0, value)
        while (self.mmio.read(0) & 0x04):
            pass


    def set_se(self, value):
        if value: 
            v = self.mmio.read(0) | 0x01
        else:
            v = self.mmio.read(0) & 0xfffffffe
        self.mmio.write(0, v)
    def get_se(self):
        return (self.mmio.read(0) & 0x01) == 0x01
    se = property(get_se, set_se)

    def set_ram(self, value):
        if value:
            v = self.mmio.read(0) | 0x02
        else:
            v = self.mmio.read(0) & 0xfffffffd
        self.mmio.write(0, v)
    def get_ram(self):
        return (self.mmio.read(0) & 0x02) == 0x02
    ram = property(get_ram, set_ram)


