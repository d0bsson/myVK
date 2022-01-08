//
//  FriendsViewController.swift
//  myVK
//
//  Created by Дэвид Бердников on 05.01.2022.
//

import UIKit

class FriendsViewController: UIViewController {

    private let networkService: Networking = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.9351515174, blue: 0.9963403344, alpha: 1)
        let params = ["filters": "post, photo"]
        networkService.request(path: API.newsfeed, params: params) { data, error in
            if error != nil {
                print("Error recived requesting data: \(error?.localizedDescription)")
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let data = data else { return }
            let response = try? decoder.decode(FeedResponseWrapped.self, from: data)
        }
    }
}
