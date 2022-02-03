//
//  NewsfeedInteractor.swift
//  myVK
//
//  Created by Дэвид Бердников on 08.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
  func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {

  var presenter: NewsfeedPresentationLogic?
  var service: NewsfeedService?
    
    private var revealedPostIds = [Int]()
    private var feedResponse: FeedResponse?
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
  
  func makeRequest(request: Newsfeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsfeedService()
    }
      
      switch request {
       
      case .getNewsFeed:
          fetcher.getFeed { [weak self] feedResponse in
              
              self?.feedResponse = feedResponse
              self?.presentFeed()
          }
      case .revealPostIds(postId: let postId):
          revealedPostIds.append(postId)
          presentFeed()
      }
      
  }
    
    private func presentFeed() {
        guard let feedResponse = feedResponse else { return }
        presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsfeed(feed: feedResponse, revealedPostIds: revealedPostIds))
    }
  
}
