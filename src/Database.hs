{-# LANGUAGE OverloadedStrings #-}

-- or, on GHCI:
-- > :set -XOverloadedStrings

module Database (
    initialiseDB,
    savePokemonInfo,
    getOrCreateSpawn,
    queryCandyAllPokemon
) where

import Types
import Control.Applicative
import Database.SQLite.Simple
import Database.SQLite.Simple.Internal
import Database.SQLite.Simple.FromRow
import Database.SQLite.Simple.ToRow

-- See more Database.SQLite.Simple examples at
-- https://hackage.haskell.org/package/sqlite-simple-0.4.18.0/docs/Database-SQLite-Simple.html

instance FromRow Pokemon where
    fromRow = Pokemon <$> field <*> field <*> field <*> field <*> field <*> field <*> field <*> field

instance FromRow PokemonInfo where
    fromRow = PokemonInfo <$> field <*> field <*> field <*> field <*> field

instance ToRow PokemonInfo where
    toRow (PokemonInfo name_ height_ weight_ fk_candy fk_spawn)
        = toRow (name_, height_, weight_, fk_candy, fk_spawn)

instance FromRow Candy where
    fromRow = Candy <$> field <*> field

instance ToRow Candy where
    toRow (Candy c_id candy_)
        = toRow (c_id, candy_)

instance FromRow Spawn where
    fromRow = Spawn <$> field <*> field <*> field

instance ToRow Spawn where
    toRow (Spawn s_id spawn_chance_ avg_spawns_)
        = toRow (s_id, spawn_chance_, avg_spawns_)

initialiseDB :: IO Connection
initialiseDB = do
        conn <- open "pokemonDatabase.sqlite"
        execute_ conn "CREATE TABLE IF NOT EXISTS pokemonInfo (\
            \name VARCHAR(80) NOT NULL, \ 
            \height VARCHAR(80) NOT NULL, \ 
            \weight VARCHAR(80) NOT NULL, \ 
            \fk_candy INTEGER, \ 
            \fk_spawn INTEGER \ 
            \)"
        execute_ conn "CREATE TABLE IF NOT EXISTS candies (\
            \id INTEGER PRIMARY KEY AUTOINCREMENT,\
            \candyType VARCHAR(80) NOT NULL \ 
            \)"
        execute_ conn "CREATE TABLE IF NOT EXISTS spawns (\
            \id INTEGER PRIMARY KEY AUTOINCREMENT,\
            \spawn_chance FLOAT DEFAULT NULL, \ 
            \avg_spawns FLOAT DEFAULT NULL \ 
            \)"
        
        return conn

getOrCreateCandy :: Connection -> String -> IO Candy
getOrCreateCandy conn candy = do
    results <- queryNamed conn "SELECT * FROM candies WHERE candyType=:candy" [":candy" := candy]    
    if length results > 0 then
        return . head $ results
    else do
        execute conn "INSERT INTO candies (candyType) VALUES (?)" (Only (candy))
        getOrCreateCandy conn candy

getOrCreateSpawn :: Connection -> Float -> Float -> IO Spawn
getOrCreateSpawn conn spawn_chance avg_spawns = do
    results <- queryNamed conn "SELECT * FROM spawns WHERE spawn_chance=:spawn_chance AND avg_spawns=:avg_spawns" [":spawn_chance" := spawn_chance, ":avg_spawns" := avg_spawns]    
    if length results > 0 then
        return . head $ results
    else do
        execute conn "INSERT INTO spawns (spawn_chance, avg_spawns) VALUES (?,?)" (spawn_chance, avg_spawns)
        getOrCreateSpawn conn spawn_chance avg_spawns

createPokemonInfo :: Connection -> Pokemon -> IO ()
createPokemonInfo conn pokemon = do
    candy <- getOrCreateCandy conn (candy pokemon)
    spawn <- getOrCreateSpawn conn (spawn_chance pokemon) (avg_spawns pokemon)
    let pokemonInfo = PokemonInfo {
        name_ = name pokemon,
        height_ = height pokemon,
        weight_ = weight pokemon,
        fk_candy = c_id candy,
        fk_spawn = s_id spawn
    }
    execute conn "INSERT INTO pokemonInfo VALUES (?,?,?,?,?)" pokemonInfo

savePokemonInfo :: Connection -> [Pokemon] -> IO ()
savePokemonInfo conn = mapM_ (createPokemonInfo conn)

-- queryAllPokemons :: Connection -> IO [PokemonInfo]
-- queryAllPokemons conn = do
--     putStrLn "Finding all Pokemons from GEN 1"
--     let sql = "SELECT * from pokemonInfo"
--     query conn sql

queryCandyAllPokemon :: Connection -> IO [PokemonInfo]
queryCandyAllPokemon conn = do
    putStr "Enter candy name > "
    candyName <- getLine
    putStrLn $ "Looking for " ++ candyName ++ " Pokemon..."
    let sql = "SELECT name, height, weight, fk_candy, fk_spawn FROM pokemonInfo inner join candies on pokemonInfo.fk_candy == candies.id WHERE candyType=?"
    query conn sql [candyName]

-- queryCountryTotalCases :: Connection -> IO ()
-- queryCountryTotalCases conn = do
--     countryEntries <- queryCountryAllEntries conn
--     let total = sum (map cases countryEntries)
--     print $ "Total entries: " ++ show(total)
