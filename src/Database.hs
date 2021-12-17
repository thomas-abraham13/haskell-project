{-# LANGUAGE OverloadedStrings #-}

-- or, on GHCI:
-- > :set -XOverloadedStrings

-- |Module Database that contains functions that operate on the database pokemonDatabase.sqlite
module Database (
    initialiseDB,
    savePokemonInfo,
    getOrCreateSpawn,
    queryCandyAllPokemon,
    getPokemons,
    getCandy,
    getSpawn
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
    fromRow = PokemonInfo <$> field <*> field <*> field <*> field <*> field <*> field

instance ToRow PokemonInfo where
    toRow (PokemonInfo num_ name_ height_ weight_ fk_candy fk_spawn)
        = toRow (num_, name_, height_, weight_, fk_candy, fk_spawn)

instance FromRow Candy where
    fromRow = Candy <$> field <*> field

instance ToRow Candy where
    toRow (Candy c_id candy_)
        = toRow (c_id, candy_)

instance FromRow Spawn where
    fromRow = Spawn <$> field <*> field <*> field

instance ToRow Spawn where
    toRow (Spawn s_id spawn_chance_ avg_spawns_per_10000)
        = toRow (s_id, spawn_chance_, avg_spawns_per_10000)

-- |Method to create the database pokemonDatabase.sqlite
initialiseDB :: IO Connection
initialiseDB = do
        conn <- open "pokemonDatabase.sqlite"
        execute_ conn "CREATE TABLE IF NOT EXISTS pokemonInfo (\
            \number VARCHAR(10) NOT NULL, \ 
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
            \avg_spawns_per_10000 FLOAT DEFAULT NULL \ 
            \)"
        
        return conn

-- |Method which inserts Candy into table
getOrCreateCandy :: Connection -> String -> IO Candy
getOrCreateCandy conn candy = do
    results <- queryNamed conn "SELECT * FROM candies WHERE candyType=:candy" [":candy" := candy]    
    if length results > 0 then
        return . head $ results
    else do
        execute conn "INSERT INTO candies (candyType) VALUES (?)" (Only (candy))
        getOrCreateCandy conn candy

-- |Method which inserts spawn rates into table
getOrCreateSpawn :: Connection -> Float -> Float -> IO Spawn
getOrCreateSpawn conn spawn_chance avg_spawns = do
    results <- queryNamed conn "SELECT * FROM spawns WHERE spawn_chance=:spawn_chance AND avg_spawns=:avg_spawns" [":spawn_chance" := spawn_chance, ":avg_spawns" := avg_spawns]    
    if length results > 0 then
        return . head $ results
    else do
        execute conn "INSERT INTO spawns (spawn_chance, avg_spawns_per_10000) VALUES (?,?)" (spawn_chance, avg_spawns)
        getOrCreateSpawn conn spawn_chance avg_spawns

-- |Method which inserts variouos pokemon info into table
createPokemonInfo :: Connection -> Pokemon -> IO ()
createPokemonInfo conn pokemon = do
    candy <- getOrCreateCandy conn (candy pokemon)
    spawn <- getOrCreateSpawn conn (spawn_chance pokemon) (avg_spawns pokemon)
    let pokemonInfo = PokemonInfo {
        num_ = num pokemon,
        name_ = name pokemon,
        height_ = height pokemon,
        weight_ = weight pokemon,
        fk_candy = c_id candy,
        fk_spawn = s_id spawn
    }
    execute conn "INSERT INTO pokemonInfo VALUES (?,?,?,?,?,?)" pokemonInfo

savePokemonInfo :: Connection -> [Pokemon] -> IO ()
savePokemonInfo conn = mapM_ (createPokemonInfo conn)

-- |Method which queries pokemon based on candy name inputted
queryCandyAllPokemon :: Connection -> IO [PokemonInfo]
queryCandyAllPokemon conn = do
    putStr "Enter candy name > "
    candyName <- getLine
    putStrLn $ "Looking for " ++ candyName ++ " Pokemon..."
    let sql = "SELECT number, name, height, weight, fk_candy, fk_spawn FROM pokemonInfo inner join candies on pokemonInfo.fk_candy == candies.id WHERE candyType=?"
    query conn sql [candyName]

-- |Method which prints Pokemon table
getPokemons :: Connection -> IO [PokemonInfo]
getPokemons conn = do
    query_ conn "SELECT * FROM pokemonInfo"

-- |Method which prints Candy table
getCandy :: Connection -> IO [Candy]
getCandy conn = do
    query_ conn "SELECT * FROM candies"

-- |Method which prints Spawn table
getSpawn :: Connection -> IO [Spawn]
getSpawn conn = do
    query_ conn "SELECT * FROM spawns"

