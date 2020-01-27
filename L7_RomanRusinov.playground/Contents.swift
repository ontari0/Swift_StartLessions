import UIKit

enum buyError: Error {
    case noMoney
    case anotherPaymentMethod
    case notFound
}

struct jacket {
    var name: String
    var price: Double
}

class buy{
    
    var jackets = [
        "jacket1": jacket(name: "Black jacket", price: 1999.00),
        "jacket2": jacket(name: "Black winter jacket", price: 5999.00),
        "jacket3": jacket(name: "Red jacket", price: 2500.00)
    ]
    
    func onlinebuyng(name: String, price: Double) throws{
        guard let jacket = jackets[name] else {
            throw buyError.notFound
        }
        guard jacket.price  else {
            throw buyError.noMoney
        }
    }
}

var item1: buy

