module Main where

import System.Random

data Game = Continue Int | Clear

mainLoop :: Game -> IO ()
mainLoop (Clear) = putStrLn "Bingo!"
mainLoop (Continue answer) = do
    line <- getLine
    case read line of
        x | x < answer -> do putStrLn "the number is more big"
                             mainLoop (Continue answer)
          | x > answer -> do putStrLn "the number is more small"
                             mainLoop (Continue answer)
          | otherwise  -> do mainLoop (Clear)

main = do
    print "Please apply a random number from 1 to 100."
    randNum <- randomRIO (0,100)
    mainLoop (Continue randNum)
