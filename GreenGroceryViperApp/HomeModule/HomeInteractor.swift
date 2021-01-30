import Foundation

// Interactor is responsible for all the uses cases such making network calls for the View it is attached to via presenter
// Making Db operations etc etc.
protocol HomeUseCase {
    func fetchGroceries(completion: GroceriesClosure)
}

class HomeInteractor {
    let service: GroceriesAPI
    
    init(service: GroceriesAPI) {
        self.service = service
    }
    
}

extension HomeInteractor : HomeUseCase {
    func fetchGroceries(completion: GroceriesClosure) {
        self.service.fetchGroceries(completion: completion)
    }
}
