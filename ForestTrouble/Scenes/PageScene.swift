//
//  PageScene.swift
//  ForestTrouble
//
//  Created by Lucas Flores on 28/07/23.
//

import Foundation
import SpriteKit

class PageScene: SKScene {
    var charLife: Int = 15
    var isAnimating: Bool = false
    var book: SKSpriteNode = SKSpriteNode()
    var firstButton: SKSpriteNode = SKSpriteNode()
    var secondButton: SKSpriteNode = SKSpriteNode()
    var illustration: SKSpriteNode = SKSpriteNode()
    var textContent: SKLabelNode = SKLabelNode(fontNamed: "Pixel-Art")
    var backGround: SKSpriteNode = SKSpriteNode()
    var pages: [Page]?
    var currentPage: Page?
    var pageIndex: Int = 0
    var enemies: [Enemy] = []


    override func didMove(to view: SKView) {
        let backGroundTexture = SKTexture(imageNamed: "wood")
        backGround.position = CGPoint(x: size.width/2, y: size.height/2)
        backGround.size = CGSize(width: size.width, height: size.height)
        backGround.texture = backGroundTexture
        addChild(backGround)
        self.pages = Page.getPages()
        self.currentPage = self.pages?.first(where: {$0.id == "goblin-fight"})
        loadBook()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.loadAssets()
            self.fadeAssetsIn()
        }
    }
    
    func loadFirstButton() {
        let firstButtonTexture = SKTexture(imageNamed: self.currentPage!.firstButton)
        firstButton.texture = firstButtonTexture
        firstButton.name = "First Button"
        firstButton.anchorPoint = CGPoint(x: 0, y: 0)
        if (self.currentPage!.secondButton != nil && self.currentPage!.secondDestination != nil)
        {
            firstButton.position = CGPoint(x: 215, y: 160)
        }
        else {
            firstButton.position = CGPoint(x: 215, y: 120)
        }
        
        firstButton.size.width = 140
        firstButton.size.height = 40
        firstButton.alpha = 0
        addChild(firstButton)
    }
    
    func loadSecondButton() {
        if (self.currentPage!.secondButton != nil && self.currentPage!.secondDestination != nil)
        {
            let secondButtonTexture = SKTexture(imageNamed: self.currentPage!.secondButton!)
            secondButton.texture = secondButtonTexture
            secondButton.name = "Second Button"
            secondButton.position = CGPoint(x: 215, y: 100)
            secondButton.anchorPoint = CGPoint(x: 0, y: 0)
            secondButton.size.width = 140
            secondButton.size.height = 40
            secondButton.alpha = 0
            addChild(secondButton)
        }
    }
    

    func loadIllustration() {
        guard var illustrationName = self.currentPage?.illustration else { return }
        if (illustrationName == "life") {
            illustrationName = "\(charLife)-life"
        }
        let texture = SKTexture(imageNamed: illustrationName)
        illustration.texture = texture
        illustration.size.width = 180
        illustration.size.height = 180
        illustration.anchorPoint = CGPoint(x: 0, y: 0)
        illustration.position = CGPoint(x: size.width/2 + 50 , y: size.height/2 - 90)
        if (self.enemies.count > 0) {
            illustration.position = CGPoint(x: 220, y: 180)
            illustration.size.width = 120
            illustration.size.height = 120
        }
        illustration.alpha = 0
        addChild(illustration)
    }

    func loadText() {
        textContent.text = self.currentPage!.textContent
        textContent.fontSize = 16
        textContent.fontColor = UIColor(named: "bookText")
        textContent.alpha = 0
        textContent.horizontalAlignmentMode = .left
        textContent.verticalAlignmentMode = .top
        textContent.position = CGPoint(x: 165, y: 315)
        textContent.preferredMaxLayoutWidth = 260
        textContent.numberOfLines = 10
        addChild(textContent)

    }
    
    func loadEnemies() {
        var index = 0
        self.enemies = self.currentPage?.combatResources?.enemies ?? []
        let enemyCount = self.enemies.count
        for enemy in self.enemies {
            let texture = SKTexture(imageNamed: "\(enemy.type)-\(enemy.life)-life")
            enemy.sprite.texture = texture
            enemy.sprite.anchorPoint = CGPoint(x: 0, y: 0)
            if (enemyCount == 1) {
                enemy.sprite.size = CGSize(width: 150, height: 150)
                enemy.sprite.position = CGPoint(x: size.width/2 + 50, y: size.height/2 - 90)
            }
            else {
                enemy.sprite.size = CGSize(width: 100, height: 100)
                enemy.sprite.position = CGPoint(x: size.width/2 + 100, y: CGFloat(230 - index*80))
            }
            index += 1
            enemy.sprite.alpha = 0
            addChild(enemy.sprite)
        }
    }
    
    func removeEnemies() {
        for enemy in self.enemies {
            enemy.sprite.removeFromParent()
        }
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
        let isCombat = self.currentPage?.combatResources?.enemies.count ?? 0 > 0
        isAnimating = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            if (!isCombat) {
                self.animateBook()
            }
            self.fadeAssetsOut()
            self.removeAssets()
            DispatchQueue.main.asyncAfter(deadline: .now() + 7*0.06) {
                self.isAnimating = false
                if (!isCombat) {
                    self.enemies = []
                }
                self.loadAssets()
                self.fadeAssetsIn()
            }
        }
    }
    
    func fadeAssetsIn() {
        let fadeIn = SKAction.fadeIn(withDuration: 1)
        illustration.run(fadeIn)
        textContent.run(fadeIn)
        firstButton.run(fadeIn)
        secondButton.run(fadeIn)
        if (self.enemies.count > 0) {
            for enemy in self.enemies {
                enemy.sprite.run(fadeIn)
            }
        }
    }
    
    func fadeAssetsOut() {
        let fadeOut = SKAction.fadeOut(withDuration: 0.75)
        illustration.run(fadeOut)
        textContent.run(fadeOut)
        firstButton.run(fadeOut)
        secondButton.run(fadeOut)
        for enemy in self.enemies {
            enemy.sprite.run(fadeOut)
        }
        
    }
    
    func removeAssets() {
        self.illustration.removeFromParent()
        self.textContent.removeFromParent()
        self.firstButton.removeFromParent()
        self.secondButton.removeFromParent()
        self.removeEnemies()
    }
    
    func loadAssets() {
        if (self.currentPage?.combatResources?.enemies.count ?? 0 > 0) {
            self.loadEnemies()
            
        } else {
            self.loadText()
        }
        self.loadIllustration()
        
        self.loadSecondButton()
        self.loadFirstButton()
        
    }
    
    func createDieAnimation(number: Int) -> SKAction {
        var dieTextures: [SKTexture] = []
        for _ in 1..<10 {
            let rand = Int.random(in: 1..<7)
            dieTextures.append(SKTexture(imageNamed: "die-\(rand)"))
        }
        dieTextures.append(SKTexture(imageNamed: "die-\(number)"))
        let dieAnimation = SKAction.animate(with: dieTextures,
                                                     timePerFrame: 0.1)
        return dieAnimation
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let tappedNodes = nodes(at: location)
            for node in tappedNodes {
                
                if (!isAnimating) {
                    if (node.name == "First Button") {
                        if (self.enemies.count > 0) {
                            let rand = Int.random(in: 1..<7)
                            let die = SKSpriteNode()
                            die.anchorPoint = CGPoint(x: 0, y: 0)
                            die.size = CGSize(width: 25, height: 25)
                            die.position = CGPoint(x: 270, y: 80)
                            die.texture = SKTexture(imageNamed: "die-1")
                            self.addChild(die)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                die.run(self.createDieAnimation(number: rand))
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                die.removeFromParent()
                                var damageToApply = rand
                                var enemiesLife = 0
                                for enemy in self.currentPage!.combatResources!.enemies {
                                    if (enemy.life - damageToApply < 0) {
                                        damageToApply -= enemy.life
                                        enemy.life = 0
                                    } else {
                                        enemy.life -= damageToApply
                                        damageToApply -= damageToApply
                                    }
                                    enemiesLife += enemy.life
                                }
                                if (enemiesLife == 0) {
                                    self.currentPage = self.pages?.first(where: {$0.id == self.currentPage?.secondDestination})
                                }
                                else if (self.charLife == 0) {
                                    self.currentPage = self.pages?.first(where: {$0.id == self.currentPage?.firstDestination})
                                }
                                self.nextPage()
                            }
                        }
                        else {
                            self.currentPage = self.pages?.first(where: {$0.id == self.currentPage?.firstDestination})
                            nextPage()
                        }
                        
                    }
                    else if (node.name == "Second Button") {
                        self.currentPage = self.pages?.first(where: {$0.id == self.currentPage?.secondDestination})
                        nextPage()
                    }
                }
            }
        }
    }
}
