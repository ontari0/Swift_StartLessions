import UIKit
// в процессе
enum buyError: Error {
    case noMoney
    case anotherPaymentMethod
    case notFound
}

struct jacket {
    var name: String
    var price: Double
}

class buy {
    
    var money = 0.0
    var paymentMethod = ""
    
    var jackets = [
        "Black jacket": jacket(name: "Black jacket", price: 1999.00),
        "Black winter jacket": jacket(name: "Black winter jacket", price: 5999.00),
        "Red jacket": jacket(name: "Red jacket", price: 2500.00)
    ]
    
    func onlinebuyng(name: String, payment: String) throws{
        guard let jacket = jackets[name] else {
            throw buyError.notFound
        }
        guard paymentMethod == payment else {
            throw buyError.anotherPaymentMethod
        }
        guard jacket.price <= money else {
            throw buyError.noMoney
        }
        
        print("Your order \(jacket.name) has been paid")
    }
}

func buying(item: String, payment: String, buying: buy) throws {
    try buying.onlinebuyng(name: item, payment: payment)
}

var customer = buy()

customer.money = 2000.00

do {
    try buying(item: "Black winter jacket", payment: "Cash", buying: customer)
}

catch buyError.notFound {
    print("This item was not found")
}
catch buyError.anotherPaymentMethod {
    print("This payment method is not supported")
}
catch buyError.noMoney {
    print("Not enough money")
}


