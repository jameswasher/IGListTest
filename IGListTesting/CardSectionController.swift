//
//  CardSectionController.swift
//  IGListTesting
//
//  Created by James Washer on 12/14/16.
//  Copyright © 2016 James Washer. All rights reserved.
//

import UIKit
import IGListKit

class CardSectionController: IGListSectionController {
    var card: Card!
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
    }
}

extension CardSectionController: IGListSectionType {
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else { return .zero }
        let width = context.containerSize.width
        return CGSize(width: width, height: 100)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as! LabelCell
        cell.label.text = card.front
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.card = object as? Card
    }
    
    func didSelectItem(at index: Int) {
        
        
    }
}
