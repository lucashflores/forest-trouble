//
//  Page.swift
//  ForestTrouble
//
//  Created by Lucas Flores on 28/07/23.
//

import Foundation
struct Page: Identifiable {
    var id: String
    var illustration: String
    var firstButton: String
    var firstDestination: String
    var secondButton: String?
    var secondDestination: String?
    var textContent: String;
    var isCombat: Bool?
    var combatResources: CombatResources?
    
    static func getPages() -> [Page] {
        return [
            Page(id: "intro1", illustration: "intro1", firstButton: "continue_button", firstDestination: "intro2", textContent: "Once upon a time, in the kingdom of Lael there was a king. He conspired with nobles to raise taxes and left the population poor and starving."),
            Page(id: "intro2", illustration: "intro2", firstButton: "continue_button", firstDestination: "intro3", textContent: "After one year of suffering, the population decided to organize a rebellion to dethrone the king. The rebellion was successfull and a new queen was chosen."),
            Page(id: "intro3", illustration: "char", firstButton: "continue_button", firstDestination: "intro4", textContent: "One important figure to the rebellion was you, the hero! You became famous across the entire continent for your efforts in the rebellion."),
            Page(id: "intro4", illustration: "intro4", firstButton: "continue_button", firstDestination: "intro5", textContent: "Five years later, the kingdom is at peace and is propespering. The queen is loved by the people and everyone can live a normal life."),
            Page(id: "intro5", illustration: "intro5", firstButton: "continue_button", firstDestination: "intro6", textContent: "One day you were summoned by the queen to investigate strange disappearings of children of a village in the outskirts of a forest ."),
            Page(id: "intro6", illustration: "life", firstButton: "continue_button", firstDestination: "chapter11", textContent: "This is how it all started..."),
            Page(id: "chapter11", illustration: "life", firstButton: "continue_button", firstDestination: "chapter12", textContent: "You travel straight away to the village to investigate the strange occurrences. Talking to the residents, you discover there is a house you can look for clues."),
            Page(id: "chapter12", illustration: "life", firstButton: "left_button", firstDestination: "chapter131", secondButton: "right_button", secondDestination: "chapter132", textContent: "You can take the left to go to the house or the right to go straight to the forest."),
            Page(id: "chapter131", illustration: "life", firstButton: "continue_button", firstDestination: "chapter14", textContent: "There isn't much to see in the house but you see some wooden toys, a red woolen scarf that is not yet done and a fireplace starting do die out. You head to the forest."),
            Page(id: "chapter132", illustration: "life", firstButton: "continue_button", firstDestination: "chapter14", textContent: "You enter the forest carefully and vigilant to every sound and movement, ready to take an unexpected threat."),
            Page(id: "chapter14", illustration: "life", firstButton: "continue_button", firstDestination: "chapter15", textContent: "After some minutes of walking in the forest, you stop at the sight of two paths you can take."),
            Page(id: "chapter15", illustration: "life", firstButton: "left_button", firstDestination: "chapter151", secondButton: "right_button", secondDestination: "chapter152", textContent: "In the left you see footsteps that look human. In the right one you see something red that looks like a flower. Which path do you take?"),
            Page(id: "chapter151", illustration: "life", firstButton: "continue_button", firstDestination: "goblin-fight", textContent: "After walking a little bit more, you hear sounds! Goblins! They have humanoid bodies, so that's why the footsteps looked human. They notice you right away, a fight is inevitable."),
            Page(id: "chapter152", illustration: "life", firstButton: "continue_button", firstDestination: "chapter16", textContent: "The flower is actually part of a red scarf! The children must have gone this way."),
            Page(id: "goblin-fight", illustration: "life", firstButton: "attack_button", firstDestination: "neutral-ending", secondButton: nil, secondDestination: "goblin-fight-win", textContent: "Goblin Fight",isCombat: true, combatResources: CombatResources(enemies: [Goblin(), Goblin(), Goblin()])),
            Page(id: "neutral-ending", illustration: "1-life", firstButton: "restart_button", firstDestination: "intro1", textContent: "You manage to escape but not unscathed. You failed to investigate the disappearings."),
            Page(id: "goblin-fight-win", illustration: "life", firstButton: "continue_button", firstDestination: "chapter16", textContent: "You win against the goblins and investigate their loot. You find a map with a location pinpointed, it must be their camp! You also take one of their firebombs with you."),
            Page(id: "chapter16", illustration: "life", firstButton: "continue_button", firstDestination: "chapter17", textContent: "After hours of walking, you finally reach their camp. You first observe it without being seen to strategize your course of action."),
            Page(id: "chapter17", illustration: "life", firstButton: "continue_button", firstDestination: "orc-fight", textContent: "You see the children in a prison in the farthest part of the camp and you also see an orc! Orcs have high resistance but are vulnerable to fire."),
            Page(id: "orc-fight", illustration: "life", firstButton: "attack_button", firstDestination: "bad-ending", secondButton: nil, secondDestination: "good-ending", textContent: "Orc Fight", isCombat: true, combatResources: CombatResources(enemies: [Goblin(), Orc(), Goblin()])),
            Page(id: "good-ending", illustration: "char", firstButton: "restart_button", firstDestination: "intro1", textContent: "You emerge victorious from the fight and manage to rescue the children and return them to their parents. The residents of the village and the queen personally thanks you."),
            Page(id: "bad-ending", illustration: "life", firstButton: "restart_button", firstDestination: "intro1", textContent: "You failed to defeat the orc and died."),
            
            
            
            
        ]
    }
}
