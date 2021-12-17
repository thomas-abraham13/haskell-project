-- |Module that performs http request
module Fetch (
    download
) where

import qualified Data.ByteString.Lazy.Char8 as T
import Network.HTTP.Simple

type URL = String

download :: URL -> IO T.ByteString
download url = do
    request <- parseRequest url
    response <- httpLBS request
    return $ getResponseBody response