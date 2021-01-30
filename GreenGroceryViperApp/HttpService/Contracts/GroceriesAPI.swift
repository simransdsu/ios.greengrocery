import Foundation

typealias GroceriesClosure = (GroceryResult) -> Void

protocol GroceriesAPI {
    func fetchGroceries(completion: GroceriesClosure)
}
