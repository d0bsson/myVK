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
  
  func makeRequest(request: Newsfeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsfeedService()
    }
      
      switch request {
          
      case .some:
          print(".some Interactor")
      case .getFeed:
          print(".getFeed Interactor")
          presenter?.presentData(response: .presentNewsFeed)
      }
      
  }
  
}
