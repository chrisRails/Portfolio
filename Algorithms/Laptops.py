# Christian Stutzman


import Fulkerson
import random
from timeit import timeit


gra = Fulkerson.Graph()
flow = 0


# Let's time it! Thanks to Brandon Chupp, who deciphered all this
def wrapper(func, *args):  # wraps a function to allow the timeit function to use it
    def wrapped():
        return func(*args)

    return wrapped


def generator(range_, routers, laptops_per):
    l = []
    for r in routers:
        l2 = []
        while len(l2) < laptops_per:
            x = random.randint( - range_, range_) + r[0]
            y = random.randint( - range_, range_) + r[1]
            v = range_finder(r, [x,y], range_)
            if v:
                l2.append((x,y))
        l += l2
    #print("Generated")
    return l

    pass


def range_finder(r, l, d):
    return pow(r[0] - l[0], 2) + pow(r[1] - l[1], 2) <= d * d
    pass


def grapher(ro, lt, d, m):  # routers, laptops, range, max num of laptops per router
    global gra, flow
    g = []
    gd = {
        "snk": ["snk", []],
        "src": ["src", []]
    }
    ls = []
    rs = []
    ln = 0
    rn = 0
    for r in ro:
        n = namer(rn, 1)
        gd[n] = [n, [["src", 0]]]
        gd["src"][1].append([n, m])
        rs.append(n)
        rn += 1
    for l in lt:
        n = namer(ln, 0)
        gd[n] = [n, [["snk", 1]]]
        gd["snk"][1].append([n, 0])
        ls.append(n)
        ln += 1
    rs = 0
    for r in ro:
        ls = 0
        for l in lt:
            v = range_finder(r, l, d)
            if v:
                n = namer(ls, 0)
                o = namer(rs, 1)
                gd[o][1].append([n, 1])
                gd[n][1].append([o, 0])
            ls += 1
        rs += 1
    for n in gd:
        g.append(gd[n])
    fg = Fulkerson.Graph()
    fg.build(g)
    t = fg.g["src"].total()
    #fg.print_graph()
    r = fg.fulkerson("src", "snk")
    t2 = fg.g["snk"].total()
    gra = fg
    flow = r
    if t2 != t:
        print(f"ERROR: source: {t}, sink: {t2}")
    #print(r)
    #fg.print_graph()
    pass



def tester(d, per):
    global gra, flow, l
    r = [(d - 1, d - 1), (d - 1, d + d - 1), (d + d - 1, d - 1), (d + d - 1, d + d - 1)]
    #l = generator(d,r,per)
    grapher(r,l,d,per)
    #print(flow)
    #gra.print_graph()
    pass


def namer(c, s):  # num, switch or light (1 or 0)
    abet = [
        ["a", "A"],
        ["b", "B"],
        ["c", "C"],
        ["d", "D"],
        ["e", "E"],
        ["f", "F"],
        ["g", "G"],
        ["h", "H"],
        ["i", "I"],
        ["j", "J"],
        ["k", "K"],
        ["l", "L"],
        ["m", "M"],
        ["n", "N"],
        ["o", "O"],
        ["p", "P"],
        ["q", "Q"],
        ["r", "R"],
        ["s", "S"],
        ["t", "T"],
        ["u", "U"],
        ["v", "V"],
        ["w", "W"],
        ["x", "X"],
        ["y", "Y"],
        ["z", "Z"]
    ]
    l = ""
    if c > 26:
        l = str(int(c/26))
    return abet[c % 26][s] + l

d = 4
r = [(d - 1, d - 1), (d - 1, d + d - 1), (d + d - 1, d - 1), (d + d - 1, d + d - 1)]
l = generator(d,r,4)
x = wrapper(tester, d, 4)
print(f"Range: 4\nNum of Laptops per Router : {4}\nTotal Laptops: {4 * 4}\nTime:{timeit(x, number=1000) / 1000}")
d = 4
l = generator(d,r,6)
x = wrapper(tester, d, 6)
print(f"Range: 4\nNum of Laptops per Router : {6}\nTotal Laptops: {4 * 6}\nTime:{timeit(x, number=1000) / 1000}")
d = 4
l = generator(d,r,8)
x = wrapper(tester, d, 8)
print(f"Range: 4\nNum of Laptops per Router : {8}\nTotal Laptops: {4 * 8}\nTime:{timeit(x, number=1000) / 1000}")
d = 4
l = generator(d,r,10)
x = wrapper(tester, d, 10)
print(f"Range: 4\nNum of Laptops per Router : {10}\nTotal Laptops: {4 * 10}\nTime:{timeit(x, number=1000) / 1000}")
d = 4
l = generator(d,r,12)
x = wrapper(tester, d, 12)
print(f"Range: 4\nNum of Laptops per Router : {12}\nTotal Laptops: {4 * 12}\nTime:{timeit(x, number=1000) / 1000}")
d = 4
l = generator(d,r,14)
x = wrapper(tester, d, 14)
print(f"Range: 4\nNum of Laptops per Router : {14}\nTotal Laptops: {4 * 14}\nTime:{timeit(x, number=1000) / 1000}")

