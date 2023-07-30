//
//  Orc.swift
//  ForestTrouble
//
//  Created by Lucas Flores on 30/07/23.
//

import Foundation
class Orc: Enemy {
    override init() {
        super.init()
        self.type = "Orc"
        self.life = 15
    }
    
    func getDamange() -> Int {
        var rand: Int = Int.random(in: 1..<5)
        return (rand == 5 ? 3 : rand > 2 ? 2 : 1)
    }
}
