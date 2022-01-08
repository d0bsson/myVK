//
//  NetworkService.swift
//  myVK
//
//  Created by Дэвид Бердников on 08.01.2022.
//

import Foundation
protocol Networking {
    func request(path: String, params: [String: String], completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkService: Networking {
    
    func request(path: String, params: [String : String], completion: @escaping (Data?, Error?) -> Void) {
        guard let token = authService.token else { return }
        var allparams = params
        allparams["access_token"] = token
        allparams["v"] = API.version
        let url = self.url(from: path, params: allparams)
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, comletion: completion)
        task.resume()
        print(url)
    }
    
    private func createDataTask(from request: URLRequest, comletion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            DispatchQueue.main.async {
                comletion(data, error)
            }
        })
    }
    
    private let authService: AuthService
    
    init(authService: AuthService = AppDelegate.shared().authService) {
        self.authService = authService
    }
    
    private func url(from path: String, params: [String: String]) -> URL {
        var components = URLComponents()
        
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.newsfeed
        components.queryItems = params.map {URLQueryItem(name: $0, value: $1)}
        
        return components.url!
    }
}
