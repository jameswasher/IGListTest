//
//  Card.swift
//  flashcards
//
//  Created by James Washer on 12/2/16.
//  Copyright © 2016 The Infinite Actuary. All rights reserved.
//

import Foundation

class Card: NSObject {
    
    // MARK: properties
    
    let key: String
    var front: String
    var back: String
    
    
    init(key: String, front: String, back: String) {
        self.key = key
        self.front = front
        self.back = back
    }

    
}
