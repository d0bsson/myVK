//
//  String + height.swift
//  myVK
//
//  Created by Дэвид Бердников on 10.01.2022.
//

import UIKit


extension NSString {
    
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        let textSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        
        let size = self.boundingRect(
            with: textSize,
            options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font : font],
            context: nil
        )
        return ceil(size.height)
    }
    
}
