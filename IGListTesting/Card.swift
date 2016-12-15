//
//  Card.swift
//  flashcards
//
//  Created by James Washer on 12/2/16.
//  Copyright © 2016 The Infinite Actuary. All rights reserved.
//

import Foundation
import Firebase

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

    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        front = (snapshotValue["front"] as! String).replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "\r", with: "")
        back = (snapshotValue["back"] as! String).replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "\r", with: "")
    }
}
