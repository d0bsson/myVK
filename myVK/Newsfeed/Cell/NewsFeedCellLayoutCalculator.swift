//
//  NewsFeedCellLayoutCalculator.swift
//  myVK
//
//  Created by Дэвид Бердников on 10.01.2022.
//

import UIKit

protocol FeedCellLayoutCalculatorProtocol {
    func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachmentViewModel?) -> FeedCellSizes
}

struct Constants {
    static let cardInsets = UIEdgeInsets(
        top: 0,
        left: 8,
        bottom: 12,
        right: 8
        )
    static let topViewHeight: CGFloat = 36
    static let postLabelInsets = UIEdgeInsets(
        top: 8 + Constants.topViewHeight + 8,
        left: 8,
        bottom: 8,
        right: 8
        )
    static let postLabelFont = UIFont.systemFont(ofSize: 15)
    static let bottomViewHeight: CGFloat = 33
}

struct Sizes: FeedCellSizes {
    var postLabelFrame: CGRect
    var attachmentFrame: CGRect
    var bottomViewFrame: CGRect
    var totalHeight: CGFloat
}

final class FeedCellLayoutCalculator: FeedCellLayoutCalculatorProtocol {
    private let screenWidth: CGFloat
    
    init(screenWidth: CGFloat) {
        self.screenWidth = screenWidth
    }
    
    func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachmentViewModel?) -> FeedCellSizes {
        
        let cardViewWidth = screenWidth - Constants.cardInsets.left - Constants.cardInsets.right
        
//        MARK: - Work with PostLabelFrame
        
        var postLabelFrame = CGRect(
            origin: CGPoint(
            x: Constants.postLabelInsets.left,
            y: Constants.postLabelInsets.top
            ),
            size: CGSize.zero
            )
        
        if let text = postText, !text.isEmpty {
            let width = cardViewWidth - Constants.postLabelInsets.left - Constants.postLabelInsets.right
            let height = text.height(width: width, font: Constants.postLabelFont)
            
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        
//        MARK: - Work with  AttachmentFrame
        
        let attachmentTop = postLabelFrame.size == CGSize.zero
            ? Constants.postLabelInsets.top
            : postLabelFrame.maxY + Constants.postLabelInsets.bottom
        
        var attachmentFrame = CGRect(
            origin: CGPoint(
            x: 0,
            y: attachmentTop
            ),
            size: CGSize.zero
            )
        
        if let attachment = photoAttachment {
            let photoHeight = Float(attachment.height)
            let photoWidt = Float(attachment.width)
            let ratio = CGFloat(photoHeight / photoWidt)
            
            attachmentFrame.size = CGSize(width: cardViewWidth, height: cardViewWidth * ratio)
        }
        
//        MARK: - Work with buttomViewTop

        let buttomViewTop = max(postLabelFrame.maxY, attachmentFrame.maxY)

        let bottomViewFrame = CGRect(
            origin: CGPoint(x: 0, y: buttomViewTop),
            size: CGSize(width: cardViewWidth, height: Constants.bottomViewHeight)
            )

//        MARK: - Work with totalHeight

        let totalHeight = bottomViewFrame.maxY + Constants.cardInsets.bottom
        
        return Sizes(
            postLabelFrame: postLabelFrame,
            attachmentFrame: attachmentFrame,
            bottomViewFrame: bottomViewFrame,
            totalHeight: totalHeight
            )
    }
}


