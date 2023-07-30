//
//  GameScene.swift
//  ForestTrouble
//
//  Created by Lucas Flores on 27/07/23.
//

import Foundation
import SpriteKit
import SwiftUI

class GameScene: SKScene {
    var isAnimating: Bool = false
    var book: SKSpriteNode = SKSpriteNode()
    var castle: SKSpriteNode = SKSpriteNode()
    var textContent: SKLabelNode = SKLabelNode(fontNamed: "Pixel-Art")
    
    override func didMove(to view: SKView) {
        backgroundColor = .white
        loadBook()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.loadText()
            self.loadIllustration()
        }
    }
    
    func loadIllustration() {
        let castleTexture = SKTexture(imageNamed: "castle")
        castle.texture = castleTexture
        castle.size.width = 180
        castle.size.height = 180
        castle.anchorPoint = CGPoint(x: 0, y: 0)
        castle.position = CGPoint(x: size.width/2 + 50 , y: size.height/2 - 60)
        let fadeIn = SKAction.fadeIn(withDuration: 1)
        castle.alpha = 0
        addChild(castle)
        castle.run(fadeIn)
    }
    
    func loadText() {
        textContent.text = "Lael is a great kingdom in the south of the continent of Cygnarus."
        textContent.fontSize /= 2
        textContent.fontColor = UIColor(named: "bookText")
        textContent.alpha = 0
        textContent.horizontalAlignmentMode = .left
        textContent.verticalAlignmentMode = .top
        textContent.position = CGPoint(x: 165, y: 315)
        textContent.preferredMaxLayoutWidth = 260
        textContent.numberOfLines = 10
        addChild(textContent)
        let fadein = SKAction.fadeIn(withDuration: 1)
        textContent.run(fadein)
    }
    
    func loadBook() {
        let bookTexture = SKTexture(imageNamed: "book0")
        book.name = "Book"
        book.texture = bookTexture
        book.size.width = 800
        book.size.height = 365
        book.position = CGPoint(x: 852/2, y: 393/2)
        addChild(book)
    }
    
    func animateBook() {
        
        let bookTextures = [SKTexture(imageNamed: "book1"), SKTexture(imageNamed: "book2"), SKTexture(imageNamed: "book3"), SKTexture(imageNamed: "book4"), SKTexture(imageNamed: "book5"), SKTexture(imageNamed: "book6"), SKTexture(imageNamed: "book0")]
        let flippingPageAnimation = SKAction.animate(with: bookTextures,
                                                     timePerFrame: 0.06)
        book.run(flippingPageAnimation)
        
    }
    
    func nextPage() {
        isAnimating = true
        let fadeOut = SKAction.fadeOut(withDuration: 0.75)
        castle.run(fadeOut)
        textContent.run(fadeOut)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.animateBook()
            DispatchQueue.main.asyncAfter(deadline: .now() + 7*0.06) {
                self.isAnimating = false
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let tappedNodes = nodes(at: location)
            for node in tappedNodes {
                if (node.name == "Book" && !isAnimating) {
                    nextPage()
                }
            }
        }
    }
}
