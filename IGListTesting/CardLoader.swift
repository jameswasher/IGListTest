//
//  CardLoader.swift
//  IGListTesting
//
//  Created by James Washer on 12/14/16.
//  Copyright © 2016 James Washer. All rights reserved.
//

import Foundation

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
    var cards: [Card] = {
        var arr = [Card]()
        arr.append(Card(key: "1", front: "front of card 1", back: "back of card 1"))
        arr.append(Card(key: "2", front: "front of card 2", back: "back of card 2"))
        return arr
        }() {
        didSet {
            delegate?.cardLoaderDidUpdate()
        }
    }
    
    func loadCards() {
        delay(time: 2.3) {
            self.cards.append(Card(key: "3", front: "front of card 3", back: "back of card 3"))
        }
    }
}
