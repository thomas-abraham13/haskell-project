module Parse (
    parseRecords,
) where

import Types
import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as T

<<<<<<< HEAD
=======

>>>>>>> 5db73b3b790700a6402fa4816643185f4cae42b4
instance FromJSON Pokemons

instance FromJSON Pokemon
        

parsePokemon :: T.ByteString -> Either String Pokemons
parsePokemon json = eitherDecode json :: Either String Pokemons