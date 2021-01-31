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
