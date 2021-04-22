// builder design pattern contain there elements
/* director : accept inputs and coordinate with  the builder . usually is a viewcontroller
   builder : accepts step by step inputs and handels the creation of the product
   product : the complex object to be created */

import Foundation

//Ingrediants

public struct Sauces: OptionSet {
    public static let mayonnise = Sauces(rawValue: 1 << 0)
    public static let mustarda = Sauces(rawValue: 1 << 1)
    public static let ketchup = Sauces(rawValue: 1 << 2)
    public static let secret = Sauces(rawValue: 1 << 3)

    public let rawValue: Int
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    
}

public struct Toppings: OptionSet{
    public static let cheese = Toppings(rawValue: 1 << 0)
    public static let lettuce = Toppings(rawValue: 1 << 1)
    public static let pickles = Toppings(rawValue: 1 << 2)
    public static let tomatoes = Toppings(rawValue: 1 << 3)

    public let rawValue: Int
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    
}
public enum Meat: String {
    case chicken
    case kitten
    case beef
    case tofu
}
// product

public struct Hamburger {
    public let meat: Meat
    public let sauce: Sauces
    public let toppings: Toppings
}

extension Hamburger: CustomStringConvertible {
    public var description: String {
        return meat.rawValue + " burger"
    }
}

// builder
public enum CustomeError: Error{
    case soldOut
}

public class HamburgerBuilder {
    public private(set) var meat: Meat = .beef
    public private(set) var sauces: Sauces = []
    public private(set) var toppings: Toppings = []
    private var soldOutMeats: [Meat] = [.kitten]
    public func addSauces(_ sauce: Sauces) {
        sauces.insert(sauce)
    }
    public func removeSauces(_ sauce: Sauces) {
        sauces.remove(sauce)
    }
    public func addToppings(_ topping: Toppings) {
        toppings.insert(topping)
    }
    public func removeTopping(_ topping: Toppings) {
        toppings.remove(topping)
    }
    public func setMeat(meat: Meat) throws {
        guard isAvaliable(meat) else {throw CustomeError.soldOut }
        self.meat = meat
    }
    public func isAvaliable(_ meat: Meat) -> Bool {
        return !soldOutMeats.contains(meat)
    }
    public func build() -> Hamburger {
        return Hamburger(meat: meat, sauce: sauces, toppings: toppings)
        
    }
}
// employee
public class Employee {
    public func creatCombo() throws -> Hamburger {
        let builder = HamburgerBuilder()
        try builder.setMeat(meat: .beef)
        builder.addSauces(.secret)
        builder.addToppings([.pickles, .tomatoes, .lettuce])
        return builder.build()
    }
}

