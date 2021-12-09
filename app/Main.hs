module Main where

import System.IO
import Lib
--import Types
--import Fetch
--import Parse
--import Database

main :: IO ()
main = do
    putStrLn "-----------------------------------"
    putStrLn "  NATIONAL BASKETBALL ASSOCIATION  "
    putStrLn "   (1) - Download Player Data      "
    putStrLn "   (4) - Exit Application          "
    putStrLn "-----------------------------------"
    --conn <- initialiseDB
    hSetBuffering stdout NoBuffering
    putStr "Enter Choice : "
    option <- readLn :: IO Int
    case option of
        4 -> print " Application Terminated "
             --print "       Thank You        "
        otherwise -> print " Invalid Option "
