//
//  ViewController.swift
//  IGListTesting
//
//  Created by James Washer on 12/14/16.
//  Copyright © 2016 James Washer. All rights reserved.
//

import UIKit
import IGListKit

class CardViewController: UIViewController {

    let collectionView: IGListCollectionView = {
        let view = IGListCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return view
    }()
    
    lazy var adapter: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    
    let cardLoader = CardLoader()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Cards"
        view.addSubview(collectionView)
        cardLoader.delegate = self
        cardLoader.connect()
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }

}

extension CardViewController: IGListAdapterDataSource {
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        return cardLoader.lessons as [IGListDiffable]
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        return CardSectionController()
        
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }
}

extension CardViewController: CardLoaderDelegate {
    func cardLoaderDidUpdate() {
        adapter.performUpdates(animated: true, completion: nil)
    }
}


