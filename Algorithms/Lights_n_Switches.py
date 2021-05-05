import Fulkerson

lights = [(2, 4), (2, 2), (5, 4)]
switches = [(4, 4), (6, 3), (6, 2)]

walls = [(1, 2), (1, 5), (8, 5), (8, 3), (11, 3), (11, 1), (5, 1), (5, 3), (4, 3), (4, 1), (1, 1), (1, 2)]


# Daniel's code
def ccw(A, B, C):
    return (C[1] - A[1]) * (B[0] - A[0]) > (B[1] - A[1]) * (C[0] - A[0])


# Return true if line segments AB and CD intersect
# Source: http://bryceboe.com/2006/10/23/line-segment-intersection-algorithm/


def intersect(A, B, C, D):
    return ccw(A, C, D) != ccw(B, C, D) and ccw(A, B, C) != ccw(A, B, D)


def visible(pt1, pt2, Walls):
    x1, y1 = pt1
    x2, y2 = pt2
    for i, wall in enumerate(Walls[:-1]):
        x3, y3 = wall
        x4, y4 = Walls[i + 1]
        if intersect((x1, y1), (x2, y2), (x3, y3), (x4, y4)):
            return False
    return True


# End Daniel's code


def ls(switches, lights, walls):
    graf = []
    grafd = {
        "snk": ["snk", []],
        "src": ["src", []]
    }
    lt = 0
    sw = 0
    for l in lights:
        n = namer(lt, 0)
        grafd[n] = [n, [["snk", 1]]]
        grafd["snk"][1].append([n, 0])
        lt += 1
    for s in switches:
        n = namer(sw, 1)
        grafd[n] = [n, [["src", 0]]]
        grafd["src"][1].append([n, 1])
        sw += 1
    sw = 0
    for s in switches:
        lt = 0
        for l in lights:
            v = visible(s, l, walls)
            if v:
                n = namer(lt, 0)
                m = namer(sw, 1)
                grafd[m][1].append([n, 1])
                grafd[n][1].append([m, 0])
            lt += 1
        sw += 1
    for n in grafd:
        graf.append(grafd[n])
    g = Fulkerson.Graph()
    g.build(graf)
    g.print_graph()
    g.fulkerson("src", "snk")
    g.print_graph()
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
    return abet[c][s]


ls(switches, lights, walls)



