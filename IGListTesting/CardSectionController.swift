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
    var lessonModel: LessonSectionViewModel!
    var isExpanded = false
    
    override init() {
        super.init()
    }
}

extension CardSectionController: IGListSectionType {
    func numberOfItems() -> Int {
        return isExpanded ? lessonModel.cards.count + 1 : 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else { return .zero }
        let width = context.containerSize.width
        if index == 0 {
            return CGSize(width: width, height: 50)
        }
        let card = lessonModel.cards[index-1]
        return CGSize(width: width, height: 100)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cellClass: AnyClass = index == 0 ? LessonSummaryCell.self : FrontOfCardTableViewCell.self
        let cell = collectionContext!.dequeueReusableCell(of: cellClass, for: self, at: index)
        if let cell = cell as? LessonSummaryCell {
            cell.titleLabel.text = lessonModel.name
            cell.subtitleLabel.text =  "\(lessonModel.cards.count) cards"
            cell.setExpanded(isExpanded)
        } else if let cell = cell as? FrontOfCardTableViewCell {
            let path = Bundle.main.bundlePath
            let baseURL = NSURL.fileURL(withPath: path)
            let card = lessonModel.cards[index-1]
            if let html = "<div class=\"cell\">\(card.front)</div>".htmlCode {
                cell.webView.loadHTMLString(html, baseURL: baseURL)
            }
        }
        
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.lesson = object as? Lesson
        self.lessonModel = LessonSectionViewModel(name: lesson.name, cards: lesson.cards)
    }
    
    func didSelectItem(at index: Int) {
        isExpanded = !isExpanded
        collectionContext?.reload(self)
    }
}


extension String {
    var htmlCode: String? {
        
        if let filepath = Bundle.main.path(forResource: "MathJax/header", ofType: "html") {
            do {
                let contents = try String(contentsOfFile: filepath)
                return "\(contents)\(self)</body></html>"
            } catch {
                print("EROR: could not load header.html")
            }
        }
        
        return nil
    }
}
