import Foundation

protocol HomePresentation {
    func viewDidLoad() -> Void
}


/*
 Presenter is the one with which ViewController interacts directly.
 View: It has a delegate to the ViewController using a protocol via which is passes the messages back.
 Interactor: It has a reference to Interactor that has all the uses cases for that View.
 Router: It routes to the right ViewControllers depending on the work flows we have.
 */
class HomePresenter {
    // ViewController has Presenter and Presenter has View
    weak var view: HomeView?
    // Presenter is also responsible for talking with Interactor and Router
    var interactor: HomeUseCase
    var router: HomeRouting
    
    init(view: HomeView, interactor: HomeUseCase, router: HomeRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension HomePresenter : HomePresentation {
    
    // This method interacts with the Interactor and passes the info to VC via the VC Delegate.
    func viewDidLoad() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            self.interactor.fetchGroceries { (result) in
                let groceryList = result.groceries.compactMap{ GroceryItemViewModel(usingModel: $0) }
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.view?.updateGroceries(groceriesList: groceryList)
                }
            }
        }
    }
}
