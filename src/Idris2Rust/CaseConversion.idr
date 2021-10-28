module Idris2Rust.CaseConversion

import Data.String
import Data.List
import Data.List1

-- NOTE: Maybe add another cases and move to separate library?
export
data IdentifierCase = Camel | Snake | UpperSnake

splitBy : (a -> Bool) -> List a -> List (List1 a)
splitBy p = groupBy (const (not . p))

toCharacterCase : Char -> List String -> String
toCharacterCase c cs = pack $ intercalate [c] (map (unpack . toLower) cs)

fromCharacterCase : Char -> String -> List String
fromCharacterCase c cs = toList $ split (==c) cs

export
fromCase : IdentifierCase -> String -> List String
fromCase Camel = map (pack . toList) . splitBy isUpper . unpack
fromCase Snake = fromCharacterCase '_'
fromCase UpperSnake = fromCharacterCase '_'

export
toCase : IdentifierCase -> List String -> String
-- fromCase Camel = map (pack . toList) . splitBy isUpper . unpack
toCase Snake xs = toLower $ toCharacterCase '_' xs
toCase UpperSnake xs = toUpper $ toCharacterCase '_' xs
toCase Camel [] = ""
toCase Camel (x::xs) = concat (toLower x :: map capitalize xs)
  where
    capitalize : String -> String
    capitalize s = case unpack s of
        (head::tail) => strCons (toUpper head) (toLower . pack $ tail)
        [] => ""

export
fromToCase : IdentifierCase -> IdentifierCase -> String -> String
fromToCase from to = toCase to . fromCase from
