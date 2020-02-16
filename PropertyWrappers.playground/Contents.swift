import UIKit

@propertyWrapper struct Capitalized {
    var wrappedValue: String {
        didSet {
            wrappedValue = wrappedValue.capitalized
            print(wrappedValue)
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
        print(self.wrappedValue)
    }
}


struct User {
    @Capitalized var name: String
    @Capitalized var last: String
}

var user = User(name: "nikhil", last: "tamma")
user.name = "john"
