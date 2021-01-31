import Foundation

struct CartItem {
    let skuId: String
    let value	: Int
    
    init(skuId: String, value: Int) {
        self.skuId = skuId
        self.value = value
    }
}

extension CartItem {
    init(withRealmCartItem item: RealmCartItem) {
        self.skuId = item.skuId
        self.value = item.value
    }
}
