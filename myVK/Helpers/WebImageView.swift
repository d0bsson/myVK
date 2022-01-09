//
//  WebImageView.swift
//  myVK
//
//  Created by Дэвид Бердников on 09.01.2022.
//

import UIKit

class WebImageView: UIImageView {
    
    func set(imageURL: String?) {
        guard let imageURL = imageURL, let url = URL(string: imageURL) else { return }
        
        if let cashedResponsed = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            self.image = UIImage(data: cashedResponsed.data)
            return
        }
                
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self?.image = UIImage(data: data)
                    self?.handelLoadedImage(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }
    
    private func handelLoadedImage(data: Data, response: URLResponse) {
        guard let responseURL = response.url else { return }
        let cashedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cashedResponse, for: URLRequest(url: responseURL))
    }
    
}
