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
    var lesson: Lesson!
    
    override init() {
        super.init()
        supplementaryViewSource = self
    }
}

extension CardSectionController: IGListSectionType {
    func numberOfItems() -> Int {
        return lesson.cards.count
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else { return .zero }
        let width = context.containerSize.width
        return CGSize(width: width, height: 100)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as! LabelCell
        cell.label.text = lesson.cards[index].front
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.lesson = object as? Lesson
    }
    
    func didSelectItem(at index: Int) {
        
        
    }
}

extension CardSectionController: IGListSupplementaryViewSource {
    func supportedElementKinds() -> [String] {
        return [UICollectionElementKindSectionHeader]
    }
    
    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        let view = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, for: self, class: LessonHeaderView.self, at: index) as! LessonHeaderView
        
        view.label.text = lesson.name
        return view
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 40)
    }
}
