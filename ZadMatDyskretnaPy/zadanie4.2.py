class UnionFind:
    def __init__(self, n):
        self.parent = list(range(n))
        self.rank = [0] * n

    def find(self, u):
        if self.parent[u] != u:
            self.parent[u] = self.find(self.parent[u])
        return self.parent[u]

    def union(self, u, v):
        pu, pv = self.find(u), self.find(v)
        if pu == pv:
            return False
        if self.rank[pu] < self.rank[pv]:
            self.parent[pu] = pv
        elif self.rank[pu] > self.rank[pv]:
            self.parent[pv] = pu
        else:
            self.parent[pv] = pu
            self.rank[pu] += 1
        return True

def kruskal(n, edges):
    edges.sort(key=lambda x: x[2])
    uf = UnionFind(n)
    min_cost = 0
    min_spanning_tree = []
    for u, v, w in edges:
        if uf.union(u, v):
            min_cost += w
            min_spanning_tree.append((u, v))
    return min_cost, min_spanning_tree

def main():
    print("Wprowadź input w postaci: \n5 6 13\nA, B, C, D, E\nA B 5\nA E 7\nB D 9\nB E 1\nC D 4\nD E 2")
    n, m, budget = map(int, input().split())
    cities = input().split(', ')
    edges = []
    for _ in range(m):
        u, v, cost = input().split()
        uidx = cities.index(u)
        vidx = cities.index(v)
        edges.append((uidx, vidx, int(cost)))
    min_cost, min_spanning_tree = kruskal(n, edges)
    if min_cost <= budget:
        print("TAK")
        print("Minimalny koszt:",min_cost)
        print(', '.join([f"{cities[u]} {cities[v]}" for u, v in min_spanning_tree]))
    else:
        print("NIE")

if __name__ == "__main__":
    main()