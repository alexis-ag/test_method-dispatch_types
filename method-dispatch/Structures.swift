import Foundation

struct SomeStruct {
    // should be direct
    func getRandomInt() -> Int {
        Int.random(in: 0...Int.max)
    }
}

class SomeClass {
    // table but  will be direct after compiler optimisation
    func getRandomInt() -> Int {
        Int.random(in: 0...Int.max)
    }
}

class SomeChildClass: SomeClass {
    // should be table
    override func getRandomInt() -> Int {
        Int.random(in: 0...Int.max)
    }
}

class SomeNSClass: NSObject {
}
extension SomeNSClass {
    // should be message
    func getRandomInt() -> Int {
        Int.random(in: 0...Int.max)
    }
}
