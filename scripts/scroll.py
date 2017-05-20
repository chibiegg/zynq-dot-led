from PIL import Image
import json


def conv(img):
    pix = img.load()

    rdata = []
    gdata = []
    for y in range(16):
        rvalue = 0
        gvalue = 0
        for x in range(32):
            rvalue <<= 1
            gvalue <<= 1
            r,g,b = pix[x,y]
            if r:
                rvalue |= 0x01
            if g:
                gvalue |= 0x01

        rdata.append(rvalue)
        gdata.append(gvalue)
    return(rdata, gdata)


def main(filename):
    img = Image.open(filename).convert("RGB")

    frames = []
    for i in range(img.size[0]-32):
        fimg = img.crop((i, 0, i+32, 16))
        frames.append(conv(fimg))

    print(json.dumps(frames, indent=2))

if __name__ == "__main__":
    import sys
    main(sys.argv[1])
