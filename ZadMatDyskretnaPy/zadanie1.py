
def check(n: int):
    if n >= 10:
        return 9
    return n

letters: list = ['U', 'V', 'W', 'X', 'Y', 'Z']
numbers: list = []
codes: list = []
subtasks = ["a","b","c","d"]

def chosesubtask(task,n):
    if (task in subtasks):
        print(int(codecounter(task,n)))
    else:
        print("Wprowadź poprawna nazwe podpunktu np: a")
        chosesubtask(input(),n)


def codecounter(task,n):
    letters, codes, numbers
    for number in range(0, n + 1):
        numbers.append(str(number))
    if(task == "a"):
        for l1 in letters:
            for l2 in letters:
                for n1 in numbers:
                    codes.append('0' + l1 + n1 + l2)
                    codes.append('0' + l1 + l2 + n1)
                    codes.append('0' + n1 + l1 + l2)
        return(len(codes))
    if(task == "b"):
        for l1 in letters:
            for l2 in letters:
                for n1 in numbers:
                    for n2 in numbers:
                        codes.append(l2 + l1 + n1 + n2)
                        codes.append(n1 + l1 + n2 + l2)
                        codes.append(n1 + l1 + l2 + n1)
        return(len(codes))
    if(task == "c"):
        for l1 in letters:
            for l2 in letters:
                for n1 in numbers:
                    for n2 in numbers:
                        codes.append(n1 + l1 + n2 + l2)
                        codes.append(n1 + l1 + l2 + n1)
        return(len(codes))
    if(task == "d"):
        for l1 in letters:
            for l2 in letters:
                for n1 in numbers:
                    for n2 in numbers:
                        codes.append(l1 + n1 + l2 + n2)
                        codes.append(l1 + n1 + n2 + l2)
                        codes.append(l1 + l2 + n1 + n2)
                        codes.append(n1 + l1 + n2 + l2)
                        codes.append(n1 + l1 + l2 + n2)
        return(len(codes))



print("Wprowadź wartość n: ")
n=check(int(input()))
print("Wynik jakiego podpunktu chcesz poznać: \na) pierwszy znak kodu to 0, \nb) drugi znak kodu to litera,\nc) pierwszy znak kodu to cyfra, a drugi znak to litera,\nd) pierwszy lub drugi znak kodu to litera.")
chosesubtask(input(),int(n))
