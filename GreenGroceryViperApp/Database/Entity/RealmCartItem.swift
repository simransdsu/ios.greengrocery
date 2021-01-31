import Foundation
import RealmSwift

class RealmCartItem: Object {
    @objc dynamic var skuId: String = ""
    @objc dynamic var value: Int = 0
    @objc dynamic var updated: Date = Date()
    
    // Adding Primary Key
    override class func primaryKey() -> String? {
        return "skuId"
    }
}

extension RealmCartItem {
    convenience init(withCartItem item: CartItem) {
        self.init()
        self.skuId = item.skuId
        self.value = item.value
    }
}
