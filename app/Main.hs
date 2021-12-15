module Main where

import System.IO
import Lib
import Types
import Fetch
import Parse
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
    putStrLn "   (2) - Application Information   "
    putStrLn "   (0) - Exit Application          "
    putStrLn "                                   "
    putStrLn "-----------------------------------"
    putStrLn "                                   "
    --conn <- initialiseDB
    hSetBuffering stdout NoBuffering
    putStr " Enter Choice : "
    option <- readLn :: IO Int
    putStrLn " "
    case option of
        0 -> do
            print "                        "
            print "------------------------"
            print " Application Terminated "
            print "       Thank You        "
            print "------------------------"
            print "                        "

        1 -> do
            let url = "https://www.balldontlie.io/api/v1/stats.json"
            print "      Downloading Player Data      "
            json <- download url
            print "           Parsing Data            "
            --case (parseRecords json) of
            --    Left err -> print err
            --    Right recs -> do
            --        print "         Saving on Database        "
            --        saveRecords conn (records recs)
            --        print "             Data Saved            "
            main

        2 -> do
            print "-----------------------------------"
            print "  NATIONAL BASKETBALL ASSOCIATION  "
            print "-----------------------------------"
            --conn <- someFunc
            main

        otherwise -> do 
                    print "                        "
                    print "     Invalid Option     "
                    print "                        "
                    main
