import itertools

def isomorphic(graph1, graph2):
    n = len(graph1)
    vertices = list(range(n))

    for perm in itertools.permutations(vertices):
        is_iso = True

        for i in range(n):
            for j in range(n):
                if graph1[i][j] != graph2[perm[i]][perm[j]]:
                    is_iso = False
                    break
            if not is_iso:
                break

        if is_iso:
            return True, perm

    return False, None

def main():
    print("Wprowadź input to postaci: \n4\n0 1 1 0\n1 0 0 1\n1 0 0 1\n0 1 1 0\n4\n0 1 0 1\n1 0 1 0\n0 1 0 1\n1 0 1 0\n")
    n = int(input())
    graph1 = [list(map(int, input().split())) for _ in range(n)]

    m = int(input())
    graph2 = [list(map(int, input().split())) for _ in range(m)]

    is_iso, bijection = isomorphic(graph1, graph2)

    if is_iso:
        print("Izomorficzne. Bijekcja:")
        for i in range(n):
            print(f"{i + 1} -> {bijection[i] + 1}")
    else:
        print("Nie są izomorficzne.")

if __name__ == "__main__":
    main()
