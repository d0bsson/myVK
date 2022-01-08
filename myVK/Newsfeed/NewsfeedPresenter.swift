//
//  NewsfeedPresenter.swift
//  myVK
//
//  Created by Дэвид Бердников on 08.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
  func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
  weak var viewController: NewsfeedDisplayLogic?
  
  func presentData(response: Newsfeed.Model.Response.ResponseType) {
  
      switch response {
      case .some:
          print(".some Presenter")
      case .presentNewsFeed:
          print(".presentNewsFeed")
          viewController?.displayData(viewModel: .displayNewsFeed)
      }
      
  }
  
}
