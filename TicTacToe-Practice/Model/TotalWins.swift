//
//  TotalWins.swift
//  TicTacToe-Practice
//
//  Created by Ben Brown on 4/9/21.
//  Copyright © 2021 Borchert, Otto. All rights reserved.
//

import Foundation

class TotalWins {
    
    var xWins : Int
    var oWins : Int
    var tieWins: Int
    
    init() {
        xWins = 0
        oWins = 0
        tieWins = 0
    }
    
    func getOWins() -> Int {
        return oWins
    }
    
    func getXWins() -> Int {
        return xWins
    }
    
    func getTieWins() -> Int {
        return tieWins
    }
    
    func addXWin() {
        xWins += 1
    }
    
    func addOWin() {
        oWins += 1
    }
    
    func addTieWin() {
        tieWins += 1
    }
}
