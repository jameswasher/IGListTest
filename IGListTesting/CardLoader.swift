//
//  CardLoader.swift
//  IGListTesting
//
//  Created by James Washer on 12/14/16.
//  Copyright © 2016 James Washer. All rights reserved.
//

import Foundation
import Firebase

protocol CardLoaderDelegate {
    func cardLoaderDidUpdate()
}

class CardLoader {
    var delegate: CardLoaderDelegate?
    
    var todayCards: [String:Bool] = [:] {
        didSet {
            delegate?.cardLoaderDidUpdate()
        }
    }

    var allCards: [String:Card] = [:] {
        didSet {
            delegate?.cardLoaderDidUpdate()
        }
    }

    var lessons: [Lesson] {
        var dict: [String:Lesson] = [:]
        for (key, _) in todayCards {
            if let card = allCards[key] {
                if dict[(card.lessonTitle)] == nil {
                    dict[(card.lessonTitle)] = Lesson(name: (card.lessonTitle), card: card)
                } else {
                    dict[(card.lessonTitle)]!.cards.append(card)
                }
            }
            
        }
        return Array(dict.values)
    }
    
    func connect() {
        loadAllCards()
        loadTodayCards()
    }
    
    func loadTodayCards() {
        let ref = FIRDatabase.database().reference(withPath: "dev/todayCards/4185/10")
        
        ref.observe(.childAdded, with: { snapshot in
            self.todayCards[snapshot.key] = true
        })
        
        ref.observe(.childRemoved, with: { snapshot in
            self.todayCards.removeValue(forKey: snapshot.key)
        })
    }
    
    func loadAllCards() {
        let ref = FIRDatabase.database().reference(withPath: "dev/cards-exam/10")
        
        ref.observe(.childAdded, with: { snapshot in
            let card = Card(snapshot: snapshot)
            self.allCards[card.key] = card
        })
        
        ref.observe(.childChanged, with: { snapshot in
            let card = Card(snapshot: snapshot)
            self.allCards[card.key] = card
        })
        
        ref.observe(.childRemoved, with: { snapshot in
            let card = Card(snapshot: snapshot)
            self.allCards.removeValue(forKey: card.key)
        })
    }
    
}
