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
    static let cardInsets = UIEdgeInsets(top: 0,
                                         left: 8,
                                         bottom: 12,
                                         right: 8)
    static let topViewHeight: CGFloat = 36
    static let postLabelInsets = UIEdgeInsets(
        top: 8 + Constants.topViewHeight + 8,
        left: 8,
        bottom: 8,
        right: 8)
    static let postLabelFont = UIFont.systemFont(ofSize: 15)
}

struct Sizes: FeedCellSizes {
    var postLabelFrame: CGRect
    var attachmentFrame: CGRect
    var buttomView: CGRect
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
        
        var postLabelFrame = CGRect(origin: CGPoint(x: Constants.postLabelInsets.left, y: Constants.postLabelInsets.top),
                                    size: CGSize.zero)
        
        if let text = postText, !text.isEmpty {
            let width = cardViewWidth - Constants.postLabelInsets.left - Constants.postLabelInsets.right
            let height = text.height(width: width, font: Constants.postLabelFont)
            
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        
        return Sizes(
            postLabelFrame: postLabelFrame,
            attachmentFrame: CGRect.zero,
            buttomView: CGRect.zero,
            totalHeight: 300)
    }
}


