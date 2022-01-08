//
//  FriendsViewController.swift
//  myVK
//
//  Created by Дэвид Бердников on 05.01.2022.
//

import UIKit

class FriendsViewController: UIViewController {
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.9351515174, blue: 0.9963403344, alpha: 1)
        fetcher.getFeed { feedResponse in
            guard let feedResponse = feedResponse else { return }
            feedResponse.items.map( { feedItem in
                print(feedItem.date)
            })
        }
    }
}
