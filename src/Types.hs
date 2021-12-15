{-# LANGUAGE DeriveGeneric #-}

module Types (
    PlayerStats (..),
    Game (..),
    Player (..),
    Team (..),
    Data (..)
) where

import GHC.Generics

data PlayerStats = PlayerStats {
    stats_id :: Int,
    ast :: Int,
    blk :: Int,
    dreb :: Int,
    fg3_pct :: Float,
    fg3a :: Int,
    fg3m :: Int,
    fg_pct :: Float,
    fga :: Int,
    fgm :: Int,
    ft_pct :: Float,
    fta :: Int,
    ftm :: Int,
    oreb :: Int,
    pf :: Int,
    pts :: Int,
    reb :: Int,
    stl :: Int,
    turnover :: Int
} deriving (Show,Generic)

data Game = Game {
    game_id :: Int,
    home_team_id :: Int,
    home_fullname :: String,
    visitor_team_id :: Int,
    visitor_fullname :: String,
    home_team_score :: Int,
    visitor_team_score :: Int
} deriving (Show)

data Player = Player {
    player_id :: Int,
    first_name :: String,
    height_feet :: Int,
    height_inches :: Int,
    weight_pounds :: Int,
    last_name :: String,
    position :: String,
    fkteam_id :: Int 
} deriving (Show, Generic)

data Team = Team {
    team_id :: Int,
    abbreviation :: String,
    city :: String,
    conference :: String,
    division :: String,
    full_name :: String,
    name :: String
} deriving (Show, Generic)

data Data = Data {
    data1 :: [PlayerStats]
} deriving (Show, Generic)
