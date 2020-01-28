import UIKit


class car {
    
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
    
    var brand: String
    var YearOfOuting: Int
    var vol: Double
    var engine: EngineAction
    var windows: WindowsState
    var OccupiedVol: baggage
    
    init(brand: String, YearOfOuting: Int, vol: Double, engine: EngineAction, windows: WindowsState, OccupiedVol: baggage) {
        self.brand = brand
        self.YearOfOuting = YearOfOuting
        self.vol = vol
        self.engine = engine
        self.windows = windows
        self.OccupiedVol = OccupiedVol
    }
 
    func putBag() {
        self.OccupiedVol = .put
    }
    
    func takeBag() {
        self.OccupiedVol = .take
    }
    
    func windowsUp() {
        self.windows = .up
    }
    
    func windowsDown() {
        self.windows = .down
    }
    
    func description () {
        print("Автомобиль марки \(brand), год выпуска: \(YearOfOuting),Объем багажника: \(vol) литров, \(engine.rawValue), \(windows.rawValue), в багажнике: \(OccupiedVol.rawValue)")
    }
    
}




class trunkCar: car {
    
    enum trunkDoorState: String {
        case open = "багажник открыт"
        case close = "багажник закрыт"
    }
    
    var carrying: Double // добавление свойства "грузоподъемность"
    var trunkDoor: trunkDoorState // добавление свойства "дверь багажника"
    
    init(brand: String, YearOfOuting: Int, vol: Double, engine: EngineAction, windows: WindowsState, OccupiedVol: baggage, trunkDoor: trunkDoorState, carrying: Double) {
        self.trunkDoor = trunkDoor
        self.carrying = carrying
        
        super.init(brand: brand, YearOfOuting: YearOfOuting, vol: vol, engine: engine, windows: windows, OccupiedVol: OccupiedVol)
    }
    
    func trunkOpen() {
        trunkDoor = .open
    }
    
    func trunkClose()  {
        trunkDoor = .close
    }
    
    // перераспределение действий с окнами
    
    override func windowsDown() {
        self.windows = .up
        print("Во внедорожнике \(brand) окна не опускаются (заводской брак)")
    }
    
    override func description() {
        print("Внедорожник марки \(brand), год выпуска: \(YearOfOuting), Грузоподъемность: \(carrying) тонн, Объем багажника: \(vol) литров, \(engine.rawValue), \(windows.rawValue), в багажнике: \(OccupiedVol.rawValue), \(trunkDoor.rawValue),")
    }
    
}

class sportCar: car {
    
    enum hatchState: String {
        case open = "люк открыт"
        case close = "люк закрыт"
    }
    
    var hatch: hatchState // добавление свойства "люк"
    var maxspeed: Double // добавление свойства "максимальная скорость"
    
    
    init(brand: String, YearOfOuting: Int, vol: Double, engine: EngineAction, windows: WindowsState, OccupiedVol: baggage, hatch: hatchState, maxspeed: Double) {
        self.hatch = hatch
        self.maxspeed = maxspeed
        
        super.init(brand: brand, YearOfOuting: YearOfOuting, vol: vol, engine: engine, windows: windows, OccupiedVol: OccupiedVol)
    }
    
    func hatchOpen() {
        hatch = .open
    }
    
    func hatchClose() {
        hatch = .close
    }
    
    // перераспределение метода действий с багажником
    
    override func putBag() {
        self.OccupiedVol = .take
        print("В спорткаре \(brand) багажник отсутствует")
    }
    
    
    override func description() {
        print("Спорткар марки \(brand), год выпуска: \(YearOfOuting), Максимальная скорость: \(maxspeed) км/ч, Объем багажника: багажник отсутствует, \(engine.rawValue), \(windows.rawValue), в багажнике: \(OccupiedVol.rawValue), \(hatch.rawValue)")
    }
}

var car1 = trunkCar(brand: "Mitsubishi", YearOfOuting: 2003, vol: 700, engine: .on, windows: .up, OccupiedVol: .put, trunkDoor: .close, carrying: 0.3)

var car2 = trunkCar(brand: "Toyota", YearOfOuting: 2006, vol: 800, engine: .off, windows: .down, OccupiedVol: .take, trunkDoor: .open, carrying: 0.4)

var car3 = sportCar(brand: "Lamborgini", YearOfOuting: 2016, vol: 0.0, engine: .on, windows: .up, OccupiedVol: .take, hatch: .open, maxspeed: 320.0)

var car4 = sportCar(brand: "Ferrari", YearOfOuting: 2009, vol: 0.0, engine: .off, windows: .up, OccupiedVol: .take, hatch: .close, maxspeed: 330.0)


car1.description()
car2.description()
car3.description()
car4.description()

car4.hatchOpen()
car1.windowsDown()
car2.trunkClose()
car3.takeBag()
car4.putBag()


car1.description()
car2.description()
car3.description()
car4.description()
