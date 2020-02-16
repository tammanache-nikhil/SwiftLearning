import UIKit

@propertyWrapper struct UserDefaultsHandler<Value> {
    let key: String
    var storage: UserDefaults = .standard
    
    var wrappedValue: Value? {
        set {
            storage.set(newValue, forKey: key)
        }
        get {
            storage.value(forKey: key) as? Value
        }
    }
}

struct Settings {
    @UserDefaultsHandler(key: "first_launch")
    var isFirstLaunch: Bool?
}

// Usage

var settings = Settings()

print(settings.isFirstLaunch)

settings.isFirstLaunch = true

print(settings.isFirstLaunch)
