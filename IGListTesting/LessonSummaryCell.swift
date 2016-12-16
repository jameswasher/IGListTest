/**
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

class LessonSummaryCell: UICollectionViewCell {
  
  private let expandLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = UIColor.clear
    label.font = UIFont.systemFont(ofSize: 16)
    label.textAlignment = .center
    label.text = ">"
//    label.translatesAutoresizingMaskIntoConstraints = false
    label.sizeToFit()
    return label
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 16)
    label.textAlignment = .left
    label.text = "This is placeholder text for the lesson"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
    

    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .gray
        label.text = "10 cards"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

  
  func setExpanded(_ expanded: Bool) {
    self.expandLabel.transform = expanded ? CGAffineTransform(rotationAngle: CGFloat.pi / 2) : CGAffineTransform.identity
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(expandLabel)
    contentView.addSubview(titleLabel)
    contentView.addSubview(subtitleLabel)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    let insets = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
//    titleLabel.frame = CGRect(x: insets.left, y: 0, width: titleLabel.bounds.width, height: bounds.height)
    expandLabel.center = CGPoint(x: bounds.width - expandLabel.bounds.width/2 - insets.right, y: bounds.height/2)
//    expandLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//    expandLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
//    
    titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
    titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
    titleLabel.rightAnchor.constraint(equalTo: expandLabel.leftAnchor, constant: -10).isActive = true
    
    subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
    subtitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
    subtitleLabel.rightAnchor.constraint(equalTo: expandLabel.leftAnchor, constant: -10).isActive = true
  }
  
}
