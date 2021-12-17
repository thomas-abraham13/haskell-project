module Parse (
    parsePokemon,
) where

import Types
import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as T

instance FromJSON Pokemons

instance FromJSON Pokemon
-- |Parses json file
parsePokemon :: T.ByteString -> Either String Pokemons
parsePokemon json = eitherDecode json :: Either String Pokemons