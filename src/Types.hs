{-# LANGUAGE DeriveGeneric #-}

module Types (
    Pokemon (..),
    Pokemons (..),
    PokemonInfo (..),
    Candy (..),
    Spawn (..)
) where

import GHC.Generics

-- |Data containing various pokemon info and their data types
data PokemonInfo = PokemonInfo {
    num_ :: String,
    name_ :: String,
    height_ :: String,
    weight_ :: String,
    fk_candy :: Int,
    fk_spawn :: Int
} deriving(Show)

-- |Data containing various pokemon candy and their data types
data Candy = Candy {
    c_id :: Int,
    candy_ :: String
}deriving(Show)

-- |Data containing various pokemon spawn rates and their data types
data Spawn = Spawn {
    s_id :: Int,
    spawn_chance_ :: Float,
    avg_spawns_per_10000 :: Float
}deriving(Show)

-- |Data containing various and their data types
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

data Pokemons = Pokemons {
    pokemon :: [Pokemon]
} deriving(Show, Generic)

