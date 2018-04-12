//
//  VNormalButton.swift
//  VCustomButton
//
//  Created by Leaf on 2018/3/31.
//  Copyright © 2018年 leaf. All rights reserved.
//

import UIKit

class VNormalButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    enum VNormalButtonImagePosition : Int {
        
        case left
        
        case right
        
        case top
        
        case bottom
    }
    
    var imagePosition = VNormalButtonImagePosition.left {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        if bounds.isEmpty {
            return
        }
        
        let imageSize = imageView?.sizeThatFits(CGSize.zero) ?? CGSize.zero
        let titleSize = titleLabel?.sizeThatFits(CGSize.zero) ?? CGSize.zero
        var imageRect = CGRect(origin: CGPoint.zero, size: imageSize)
        var titleRect = CGRect(origin: CGPoint.zero, size: titleSize)
        
        //水平布局
        if imagePosition == .left || imagePosition == .right {
            
            let imageWidthLimit = bounds.width - contentEdgeInsets.horizontal - imageEdgeInsets.horizontal
            let titleWidthLimit = imageWidthLimit - imageRect.width - titleEdgeInsets.horizontal
            
            imageRect.size.width = CGFloat.minimum(imageRect.width, imageWidthLimit)
            titleRect.size.width = CGFloat.minimum(titleRect.width, titleWidthLimit)
            //计算x坐标
            if imagePosition == .left {//默认：图片在左
                switch contentHorizontalAlignment {
                case .center:
                    imageRect.origin.x = contentEdgeInsets.left + imageEdgeInsets.left + (titleWidthLimit - titleRect.width) / 2
                    titleRect.origin.x = imageRect.maxX + imageEdgeInsets.right + titleEdgeInsets.left
                    
                case .left, .leading:
                    imageRect.origin.x = contentEdgeInsets.left + imageEdgeInsets.left
                    titleRect.origin.x = imageRect.maxX + imageEdgeInsets.right + titleEdgeInsets.left
                    
                case .right, .trailing:
                    titleRect.origin.x = frame.width - contentEdgeInsets.right - titleEdgeInsets.right - titleRect.width
                    imageRect.origin.x = titleRect.minX - titleEdgeInsets.left - imageEdgeInsets.right - imageRect.width
                case .fill:
                    imageRect.origin.x = contentEdgeInsets.left + imageEdgeInsets.left
                    titleRect.origin.x = imageRect.maxX + imageEdgeInsets.right + titleEdgeInsets.left
                    titleRect.size.width = titleWidthLimit
                }
            } else {//图片在右
                switch contentHorizontalAlignment {
                    
                case .center:
                    titleRect.origin.x = contentEdgeInsets.left + titleEdgeInsets.left + (titleWidthLimit - titleRect.width) / 2
                    imageRect.origin.x = titleRect.maxX + titleEdgeInsets.right + imageEdgeInsets.left
                    
                case .left, .leading:
                    titleRect.origin.x = contentEdgeInsets.left + titleEdgeInsets.left
                    imageRect.origin.x = titleRect.maxX + titleEdgeInsets.right + imageEdgeInsets.left
                    
                case .right, .trailing:
                    imageRect.origin.x = frame.width - contentEdgeInsets.right - imageEdgeInsets.right - imageRect.width
                    titleRect.origin.x = imageRect.minX - imageEdgeInsets.left - titleEdgeInsets.right - titleRect.width
                case .fill:
                    titleRect.origin.x = contentEdgeInsets.left + titleEdgeInsets.left
                    titleRect.size.width = titleWidthLimit
                    imageRect.origin.x = titleRect.maxX + titleEdgeInsets.right + imageEdgeInsets.left
                }
            }
            
            let imageHeightLimit = bounds.height - contentEdgeInsets.vertical - imageEdgeInsets.vertical
            let titleHeightLimit = bounds.height - contentEdgeInsets.vertical - titleEdgeInsets.vertical
            
            imageRect.size.height = CGFloat.minimum(imageRect.height, imageHeightLimit)
            titleRect.size.height = CGFloat.minimum(titleRect.height, titleHeightLimit)
            
            //计算y坐标
            switch contentVerticalAlignment {
                
            case .center:
                titleRect.origin.y = contentEdgeInsets.top + titleEdgeInsets.top + (titleHeightLimit - titleRect.height) / 2
                imageRect.origin.y = contentEdgeInsets.top + imageEdgeInsets.top + (imageHeightLimit - imageRect.height) / 2
            case .top:
                titleRect.origin.y = contentEdgeInsets.top + titleEdgeInsets.top
                imageRect.origin.y = contentEdgeInsets.top + imageEdgeInsets.top
            case .bottom:
                titleRect.origin.y = frame.height - contentEdgeInsets.bottom - titleEdgeInsets.bottom - titleRect.height
                imageRect.origin.y = frame.height - contentEdgeInsets.bottom - imageEdgeInsets.bottom - imageRect.height
            case .fill:
                imageRect.origin.y = contentEdgeInsets.top + imageEdgeInsets.top
                imageRect.size.height = imageHeightLimit
                titleRect.origin.y = contentEdgeInsets.top + titleEdgeInsets.top
                titleRect.size.height = titleHeightLimit
            }
        }
        //垂直布局
        if imagePosition == .top || imagePosition == .bottom {
            
            let imageWidthLimit = bounds.width - contentEdgeInsets.horizontal - imageEdgeInsets.horizontal
            let titleWidthLimit = bounds.width - contentEdgeInsets.horizontal - titleEdgeInsets.horizontal
            
            imageRect.size.width = CGFloat.minimum(imageRect.width, imageWidthLimit)
            titleRect.size.width = CGFloat.minimum(titleRect.width, titleWidthLimit)
            
            switch contentHorizontalAlignment {//计算x坐标
            case .center:
                imageRect.origin.x = contentEdgeInsets.left + imageEdgeInsets.left + (imageWidthLimit - imageRect.width) / 2
                titleRect.origin.x = contentEdgeInsets.left + titleEdgeInsets.left + (titleWidthLimit - titleRect.width) / 2
            case .left, .leading:
                imageRect.origin.x = contentEdgeInsets.left + imageEdgeInsets.left
                titleRect.origin.x = contentEdgeInsets.left + titleEdgeInsets.left
            case .right, .trailing:
                imageRect.origin.x = frame.width - contentEdgeInsets.right - imageEdgeInsets.right - imageRect.width
                titleRect.origin.x = frame.width - contentEdgeInsets.right - titleEdgeInsets.right - titleRect.width
            case .fill:
                imageRect.origin.x = contentEdgeInsets.left + imageEdgeInsets.left
                imageRect.size.width = imageWidthLimit
                titleRect.origin.x = contentEdgeInsets.left + titleEdgeInsets.left
                titleRect.size.width = titleWidthLimit
            }
            
            let imageHeightLimit = bounds.height - contentEdgeInsets.vertical - imageEdgeInsets.vertical
            let titleHeightLimit = imageHeightLimit - imageRect.height - titleEdgeInsets.vertical
            
            imageRect.size.height = CGFloat.minimum(imageRect.height, imageHeightLimit)
            titleRect.size.height = CGFloat.minimum(titleRect.height, titleHeightLimit)
            
            
            //计算y坐标
            if imagePosition == .top {//图片在上
                switch contentVerticalAlignment {
                case .center:
                    imageRect.origin.y = contentEdgeInsets.top + imageEdgeInsets.top + (titleHeightLimit - titleRect.height) / 2
                    titleRect.origin.y = imageRect.maxY + imageEdgeInsets.bottom + titleEdgeInsets.top
                case .top:
                    imageRect.origin.y = contentEdgeInsets.top + imageEdgeInsets.top
                    titleRect.origin.y = imageRect.maxY + imageEdgeInsets.bottom + titleEdgeInsets.top
                case .bottom:
                    titleRect.origin.y = frame.height - contentEdgeInsets.bottom - titleEdgeInsets.bottom - titleRect.height
                    imageRect.origin.y = titleRect.minY - titleEdgeInsets.top - imageEdgeInsets.bottom - imageRect.height
                case .fill:
                    imageRect.origin.y = contentEdgeInsets.top + imageEdgeInsets.top
                    titleRect.origin.y = imageRect.maxY + imageEdgeInsets.bottom + titleEdgeInsets.top
                    titleRect.size.height = titleHeightLimit
                }
            } else {//图片在下
                switch contentVerticalAlignment {
                case .center:
                    titleRect.origin.y = contentEdgeInsets.top + titleEdgeInsets.top + (titleHeightLimit - titleRect.height) / 2
                    imageRect.origin.y = titleRect.maxY + titleEdgeInsets.bottom + imageEdgeInsets.top
                case .top:
                    titleRect.origin.y = contentEdgeInsets.top + imageEdgeInsets.top
                    imageRect.origin.y = titleRect.maxY + titleEdgeInsets.bottom + imageEdgeInsets.top
                case .bottom:
                    imageRect.origin.y = frame.height - contentEdgeInsets.bottom - imageEdgeInsets.bottom - imageRect.height
                    titleRect.origin.y = imageRect.minY - imageEdgeInsets.top - titleEdgeInsets.bottom - titleRect.height
                case .fill:
                    titleRect.origin.y = contentEdgeInsets.top + imageEdgeInsets.top
                    titleRect.size.height = titleHeightLimit
                    imageRect.origin.y = titleRect.maxY + titleEdgeInsets.bottom + imageEdgeInsets.top
                }
            }
        }
        imageView?.frame = imageRect.ceil
        titleLabel?.frame = titleRect.ceil
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return intrinsicContentSize
    }
    
    override var intrinsicContentSize: CGSize {

        let imageSize = imageView?.sizeThatFits(CGSize.zero) ?? CGSize.zero
        let titleSize = titleLabel?.sizeThatFits(CGSize.zero) ?? CGSize.zero
        
        let width, height : CGFloat
        
        switch imagePosition {
        case .left, .right:

            width = imageSize.width + titleSize.width + contentEdgeInsets.horizontal + imageEdgeInsets.horizontal + titleEdgeInsets.horizontal
            height = contentEdgeInsets.vertical + CGFloat.maximum(imageSize.height + imageEdgeInsets.vertical, titleSize.height + titleEdgeInsets.vertical)
            
        case .top, .bottom:
            
            width = contentEdgeInsets.horizontal + CGFloat.maximum(imageSize.width + imageEdgeInsets.horizontal, titleSize.width + titleEdgeInsets.horizontal)
            height = imageSize.height + titleSize.height + contentEdgeInsets.vertical + imageEdgeInsets.vertical + titleEdgeInsets.vertical
        }
        
        return CGSize(width: width.ceil, height: height.ceil)
    }
}

extension UIEdgeInsets {
    
    var horizontal : CGFloat {
        return left + right
    }
    
    var vertical : CGFloat {
        return top + bottom
    }
}

extension CGFloat {
    var ceil: CGFloat {
        return (self * UIScreen.main.scale).rounded(.up) / UIScreen.main.scale
    }
}

extension CGRect {
    var ceil: CGRect {
        return CGRect(x: self.minX.ceil, y: self.minY.ceil, width: self.width.ceil, height: self.height.ceil)
    }
}
