from PIL import Image
import json

def main(filename):
    img = Image.open(filename).convert("RGB")
    pix = img.load()

    rdata = []
    gdata = []

    for y in range(16):
        rvalue = 0
        gvalue = 0
        for x in range(32):
            rvalue <<= 1
            gvalue <<= 1

            print(pix[x,y])

            r,g,b = pix[x,y]
            if r:
                rvalue |= 0x01
            if g:
                gvalue |= 0x01

        rdata.append(rvalue)
        gdata.append(gvalue)


    print("rdata =", json.dumps(rdata))
    print("gdata =", json.dumps(gdata))

if __name__ == "__main__":
    import sys
    main(sys.argv[1])
