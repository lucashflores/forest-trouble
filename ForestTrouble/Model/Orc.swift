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
        self.type = "orc"
        self.life = 15
        self.sprite.size = CGSize(width: 130, height: 130)
    }
    
    override func getDamage() -> Int {
        var rand: Int = Int.random(in: 1..<6)
        switch rand {
        case 5:
            return 3
        case 4:
            return 2
        default:
            return 1
        }
    }
}
