module Parse (
    parseRecords,
) where

import Types
import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as T

--renameFields "team_id" = "team_id"
--renameFields "abbreviation" = "abbreviation"
--renameFields "city" = "city"
--renameFields "conference" = "conference"
--renameFields "division" = "division"
--renameFields "full_name" = "full_name"
--renameFields "name" = "name"

renameFields "stats_id" = "id"
renameFields "ast" = "ast"
renameFields "blk" = "blk"
renameFields "dreb" = "dreb"
renameFields "fgt3_pct" = "fgt3_pct"
renameFields "fg3a" = "fg3a"
renameFields "fg3m" = "fg3m"
renameFields "fg_pct" = "fg_pct"
renameFields "fga" = "fga"
renameFields "fgm" = "fgm"
renameFields "ft_pct" = "ft_pct"
renameFields "fta" = "fta"
renameFields "ftm" = "ftm"
renameFields "oreb" = "oreb"
renameFields "pf" = "pf"
renameFields "pts" = "pts"
renameFields "reb" = "reb"
renameFields "stl" = "stl"
renameFields "turnover" = "turnover"
renameFields other = other

customOptions = defaultOptions {
    fieldLabelModifier = renameFields
}

instance FromJSON PlayerStats where
    parseJSON = genericParseJSON customOptions

instance FromJSON Records

parseRecords :: T.ByteString -> Either String Records
parseRecords json = eitherDecode json :: Either String Records