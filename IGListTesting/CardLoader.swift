//
//  CardLoader.swift
//  IGListTesting
//
//  Created by James Washer on 12/14/16.
//  Copyright © 2016 James Washer. All rights reserved.
//

import Foundation
import Firebase

private func delay(time: Double = 1, execute work: @escaping @convention(block) () -> Swift.Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
        work()
    }
}


protocol CardLoaderDelegate {
    func cardLoaderDidUpdate()
}

class CardLoader {
    var delegate: CardLoaderDelegate?
    
    var cardsDictionary: [String:Card] = [:] {
        didSet {
            delegate?.cardLoaderDidUpdate()
        }
    }
    
    var cards: [Card] {
        return Array(cardsDictionary.values)
    }
    
    func loadCards() {
        let ref = FIRDatabase.database().reference(withPath: "dev/cards-exam/10")
        ref.observe(.childAdded, with: { snapshot in
            let card = Card(snapshot: snapshot)
            self.cardsDictionary[card.key] = card
        })
        ref.observe(.childChanged, with: { snapshot in
            let card = Card(snapshot: snapshot)
            self.cardsDictionary[card.key] = card
        })
        ref.observe(.childRemoved, with: { snapshot in
            let card = Card(snapshot: snapshot)
            self.cardsDictionary.removeValue(forKey: card.key)
        })
    }
}
