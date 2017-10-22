-- 1.
-- Define a recursive multiplication function for the recursive type of natural
-- numbers.
data Nat = Zero | Succ Nat deriving Show

nat2int :: Nat -> Int
nat2int Zero     = 0
nat2int (Succ n) = 1 + nat2int n

int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat n = Succ (int2nat (n-1))

add :: Nat -> Nat -> Nat
add Zero n     = n
add (Succ m) n = Succ (add m n)

mult :: Nat -> Nat -> Nat
mult Zero _     = Zero
mult _ Zero     = Zero
mult (Succ m) n = add (Succ m) (mult m n)

-- 2.
-- Together with `compare`, define the function `occurs` for search trees.
-- compare :: Ord a => a -> a -> Ordering
data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving Show

flatten :: Tree a -> [a]
flatten (Leaf x)     = [x]
flatten (Node l x r) = flatten l ++ [x] ++ flatten r

occurs :: Ord a => a -> Tree a -> Bool
occurs x (Leaf y)                 = x == y
occurs x (Node l y r) | x == y    = True
                      | x < y     = occurs x l
                      | otherwise = occurs x r

occurs' :: Ord a => a -> Tree a -> Bool
occurs' x (Leaf y) = compare x y == EQ
occurs' x (Node l y r) | compare x y == EQ = True
                       | compare x y == LT = occurs' x l
                       | otherwise         = occurs' x r


