import Foundation

protocol LocalDataSourceProtocol {
    func getData(key: String) -> Any?
    func saveData(data: Any, for key: String)
    func deleteData(key: String)
}

final class LocalDataSource: LocalDataSourceProtocol {
    
    private var userDefaults: UserDefaults {
        return UserDefaults.standard
    }
    
    func getData(key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
    
    func saveData(data: Any, for key: String) {
        userDefaults.set(data, forKey: key)
    }
    
    func deleteData(key: String) {
        userDefaults.removeObject(forKey: key)
    }
}

