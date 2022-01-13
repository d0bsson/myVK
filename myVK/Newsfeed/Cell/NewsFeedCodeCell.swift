//
//  NewsFeedCodeCell.swift
//  myVK
//
//  Created by Дэвид Бердников on 13.01.2022.
//

import UIKit

final class NewsFeedCodeCell: UITableViewCell {
    
    static let reuseId = "NewsFeedCodeCell"
    
    var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cardView)
        
        backgroundColor = UIColor(
            red: 183/255,
            green: 97/255,
            blue: 123/255,
            alpha: 1
        )
        
// MARK: - cardView constrains
//        cardView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
//        cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
//        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
//        cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
//
//        cardView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
//        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
//        cardView.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        cardView.widthAnchor.constraint(equalToConstant: 40).isActive = true


    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
