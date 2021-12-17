module Parse (
    parseRecords,
) where

import Types
import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as T


instance FromJSON Pokemons

instance FromJSON Pokemon
        

parsePokemon :: T.ByteString -> Either String Pokemons
parsePokemon json = eitherDecode json :: Either String Pokemons