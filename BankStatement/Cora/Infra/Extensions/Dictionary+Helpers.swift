import Foundation

extension Dictionary {
    func decoded<T: Decodable>() -> T? {
        guard let data = try? JSONSerialization.data(withJSONObject: self) else {
            return nil
        }
        
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    func merge(with: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
        var copy = self
        for (k, v) in with {
            copy[k] = v
        }
        return copy
    }
    
    mutating func append(with: Dictionary<Key, Value>) {
        for (k, v) in with {
            self[k] = v
        }
    }
    
    func queryString(_ dictionary: Dictionary? = nil) -> String {
        let dict = dictionary ?? self
        return dict
            .compactMap { (key, value) -> String? in
                if value is [String: Any] {
                    if let dictionary = value as? Dictionary {
                        return queryString(dictionary)
                    }
                }
                else {
                    return "\(key)=\(value)"
                }
                
                return nil
            }
            .joined(separator: "&")
    }
}
