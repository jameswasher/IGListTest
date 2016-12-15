//
//  Lesson.swift
//  flashcards
//
//  Created by James Washer on 12/13/16.
//  Copyright © 2016 The Infinite Actuary. All rights reserved.
//

import Foundation
import Firebase

class Lesson: NSObject {
    
    
    let name: String
    var cards: [Card]
    
    init(name: String, card: Card) {
        self.name = name
        self.cards = [card]
    }
    
    func remove(card: Card) {
        var indexToRemove: Int?
        var index = 0
        for c in cards {
            if c.key == card.key {
                indexToRemove = index
            }
            index += 1
        }
        if indexToRemove != nil { cards.remove(at: indexToRemove!) }
    }
    
}

