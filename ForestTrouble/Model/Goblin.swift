//
//  Goblin.swift
//  ForestTrouble
//
//  Created by Lucas Flores on 30/07/23.
//

import Foundation
class Goblin: Enemy {
    override init() {
        super.init()
        self.type = "goblin"
        self.life = 3
    }
    
    func getDamange() -> Int {
        var rand: Int = Int.random(in: 1..<3)
        return (rand == 3 ? 2 : 1)
    }
}
