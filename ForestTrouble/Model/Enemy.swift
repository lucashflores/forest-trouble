//
//  Enemy.swift
//  ForestTrouble
//
//  Created by Lucas Flores on 30/07/23.
//

import Foundation
import SpriteKit

class Enemy {
    var type: String
    var life: Int
    var sprite: SKSpriteNode
    
    init() {
        self.type = ""
        self.life = 0
        self.sprite = SKSpriteNode()
    }
}
