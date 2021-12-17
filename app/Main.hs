module Main where

import System.IO
import Types
import Fetch
import Parse
import Database
import Lib

main :: IO ()
main = do
    putStrLn "                                   "
    putStrLn "-----------------------------------"
    putStrLn " FIRST GENERATION POKEMON POKEDEX  "
    putStrLn "           POKEMON DATA            "
    putStrLn "-----------------------------------"
    putStrLn "                                   "
    putStrLn "   (1) - Download Pokemon Data     "
    putStrLn "   (2) - Show All Pokemon          "
    putStrLn "   (3) - Application Information   "
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
            let url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"
            print "      Downloading Pokemon Data     "
            json <- download url
            print "           Parsing Data            "
            case (parsePokemon json) of
                Left err -> print err
                Right poke -> do
                    print "         Saving on Database        "
                    savePokemonInfo conn (pokemon poke)
                    print "             Data Saved            "
                    main
        2 -> do
            entries <- queryCandyAllPokemon conn
            mapM_ print entries
            main

        3 -> do
            conn <- someFunc
            main

        otherwise -> do 
                    print "                        "
                    print "     Invalid Option     "
                    print "                        "
                    main