module Parse (
--    parseRecords,
) where

--import Types
import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as T

renameFields other = other

customOptions = defaultOptions {
    fieldLabelModifier = renameFields
}

--instance FromJSON Record where
--    parseJSON = genericParseJSON customOptions

--instance FromJSON Read

--parseRecords :: T.ByteString -> Either String Records
--parseRecords json = eitherDecode json :: Either String Records