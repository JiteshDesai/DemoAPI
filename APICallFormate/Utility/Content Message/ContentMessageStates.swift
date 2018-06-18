
import Foundation

public func ==(lhs: ContentMessageState, rhs: ContentMessageState) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

public enum ContentMessageState: Hashable, Equatable {
    
    case `default`
    case networkError
    
    public var hashValue: Int {
        get {
            switch self {
            
            case .default: return -2
            case .networkError: return -3
            }
        }
    }
}
