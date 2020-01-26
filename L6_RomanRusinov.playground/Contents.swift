import UIKit

struct queue<Element: Comparable>  {
    
    var people = [Element]()
    
    mutating func bring (_ element: Element) {
        people.append(element)
    }
    
    mutating func leave () -> Element? {
        return people.removeFirst()
    }
    
    
    // функция перевода пенсионеров в другое окно без очереди
    mutating func oldPeople(element: Element) {
        print("\(people.filter{$0 == element}), come to the second window")
        people.removeLast()
    }
    
    subscript(elements: Int) -> Element? {
        
        var end: Element
        
        if elements > people.count {
            return nil
        }
        
        else { end = people[elements]
        
        }
 
        return end
        
    }
    
}


var human = queue<String>()

human.bring("Girl")
human.bring("Man")
human.bring("Old man")
human.leave()

print(human.people)

human.oldPeople(element: "Old man")

print(human.people)

human.bring("Boy")
human.bring("Old woman")
human.oldPeople(element: "Old woman")

print(human.people)

