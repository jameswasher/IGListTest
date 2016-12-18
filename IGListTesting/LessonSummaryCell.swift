import UIKit

class LessonSummaryCell: UICollectionViewCell {
  
  private let expandLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = UIColor.clear
    label.font = UIFont.systemFont(ofSize: 16)
    label.textAlignment = .center
    label.text = ">"
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
    expandLabel.center = CGPoint(x: bounds.width - expandLabel.bounds.width/2 - insets.right, y: bounds.height/2)

    titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
    titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
    titleLabel.rightAnchor.constraint(equalTo: expandLabel.leftAnchor, constant: -10).isActive = true
    
    subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
    subtitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
    subtitleLabel.rightAnchor.constraint(equalTo: expandLabel.leftAnchor, constant: -10).isActive = true
  }
  
}
