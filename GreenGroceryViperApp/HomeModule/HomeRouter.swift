//
//  HomeRouter.swift
//  GreenGroceryViperApp
//
//  Created by jc on 2020-12-18.
//

import UIKit

protocol HomeRouting {
    
}

class HomeRouter {
    var viewController: UIViewController!
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension HomeRouter : HomeRouting {
    
}
