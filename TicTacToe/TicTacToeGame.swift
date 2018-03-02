//
//  TicTacToeGame.swift
//  TicTacToe
//
//  Created by David Fisher on 3/2/18.
//  Copyright © 2018 David Fisher. All rights reserved.
//

import UIKit

class TicTacToeGame: CustomStringConvertible {

  enum MarkType: String {
    case none = "-"
    case x = "X"
    case o = "O"
  }

  enum GameState: String {
    case xTurn = "X's Turn"
    case oTurn = "O's Turn"
    case xWon = "X Wins!"
    case oWon = "O Wins!"
    case tie = "Tie Game"
  }

  var gameBoard: [MarkType]
  var gameState: GameState

  init() {
    gameBoard = [MarkType](repeating: .none, count: 9)
    gameState = .xTurn
  }

  func pressedSquare(_ index: Int) {
    if gameBoard[index] != .none {
      return
    }
    if gameState == .xTurn {
      gameBoard[index] = .x
      gameState = .oTurn
      checkForGameOver()
    } else if gameState == .oTurn {
      gameBoard[index] = .o
      gameState = .xTurn
      checkForGameOver()
    }
  }

  func getGameString(_ indicies: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8]) -> String {
    var gameString = ""
    for index in indicies {
      gameString += gameBoard[index].rawValue
    }
    return gameString
  }

  func checkForGameOver() {
    if !gameBoard.contains(.none) {
      gameState = .tie
    }
    var linesOf3 = [String]()
    linesOf3.append(getGameString([0, 1, 2]))
    linesOf3.append(getGameString([3, 4, 5]))
    linesOf3.append(getGameString([6, 7, 8]))
    linesOf3.append(getGameString([0, 3, 6]))
    linesOf3.append(getGameString([1, 4, 7]))
    linesOf3.append(getGameString([2, 5, 8]))
    linesOf3.append(getGameString([0, 4, 8]))
    linesOf3.append(getGameString([2, 4, 6]))
    for lineOf3 in linesOf3 {
      if lineOf3 == "XXX" {
        gameState = .xWon
      } else if lineOf3 == "OOO" {
        gameState = .oWon
      }
    }
  }

  var description: String {
    return "\(gameState.rawValue)  Board: \(getGameString())"
  }
}
