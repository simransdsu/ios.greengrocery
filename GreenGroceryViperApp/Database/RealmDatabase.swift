import Foundation
import RealmSwift

class RealmDatabase {
    static let shared = RealmDatabase()
    private init() { }
}

extension RealmDatabase: CartDB {
    func updateCart(cartItem: CartItem) -> Bool {
        do {
            let realm = try Realm()
            try realm.write {
                let realmCartItem = RealmCartItem(withCartItem: cartItem)
                realm.add(realmCartItem, update: .modified)
            }
        } catch {
            print("ERROR: Failed in method updateCart() in RealmDatabase.swift with error \(error)")
            return false
        }
        return true
    }
}
