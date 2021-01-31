import Foundation

class GroceryItemViewModel {
    let skuId: String
    let title: String
    let details: String
    let image: String
    let price: String
    
    init(usingModel model: Grocery) {
        self.skuId = model.skuId
        self.title = model.title
        self.details = model.details
        self.image = model.image
        self.price = "$\(model.price)"
    }
}
