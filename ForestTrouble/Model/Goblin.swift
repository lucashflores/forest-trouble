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
        self.sprite.size = CGSize(width: 100, height: 100)
    }
    
    override func getDamage() -> Int {
        var rand: Int = Int.random(in: 1..<5)
        switch rand {
        case 4:
            return 2
        case 1:
            return 0
        default:
            return 1
        }
    }
}
