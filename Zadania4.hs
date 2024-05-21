-- Zadanie 1

-- Funkcja, która podwaja wartość argumentu
double = \x -> x * 2

-- Funkcja, która zwraca kwadrat argumentu
square = \x -> x * x

-- Funkcje dwóch zmiennych

-- Funkcja, która dodaje dwie wartości
add = \x y -> x + y

-- Funkcja, która zwraca większą z dwóch wartości
max' = \x y -> if x > y then x else y

-- Funkcje trzech zmiennych

-- Funkcja, która zwraca sumę trzech wartości
sumThree = \x y z -> x + y + z

-- Funkcja, która zwraca najmniejszą z trzech wartości
minThree = \x y z -> if x < y && x < z then x else if y < z then y else z




-- Zadanie 2
-- Definicja typu Moto z pięcioma różnymi markami samochodów
data Moto = Audi | BMW | Mercedes | Toyota | Honda deriving (Show, Eq)

-- Synonim typu [Char] dla kraju
type Kraj = [Char]

-- Funkcja przypisująca krajowi markę samochodu
markaKraju :: Kraj -> Moto
markaKraju kraj = case kraj of
    "Niemcy"   -> Audi
    "Japonia"  -> Toyota
    "USA"      -> Ford -- Zakładamy, że dodajemy markę Ford jako dodatkową
    "Włochy"   -> Ferrari -- Zakładamy, że dodajemy markę Ferrari jako dodatkową
    "Korea"    -> Hyundai -- Zakładamy, że dodajemy markę Hyundai jako dodatkową
    _          -> error "Nieznany kraj"

-- Funkcja przypisująca maksymalną prędkość marce samochodu
maxPredkosc :: Moto -> Int
maxPredkosc marka = case marka of
    Audi     -> 250
    BMW      -> 240
    Mercedes -> 260
    Toyota   -> 210
    Honda    -> 220


-- Zadanie 3
-- Definicja typu Uczelnia z pięcioma różnymi uczelniami w Polsce
data Uczelnia = UW | UJ | PWr | PP | UAM deriving (Show, Eq)

-- Funkcja przypisująca uczelni rok powstania i miasto
daneUczelni :: Uczelnia -> (Int, String)
daneUczelni uczelnia = case uczelnia of
    UW  -> (1816, "Warszawa")
    UJ  -> (1364, "Kraków")
    PWr -> (1945, "Wrocław")
    PP  -> (1919, "Poznań")
    UAM -> (1919, "Poznań")



-- Zadanie 4
-- Definicja typu drzewa binarnego
data Tree a = Empty
            | Node a (Tree a) (Tree a)
            deriving (Show, Eq)

-- Funkcje przechodzenia drzewa

-- Przejście preorder (root, left, right)
preorder :: Tree a -> [a]
preorder Empty = []
preorder (Node x left right) = [x] ++ preorder left ++ preorder right

-- Przejście inorder (left, root, right)
inorder :: Tree a -> [a]
inorder Empty = []
inorder (Node x left right) = inorder left ++ [x] ++ inorder right

-- Przejście postorder (left, right, root)
postorder :: Tree a -> [a]
postorder Empty = []
postorder (Node x left right) = postorder left ++ postorder right ++ [x]

-- Definicja przykładowych drzew

-- Drzewo z rysunku a
tree1 :: Tree Int
tree1 = Node 1
            (Node 2
                (Node 4 Empty Empty)
                (Node 5
                    (Node 8 Empty Empty)
                    Empty
                )
            )
            (Node 3
                (Node 6
                    (Node 9 Empty Empty)
                    Empty
                )
                (Node 7 Empty Empty)
            )

-- Drzewo z rysunku b
tree2 :: Tree Char
tree2 = Node 'a'
            (Node 'b'
                (Node 'd'
                    (Node 'f' Empty Empty)
                    Empty
                )
                Empty
            )
            (Node 'c'
                (Node 'e' Empty Empty)
                (Node 'g' Empty Empty)
            )


-- Zadanie 5

-- Funkcja treeMember z użyciem elem
treeMemberElem :: (Eq a) => a -> Tree a -> Bool
treeMemberElem x tree = x `elem` inorder tree

-- Funkcja treeMember bez użycia elem
treeMember :: (Eq a) => a -> Tree a -> Bool
treeMember _ Empty = False
treeMember x (Node y left right)
    | x == y    = True
    | otherwise = treeMember x left || treeMember x right


-- Zadanie 6

-- Definicja typu drzewa binarnego
data Tree a = Empty
            | Node a (Tree a) (Tree a)
            deriving (Show, Eq)

-- Funkcja sprawdzająca, czy dwa drzewa są równe
drzewaRowne :: (Eq a) => Tree a -> Tree a -> Bool
drzewaRowne Empty Empty = True
drzewaRowne (Node x left1 right1) (Node y left2 right2) =
    x == y && drzewaRowne left1 left2 && drzewaRowne right1 right2
drzewaRowne _ _ = False

-- Definicja typu drzewa binarnego
data Tree a = Empty
            | Node a (Tree a) (Tree a)
            deriving (Show, Eq)

-- Funkcja sprawdzająca, czy dwa drzewa są równe
drzewaRowne :: (Eq a) => Tree a -> Tree a -> Bool
drzewaRowne Empty Empty = True
drzewaRowne (Node x left1 right1) (Node y left2 right2) =
    x == y && drzewaRowne left1 left2 && drzewaRowne right1 right2
drzewaRowne _ _ = False

-- Funkcja sprawdzająca, czy jedno drzewo jest poddrzewem drugiego
poddrzewo :: (Eq a) => Tree a -> Tree a -> Bool
poddrzewo subTree Empty = subTree == Empty
poddrzewo subTree (Node x left right) =
    drzewaRowne subTree (Node x left right) || poddrzewo subTree left || poddrzewo subTree right


