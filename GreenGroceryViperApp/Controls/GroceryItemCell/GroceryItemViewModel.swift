import Foundation

class GroceryItemViewModel {
    let title: String
    let details: String
    let image: String
    let price: String
    
    init(usingModel model: Grocery) {
        self.title = model.title
        self.details = model.details
        self.image = model.image
        self.price = "$\(model.price)"
    }
}
