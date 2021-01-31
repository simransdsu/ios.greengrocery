import Foundation

protocol CartDB {
    func updateCart(cartItem: CartItem) -> Bool
}
