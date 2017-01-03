//
//  Card.swift
//  flashcards
//
//  Created by James Washer on 12/2/16.
//  Copyright © 2016 The Infinite Actuary. All rights reserved.
//

import UIKit
import Firebase

class Card: NSObject, UIWebViewDelegate {
    
    let key: String
    var front: String
    var back: String
    var lessonTitle: String
    var webViewHeight: CGFloat = 50
    
    init(key: String, front: String, back: String, lessonTitle: String) {
        self.key = key
        self.front = front
        self.back = back
        self.lessonTitle = lessonTitle
    }

    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        front = (snapshotValue["front"] as! String).replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "\r", with: "")
        back = (snapshotValue["back"] as! String).replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "\r", with: "")
        lessonTitle = snapshotValue["lessonTitle"] as! String
    }
}
