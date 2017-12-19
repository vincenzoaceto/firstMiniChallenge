//
//  TimelineTableViewCell.swift
//  firstMiniChallenge
//
//  Created by Bilal Abdullah on 19/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit

class TimelineTableViewCell: UITableViewCell {

    let greyColor = UIColor(red:0.61, green:0.61, blue:0.61, alpha:1.0)
    let blackColor = UIColor.black
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lineInfoLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var illustrationImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    open var timelinePoint = TimelinePoint() {
        didSet {
            self.setNeedsDisplay()
        }
    }
    open var timeline = Timeline() {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    open var bubbleRadius: CGFloat = 2.0 {
        didSet {
            if (bubbleRadius < 0.0) {
                bubbleRadius = 0.0
            } else if (bubbleRadius > 6.0) {
                bubbleRadius = 6.0
            }
            
            self.setNeedsDisplay()
        }
    }
    
    open var bubbleColor = UIColor(red:0.00, green:0.62, blue:1.00, alpha:1.0)
    
    override open func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func makeGrey() {
        nameLabel.textColor = greyColor
        surnameLabel.textColor = greyColor
        dateLabel.textColor = greyColor
        bubbleColor = UIColor(red:0.00, green:0.62, blue:1.00, alpha:0.75)
    }
    
    func makeBlack() {
        nameLabel.textColor = blackColor
        surnameLabel.textColor = blackColor
        dateLabel.textColor = blackColor
        bubbleColor = UIColor(red:0.00, green:0.62, blue:1.00, alpha:1.0)
    }
    
    override open func draw(_ rect: CGRect) {
        for layer in self.contentView.layer.sublayers! {
            if layer is CAShapeLayer {
                layer.removeFromSuperlayer()
            }
        }
        
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2;
        self.profileImageView.clipsToBounds = true;
        lineInfoLabel.sizeToFit()
        titleLabel.sizeToFit()
        nameLabel.sizeToFit()
        surnameLabel.sizeToFit()
        dateLabel.sizeToFit()
        
        timelinePoint.position = CGPoint(x: timeline.leftMargin + timeline.width / 2, y: titleLabel.frame.origin.y + titleLabel.intrinsicContentSize.height / 2 - timelinePoint.diameter / 2)
        
        timeline.start = CGPoint(x: timelinePoint.position.x + timelinePoint.diameter / 2, y: 0)
        timeline.middle = CGPoint(x: timeline.start.x, y: timelinePoint.position.y)
        timeline.end = CGPoint(x: timeline.start.x, y: self.bounds.size.height)
        timeline.draw(view: self.contentView)
        
        timelinePoint.draw(view: self.contentView)
        
        if let title = titleLabel.text, !title.isEmpty {
            drawBubble()
        }
    }
    
    fileprivate func drawBubble() {
        let offset: CGFloat = 16
        let bubbleRect = CGRect(
            x: titleLabel.frame.origin.x - offset / 2,
            y: titleLabel.frame.origin.y - offset / 2,
            width: titleLabel.intrinsicContentSize.width + offset,
            height: titleLabel.intrinsicContentSize.height + offset)
        
        let path = UIBezierPath(roundedRect: bubbleRect, cornerRadius: bubbleRadius)
        let startPoint = CGPoint(x: bubbleRect.origin.x, y: bubbleRect.origin.y + bubbleRect.height / 2 - 8)
        path.move(to: startPoint)
        path.addLine(to: startPoint)
        path.addLine(to: CGPoint(x: bubbleRect.origin.x - 8, y: bubbleRect.origin.y + bubbleRect.height / 2))
        path.addLine(to: CGPoint(x: bubbleRect.origin.x, y: bubbleRect.origin.y + bubbleRect.height / 2 + 8))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = bubbleColor.cgColor
        
        self.contentView.layer.insertSublayer(shapeLayer, below: titleLabel.layer)
    }
}
