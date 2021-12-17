module Main where

import System.IO
import Types
import Fetch
import Parse
import Database

main :: IO ()
main = do
    putStrLn "                                   "
    putStrLn "                                   "
    putStrLn "-----------------------------------"
    putStrLn " FIRST GENERATION POKEMON POKEDEX  "
    putStrLn "           POKEMON DATA            "
    putStrLn "-----------------------------------"
    putStrLn "                                   "
<<<<<<< HEAD
    putStrLn "   (1) - Download Pokemon Data     "
    putStrLn "   (2) - Show All Pokemon          "
    putStrLn "   (3) - Application Information   "
=======
    putStrLn "   (1) - Download Player Data      "
    putStrLn "   (2) - Application Information   "
    putStrLn "   (3) - All Entries By Player     "
    putStrLn "   (4) - Total Statistics By Player"
>>>>>>> 0741b3dbc162834be8e526bcccdf81f7ff02bb49
    putStrLn "   (0) - Exit Application          "
    putStrLn "                                   "
    putStrLn "-----------------------------------"
    putStrLn "                                   "
    conn <- initialiseDB
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
<<<<<<< HEAD
            -- let url = "https://www.balldontlie.io/api/v1/stats.json"
            let url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"
=======
            let url = "https://jsonkeeper.com/b/48ZK"
>>>>>>> 0741b3dbc162834be8e526bcccdf81f7ff02bb49
            print "      Downloading Player Data      "
            json <- download url
            print "           Parsing Data            "
            case (parseRecords json) of
                Left err -> print err
                Right poke -> do
                    print "         Saving on Database        "
                    savePokemonInfo conn (pokemon poke)
                    print "             Data Saved            "
                    main
        2 -> do
<<<<<<< HEAD
            entries <- queryCandyAllPokemon conn
            print "Queried"
            mapM_ print entries
            main
        3 -> do
            print "------------------------------------------"
            print "  FIRST GENERATION POKEMON GAMES POKEDEX  "
            print "------------------------------------------"
=======
            print "-----------------------------------"
            print "  NATIONAL BASKETBALL ASSOCIATION  "
            print "            PLAYER DATA            "
            print "-----------------------------------"
>>>>>>> 0741b3dbc162834be8e526bcccdf81f7ff02bb49
            --conn <- someFunc
            main

        3 -> do
            print "-----------------------------------"
            print "         PLAYER STATISTICS         "
            print "-----------------------------------"
            main

        4 -> do
            print "-----------------------------------"
            print "         TOTAL PLAYER DATA         "
            print "-----------------------------------"
            main

        otherwise -> do 
                    print "                        "
                    print "     Invalid Option     "
                    print "                        "
                    main
