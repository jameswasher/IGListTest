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
    var isExpanded = false
    
    override init() {
        super.init()
//        supplementaryViewSource = self
    }
}

extension CardSectionController: IGListSectionType {
    func numberOfItems() -> Int {
        return isExpanded ? lesson.cards.count + 1 : 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else { return .zero }
        let width = context.containerSize.width
        if index == 0 {
            return CGSize(width: width, height: 50)
        }
        return CGSize(width: width, height: 100)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cellClass: AnyClass = index == 0 ? LessonSummaryCell.self : LabelCell.self
        let cell = collectionContext!.dequeueReusableCell(of: cellClass, for: self, at: index)
        if let cell = cell as? LessonSummaryCell {
            cell.titleLabel.text = lesson.name
            cell.subtitleLabel.text =  "\(lesson.cards.count) cards"
            cell.setExpanded(isExpanded)
        } else if let cell = cell as? LabelCell {
           cell.label.text = lesson.cards[index-1].front
        }
        
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.lesson = object as? Lesson
    }
    
    func didSelectItem(at index: Int) {
        isExpanded = !isExpanded
        collectionContext?.reload(self)
    }
}

//extension CardSectionController: IGListSupplementaryViewSource {
//    func supportedElementKinds() -> [String] {
//        return [UICollectionElementKindSectionHeader]
//    }
//    
//    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
//        let view = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, for: self, class: LessonHeaderView.self, at: index) as! LessonHeaderView
//        
//        view.label.text = lesson.name
//        return view
//    }
//    
//    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
//        return CGSize(width: collectionContext!.containerSize.width, height: 40)
//    }
//}
