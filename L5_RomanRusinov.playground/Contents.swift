import UIKit

enum EngineAction: String {
    case on = "двигатель включен"
    case off = "двигатель выключен"
}

enum WindowsState: String {
    case up = "окна подняты"
    case down = "окна опущены"
}

enum baggage: String {
    case put = "есть багаж"
    case take = "нет багажа"
}

protocol car {
    
    var brand: String { get }
    var YearOfOuting: Int { get }
    var engine: EngineAction { get set }
    var windows: WindowsState { get set }
    var OccupiedVol: baggage { get set }
 
    mutating func putBag()
    
    mutating func takeBag()
    
    mutating func windowsUp()
    
    mutating func windowsDown()
    
    mutating func engineOn()
    
    mutating func engineOff()
}

extension car {
    
    mutating func putBag() {
            OccupiedVol = .put
        }
    
    
    mutating func takeBag() {
        OccupiedVol = .take
    }
    
    mutating func windowsUp() {
        windows = .up
    }
    
    mutating func windowsDown() {
        windows = .down
    }
    
    mutating func engineOn() {
        engine = .on
    }
    
    mutating func engineOff() {
        engine = .off
    }
        
}

class sportCar: car {
    
    
    var brand: String
    var YearOfOuting: Int
    var engine: EngineAction
    var windows: WindowsState
    var OccupiedVol: baggage
    
    var maxSpeed: Int
    
    
    init(brand: String, YearOfOuting: Int, engine: EngineAction, windows: WindowsState, OccupiedVol: baggage, maxSpeed: Int) {
        self.brand = brand
        self.YearOfOuting = YearOfOuting
        self.engine = engine
        self.windows = windows
        self.OccupiedVol = OccupiedVol
        self.maxSpeed = maxSpeed
    }
    
}

class trunkCar: car {
    
    var brand: String
    var YearOfOuting: Int
    var engine: EngineAction
    var windows: WindowsState
    var OccupiedVol: baggage
    
    var trailer: TrailerType
    
    enum TrailerType: String {
        case box = "Прицеп"
        case tank = "Прицеп-цистерна"
        case noTrailer = "Прицеп отсутствует"
    }
    
    func pickUpBox() {
        trailer = .box
        }

    
    func pickUpTank() {
        trailer = .tank
    }
    
    func pickDown() {
        trailer = .noTrailer
    }
    
    
    init(brand: String, YearOfOuting: Int, engine: EngineAction, windows: WindowsState, OccupiedVol: baggage, trailer: TrailerType) {
        self.brand = brand
        self.YearOfOuting = YearOfOuting
        self.engine = engine
        self.windows = windows
        self.OccupiedVol = OccupiedVol
        self.trailer = trailer
    }
}

extension sportCar: CustomStringConvertible {
    var description: String {
        return("Автомобиль марки \(brand), год выпуска: \(YearOfOuting), максимальная скорость: \(maxSpeed) километров в час, \(engine.rawValue), \(windows.rawValue), в багажнике: \(OccupiedVol.rawValue)")
    }
}

extension trunkCar: CustomStringConvertible {
    var description: String {
        return("Автомобиль марки \(brand), год выпуска: \(YearOfOuting), \(engine.rawValue), \(windows.rawValue), в багажнике: \(OccupiedVol.rawValue), Прицеп: \(trailer.rawValue)")
    }
    
}

var car1 = trunkCar (brand: "Volvo", YearOfOuting: 2003, engine: .off, windows: .up, OccupiedVol: .take, trailer: .noTrailer)
var car2 = trunkCar (brand: "Kamaz", YearOfOuting: 2013, engine: .on, windows: .down, OccupiedVol: .put, trailer: .tank)
var car3 = sportCar (brand: "Ferrari", YearOfOuting: 1976, engine: .off, windows: .up, OccupiedVol: .take, maxSpeed: 290)
var car4 = sportCar (brand: "Porshe", YearOfOuting: 2007, engine: .on, windows: .down, OccupiedVol: .put, maxSpeed: 300)

print(car1)
print(car2)
print(car3)
print(car4)

car4.engineOff()
car1.pickUpBox()
car2.engineOff()
car2.pickDown()
car1.engineOn()
car3.putBag()

print(car1)
print(car2)
print(car3)
print(car4)

