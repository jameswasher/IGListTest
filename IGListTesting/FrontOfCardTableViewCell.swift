//
//  FrontOfCardTableViewCell.swift
//  flashcards
//
//  Created by James Washer on 12/3/16.
//  Copyright © 2016 The Infinite Actuary. All rights reserved.
//

import UIKit

class MyWebView : UIWebView {
    var key: String = ""
}

class FrontOfCardTableViewCell: UICollectionViewCell {
    
    fileprivate static let insets = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
    
    // MARK: properties
    
    lazy var webView: MyWebView = {
        let wv = MyWebView()
        wv.translatesAutoresizingMaskIntoConstraints = false
        wv.backgroundColor = .clear
        wv.isOpaque = false
        wv.scrollView.isScrollEnabled = false
        wv.delegate = self
        return wv
    }()
    
    lazy var separator: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor(red: 200/255.0, green: 199/255.0, blue: 204/255.0, alpha: 1).cgColor
        self.contentView.layer.addSublayer(layer)
        return layer
    }()
    
    private var leftConstraint: NSLayoutConstraint?
    private var rightConstraint: NSLayoutConstraint?
    
    // MARK: functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(webView)
        leftConstraint = webView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10)
        leftConstraint?.isActive = true
        
        rightConstraint = webView.rightAnchor.constraint(equalTo: rightAnchor, constant: 10)
        rightConstraint?.isActive = true
        
        webView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        let height: CGFloat = 0.5
        let left = FrontOfCardTableViewCell.insets.left
        separator.frame = CGRect(x: left, y: bounds.height - height, width: bounds.width - left, height: height)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        
        print("Called preferredLayoutAtrributesFitting")
        return layoutAttributes
    }

    
}

extension FrontOfCardTableViewCell: UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("Called webViewDidFinishload")
        
    }
}
