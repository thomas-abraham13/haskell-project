module Parse (
    parseRecords
) where

import Types
import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as T

--renameFields "date" = "dateRep"
renameFields "record_id" = "id"
renameFields "assists" = "ast"
renameFields "blocks" = "blk"
renameFields "points" = "pts"
renameFields "rebounds" = "reb"
renameFields "steals" = "stl"
renameFields "turnovers" = "turnover"
renameFields other = other

customOptions = defaultOptions {
    fieldLabelModifier = renameFields
}

instance FromJSON Player where
    parseJSON = genericParseJSON customOptions

instance FromJSON Team

parseRecords :: T.ByteString -> Either String Team
parseRecords json = eitherDecode json :: Either String Team