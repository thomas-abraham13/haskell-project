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

data Data = Data {
    data1 :: [PlayerStats]
} deriving (Show, Generic)
