import UIKit

class HomeModuleBuilder {
    static func build(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewController(identifier: "\(HomeViewController.self)") as! HomeViewController
        let interactor = HomeInteractor(service: StubService.shared)
        let router = HomeRouter(viewController: view)
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return factory(view)
    }
}
