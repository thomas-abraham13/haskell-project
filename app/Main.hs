module Main where

import System.IO
import Lib
--import Types
--import Fetch
--import Parse
--import Database

main :: IO ()
main = do
    putStrLn "                                   "
    putStrLn "-----------------------------------"
    putStrLn "  NATIONAL BASKETBALL ASSOCIATION  "
    putStrLn "            PLAYER DATA            "
    putStrLn "-----------------------------------"
    putStrLn "                                   "
    putStrLn "   (1) - Download Player Data      "
    putStrLn "   (0) - Exit Application          "
    putStrLn "                                   "
    putStrLn "-----------------------------------"
    putStrLn "                                   "
    --conn <- initialiseDB
    hSetBuffering stdout NoBuffering
    putStr "Enter Choice : "
    option <- readLn :: IO Int
    case option of
        0 -> do
             print "                        "
             print "------------------------"
             print " Application Terminated "
             print "       Thank You        "
             print "------------------------"
             print "                        "

        otherwise -> do 
                     print " Invalid Option " 
                     main
