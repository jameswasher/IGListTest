//
//  LessonSectionViewModel.swift
//  IGListTesting
//
//  Created by James Washer on 12/18/16.
//  Copyright © 2016 James Washer. All rights reserved.
//

import UIKit

struct LessonSectionViewModel {
    let name: String
    let cards: [Card]
    
    init(name: String, cards: [Card]) {
        self.name = name
        self.cards = cards
    }
}
