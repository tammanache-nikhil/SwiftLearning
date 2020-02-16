import UIKit

@propertyWrapper struct UserDefaultsHandler<Value> {
    let key: String
    let defaultValue: Value
    var storage: UserDefaults = .standard
    
    var wrappedValue: Value {
        set {
            storage.set(newValue, forKey: key)
        }
        get {
            storage.value(forKey: key) as? Value ?? defaultValue
        }
    }
}

extension UserDefaultsHandler where Value: ExpressibleByNilLiteral {
    init(key: String, storage: UserDefaults = .standard) {
        self.init(key: key, defaultValue: nil, storage: storage)
    }
}

struct Settings {
    @UserDefaultsHandler(key: "first_launch", defaultValue: false)
    var isFirstLaunch: Bool
}

// Usage

var settings = Settings()

print(settings.isFirstLaunch)

settings.isFirstLaunch = true

print(settings.isFirstLaunch)
