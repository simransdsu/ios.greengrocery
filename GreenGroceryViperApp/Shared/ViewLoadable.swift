import Foundation

public protocol ViewLoadable: AnyObject {
    static var nibname: String { get }
}

public extension ViewLoadable {
    static func loadFromNib() -> Self {
        return loadFromNib(from: Bundle.init(for: self))
    }
    
    static func loadFromNib(from bundle: Bundle) -> Self {
        return bundle.loadNibNamed(self.nibname, owner: nil, options: nil)?.first as! Self
    }
}
