{-# LANGUAGE DeriveGeneric #-}

module Types (
    -- PlayerStats (..),
    -- PlayerStat (..),
    -- Game (..),
    -- Player (..),
    -- Team (..),
    -- PlayerP (..),
    -- TeamP (..),
    -- Data (..)
    Pokemon (..),
    Pokemons (..),
    PokemonInfo (..),
    Candy (..),
    Spawn (..)

) where

import GHC.Generics

<<<<<<< HEAD
data PokemonInfo = PokemonInfo {
    name_ :: String,
    height_ :: String,
    weight_ :: String,
    fk_candy :: Int,
    fk_spawn :: Int
} deriving(Show)

data Candy = Candy {
    c_id :: Int,
    candy_ :: String
}deriving(Show)

data Spawn = Spawn {
    s_id :: Int,
    spawn_chance_ :: Float,
    avg_spawns_ :: Float
}deriving(Show)

data Pokemon = Pokemon {
    id :: Int,
    num :: String,
    name :: String,
    candy :: String,
    height :: String,
    weight :: String,
    spawn_chance :: Float,
    avg_spawns :: Float
} deriving(Show, Generic)
=======
data PlayerStats = PlayerStats {
    stats_id :: Int,
    ast :: Maybe Float,
    blk :: Maybe Float,
    dreb :: Maybe Float,
    fg3_pct :: Maybe Float,
    fg3a :: Maybe Float,
    fg3m :: Maybe Float,
    fg_pct :: Maybe Float,
    fga :: Maybe Float,
    fgm :: Maybe Float,
    ft_pct :: Maybe Float,
    fta :: Maybe Float,
    ftm :: Maybe Float,
    oreb :: Maybe Float,
    pf :: Maybe Float,
    pts :: Maybe Float,
    reb :: Maybe Float,
    stl :: Maybe Float,
    turnover :: Maybe Float
} deriving (Show,Generic)

data Game = Game {
    home_team_id :: Int,
    home_fullname :: String,
    visitor_team_id :: Int,
    visitor_fullname :: String,
    home_team_score :: Int,
    visitor_team_score :: Int
} deriving (Show)

data Player = Player {
    height_feet :: Int,
    height_inches :: Int,
    weight_pounds :: Int,
    last_name :: String,
    position :: String,
    fkteam_id :: Int 
} deriving (Show, Generic)

data Team = Team {
    team_id :: String,
    abbreviation :: String
} deriving (Show, Generic)
>>>>>>> 0741b3dbc162834be8e526bcccdf81f7ff02bb49

data Pokemons = Pokemons {
    pokemon :: [Pokemon]
} deriving(Show, Generic)

-- data PlayerStats = PlayerStats {
--     stats_id :: Int,
--     ast :: Maybe Int,
--     blk :: Maybe Int,
--     dreb :: Maybe Int,
--     fg3_pct :: Maybe Float,
--     fg3a :: Maybe Int,
--     fg3m :: Maybe Int,
--     fg_pct :: Maybe Float,
--     fga :: Maybe Int,
--     fgm :: Maybe Int,
--     ft_pct :: Maybe Float,
--     fta :: Maybe Int,
--     ftm :: Maybe Int,
--     oreb :: Maybe Int,
--     pf :: Maybe Int,
--     pts :: Maybe Int,
--     reb :: Maybe Int,
--     stl :: Maybe Int,
--     turnover :: Maybe Int,
--     player :: PlayerP
-- } deriving (Show,Generic)

-- data PlayerStat = PlayerStat {
--     stats_id_ :: Int,
--     ast_ :: Maybe Int,
--     blk_ :: Maybe Int,
--     dreb_ :: Maybe Int,
--     fg3_pct_ :: Maybe Float,
--     fg3a_ :: Maybe Int,
--     fg3m_ :: Maybe Int,
--     fg_pct_ :: Maybe Float,
--     fga_ :: Maybe Int,
--     turnover_ :: Maybe Int
-- } deriving (Show)

-- data PlayerP = PlayerP {
--     -- player_id :: Int,
--     first_name :: String,
--     height_feet :: Maybe Int,
--     height_inches :: Maybe Int,
--     weight_pounds :: Maybe Int,
--     last_name :: String,
--     position :: String,
--     team_id :: Int 
-- } deriving (Show, Generic)

-- data TeamP = TeamP {
--     -- fteam_id :: Int,
--     abbreviation :: String,
--     city :: String,
--     conference :: String,
--     division :: String,
--     full_name :: String,
--     name :: String
-- } deriving (Show, Generic)

-- data Game = Game {
--     game_id :: Int,
--     home_team_id :: Int,
--     home_fullname :: String,
--     visitor_team_id :: Int,
--     visitor_fullname :: String,
--     home_team_score :: Int,
--     visitor_team_score :: Int
-- } deriving (Show)

-- data Player = Player {
--     player_id_ :: Int,
--     first_name_ :: String,
--     height_feet_ :: Maybe Int,
--     height_inches_ :: Maybe Int,
--     weight_pounds_ :: Maybe Int,
--     last_name_ :: String,
--     position_ :: String,
--     fkteam_id_ :: Int 
-- } deriving (Show)

-- data Team = Team {
--     team_id_ :: Int,
--     abbreviation_ :: String,
--     city_ :: String,
--     conference_ :: String,
--     division_ :: String,
--     full_name_ :: String,
--     name_ :: String
-- } deriving (Show)

-- data Data = Data {
--     data1 :: [PlayerStats]
-- } deriving (Show, Generic)
