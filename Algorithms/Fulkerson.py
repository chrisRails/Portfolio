# Christian Stutzman

class Node:

    def __init__(self, name, path):
        self.n = name
        self.paths = {}
        self.blocked = []
        self.closed = 0
        self.out = 0
        for p in path:
            self.paths[p[0]] = [p[0], p[1]]
            if p[1] == 0:
                self.closed += 1
            else:
                self.out +=1
        self.open = len(self.paths)
        #print(f"Built Node: {self.n}")

    def c(self):
        self.closed = 0
        self.blocked = []
        for p in self.paths:
            if self.paths[p][1] == 0:
                self.closed += 1
        if self.closed >= self.open:
            return True
        return False

    def pather(self, g, start, end, path: list):
        if self.n == end:
            return path + [self.n]
        for p in self.paths:
            if self.paths[p][1] == 0:
                pass
            elif p in path:
                pass
            elif p == start:
                pass
            else:
                x = g.g[p].pather(g, start, end, path + [self.n])
                if x is not None:
                    return x

        return

    def total(self):
        t = 0
        for e in self.paths:
            t += self.paths[e][1]



class Graph:

    def __init__(self):
        self.O_graph = {}
        self.g = {}
        self.nodes = []
        self.blocked = []

    def reset(self):
        self.g = self.O_graph

    def set(self, grapharray):
        self.O_graph = grapharray
        self.reset()

    def build(self, array):
        graph = {}
        self.nodes = []
        for n in array:
            if len(n) > 1:
                graph[n[0]] = Node(n[0],n[1])
            else:
                graph[n[0]] = Node(n[0],[])
            self.nodes.append(n[0])
        self.set(graph)

    def fulkerson(self, start, end):
        f = 0

        while True:
            p = self.g[start].pather(self, start, end, [])
            if p is None:
                break
            f += self.augment(end, p[:])
            #print(p)
            #print(f)
        return f


    def augment(self, e, p):
        b = self.bottleneck(p[:], e)
        m = p[0]
        for n in p[1:]:
            self.g[m].paths[n][1] -= b
            self.g[n].paths[m][1] += b
            m = n


        return b

    def bottleneck(self, p, e):
        small = float("inf")
        m = p[0]
        for n in p[1:]:
            edge = self.g[m].paths[n]
            if edge[1] < small:
                small = edge[1]
            m = n
        return small

    def print_graph(self):
        for n in self.g:
            c = f"{self.g[n].n} : "
            for e in self.g[n].paths:
                c += f"{self.g[n].paths[e][0]}:{self.g[n].paths[e][1]}, "
            print(c)




def test():
    array = [
        ["a", [["b",15],["c",9]]],
        ["b", [["a", 0],["c",7],["d",12]]],
        ["c", [["a", 0],["b", 0],["e",15]]],
        ["d", [["b", 0],["e", 0],["f",9]]],
        ["e", [["c", 0],["d",7],["f",9]]],
        ["f", [["d", 0],["e", 0]]]
    ]
    array2 = [
        ["a", [["b",1],["c",1]]],
        ["b", [["a", 0],["c",1],["d",1]]],
        ["c", [["a", 0],["b", 0],["e",1]]],
        ["d", [["b", 0],["e", 0],["f",1]]],
        ["e", [["c", 0],["d",1],["f",1]]],
        ["f", [["d", 0],["e", 0]]]
    ]
    graph = Graph()
    graph.build(array) # change to array 2 for example
    graph.fulkerson("a", "f")
    graph.print_graph()


#test()
