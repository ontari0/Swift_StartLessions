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


// 2-е задание

enum buyError1: Error {
    case noMoney
    case notFound
}

struct jacket1 {
    var name: String
    var price: Double
}

class buy1 {
    
    var money = 0.0
    
    var jackets = [
        "Black jacket": jacket1(name: "Black jacket", price: 1999.00),
        "Black winter jacket": jacket1(name: "Black winter jacket", price: 5999.00),
        "Red jacket": jacket1(name: "Red jacket", price: 2500.00)
    ]
    
    func onlinebuyng1(name: String) -> (String?, buyError1?) {
        guard let jacket = jackets[name] else {
            return (nil, buyError1.notFound)
        }
        guard jacket.price <= money else {
            return (nil, buyError1.noMoney)
        }
        print("Your order \(jacket.name) has been paid")
        return ("Your order \(jacket.name) has been paid", nil)
        
}

}

var customer1 = buy1()

customer1.money = 2600.00
customer1.onlinebuyng1(name: "Red jacket")
