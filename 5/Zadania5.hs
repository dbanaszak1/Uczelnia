-- Zadanie 1
import Data.List (group, sort)

countOccurrences :: (Eq a, Ord a) => [a] -> [(a, Int)]
countOccurrences xs = map (\ys -> (head ys, length ys)) . group . sort $ xs

-- Zadanie 2
module Mojzbior (
    iloczyn,
    suma,
    roznica,
    podzbior
) where

iloczyn :: (Eq a) => [a] -> [a] -> [a]
iloczyn xs ys = [x | x <- xs, x `elem` ys]

suma :: (Eq a) => [a] -> [a] -> [a]
suma xs ys = xs ++ [y | y <- ys, y `notElem` xs]

roznica :: (Eq a) => [a] -> [a] -> [a]
roznica xs ys = [x | x <- xs, x `notElem` ys]

podzbior :: (Eq a) => [a] -> [a] -> Bool
podzbior xs ys = all (`elem` ys) xs

-- Zadanie 3
minBranchLength :: Tree a -> Int
minBranchLength Empty = 0
minBranchLength (Node _ left right) = 1 + min (minBranchLength left) (minBranchLength right)

-- Zadanie 4
data TernaryTree a = Empty
                   | Node a (TernaryTree a) (TernaryTree a) (TernaryTree a)
                   deriving (Show, Eq)

sumTernaryTree :: Num a => TernaryTree a -> a
sumTernaryTree Empty = 0
sumTernaryTree (Node value left middle right) =
    value + sumTernaryTree left + sumTernaryTree middle + sumTernaryTree right

-- Zadanie 5
class Nazwisko a where
    getSurname :: a -> String

data Imie = Imie { imie :: String, nazwisko :: String }

instance Nazwisko Imie where
    getSurname (Imie _ nazwisko) = nazwisko

pełneImię :: Imie -> String
pełneImię (Imie imie nazwisko) = imie ++ " " ++ nazwisko

main :: IO ()
main = do
    let osoba = Imie { imie = "Dominik", nazwisko = "Banaszak" }
    putStrLn $ pełneImię osoba
    putStrLn $ getSurname osoba