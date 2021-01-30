import Foundation


class StubService {
    static let shared: StubService = StubService()
    
    private init() { }
}

extension StubService : GroceriesAPI {
    func fetchGroceries(completion: GroceriesClosure) {
        guard let url = Bundle.main.url(forResource: "products", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: url)
            let groceriesResult = try JSONDecoder().decode(GroceryResult.self, from: data)
            completion(groceriesResult)
        } catch {
            print("Something went wrong with error: \(error)")
        }
    }
}
