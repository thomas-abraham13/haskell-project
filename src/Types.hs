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
    ast :: Maybe Int,
    blk :: Maybe Int,
    dreb :: Maybe Int,
    fg3_pct :: Maybe Float,
    fg3a :: Maybe Int,
    fg3m :: Maybe Int,
    fg_pct :: Maybe Float,
    fga :: Maybe Int,
    fgm :: Maybe Int,
    ft_pct :: Maybe Float,
    fta :: Maybe Int,
    ftm :: Maybe Int,
    oreb :: Maybe Int,
    pf :: Maybe Int,
    pts :: Maybe Int,
    reb :: Maybe Int,
    stl :: Maybe Int,
    turnover :: Maybe Int
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
} deriving (Show, Generic)

data Data = Data {
    data1 :: [PlayerStats]
} deriving (Show, Generic)
