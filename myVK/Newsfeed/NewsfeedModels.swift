//
//  NewsfeedModels.swift
//  myVK
//
//  Created by Дэвид Бердников on 08.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Newsfeed {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getNewsFeed
          case revealPostIds(postId: Int)
      }
    }
    struct Response {
      enum ResponseType {
          case presentNewsfeed(feed: FeedResponse, revealedPostIds: [Int])
      }
    }
    struct ViewModel {
      enum ViewModelData {
          case displayNewsFeed(feedViewModel: FeedViewModel)
      }
    }
  }
  
}

struct FeedViewModel {
    struct Cell: FeedCellViewModel {
        
        var postId: Int 
        var iconUrlString: String
        var name: String
        var date: String
        var text: String?
        var likes: String?
        var comments: String?
        var shares: String?
        var views: String?
        var photoAttachments: [FeedCellPhotoAttachmentViewModel]
        var sizes: FeedCellSizes
    }
    
    struct FeedCellPhotoAttachment: FeedCellPhotoAttachmentViewModel {
        var photoUrlString: String?
        var width: Int
        var height: Int
        
    }
    
    let cells: [Cell]
}
