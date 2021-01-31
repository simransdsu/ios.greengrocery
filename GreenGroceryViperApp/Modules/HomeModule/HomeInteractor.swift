import Foundation

// TODO: Check if this can be converted into a Model object
typealias SkuItem = (skuId: String, quantity: Int)

// Interactor is responsible for all the uses cases such making network calls for the View it is attached to via presenter
// Making Db operations etc etc.
protocol HomeUseCase {
    func fetchGroceries(completion: GroceriesClosure)
    func addToCart(skuItem: SkuItem) -> Bool
}

class HomeInteractor {
    let service: GroceriesAPI
    let database: CartDB
    
    init(service: GroceriesAPI, database: CartDB) {
        self.service = service
        self.database = database
    }
    
}

extension HomeInteractor : HomeUseCase {
    func addToCart(skuItem: SkuItem) -> Bool {
        return self.database.updateCart(cartItem: CartItem(skuId: skuItem.skuId, value: skuItem.quantity))
    }
    
    
    func fetchGroceries(completion: GroceriesClosure) {
        self.service.fetchGroceries(completion: completion)
    }
}
