{-# LANGUAGE DeriveGeneric #-}

module Types (
    Pokemon (..),
    Pokemons (..),
    PokemonInfo (..),
    Candy (..),
    Spawn (..)
) where

import GHC.Generics

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

data Pokemons = Pokemons {
    pokemon :: [Pokemon]
} deriving(Show, Generic)