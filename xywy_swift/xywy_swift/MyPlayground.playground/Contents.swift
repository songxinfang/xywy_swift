//: Playground - noun: a place where people can play

import UIKit
//
//open class Goods
//{
//    
//    var index: Int
//    
//    init(_ index: Int)
//    {
//        self.index = index
//    }
//    
//    static func togetherAble(goods1: Goods, goods2: Goods) -> Bool
//    {
//        if goods1.index - goods2.index == 1 || goods2.index - goods1.index == 1
//        {
//            return false
//        }
//        
//        return true
//    }
//}
//
//var startArray : [Goods] = Array.init()
//startArray.append(Goods.init(1))
//startArray.append(Goods.init(2))
//startArray.append(Goods.init(3))
//
//var targetArray : [Goods] = Array.init()
//
//
//// togetherAble 选择跟对岸的和谐的那个
//func getGoods(array1: [Goods], array2: [Goods], togetherAble:Bool) -> Goods?
//{
//    var goods : Goods? = nil
//    
//    // 1. 3个物品中找一个,要求剩下的必须不冲突
//    if array1.count > 2
//    {
//        if Goods.togetherAble(goods1: array1[0], goods2: array1[1])
//        {
//            goods = array1[2]
//        }
//        else if Goods.togetherAble(goods1: array1[0], goods2: array1[2])
//        {
//            goods = array1[1]
//        }
//        else
//        {
//            goods = array1[0]
//        }
//    }
//    else if array1.count == 2
//    {
//        if Goods.togetherAble(goods1: array1[0], goods2: array2[0])
//        {
//            if togetherAble
//            {
//                goods = array1[0]
//            }
//            else
//            {
//                goods = array1[1]
//            }
//        }
//        else
//        {
//            if togetherAble
//            {
//                goods = array1[1]
//            }
//            else
//            {
//                goods = array1[0]
//            }
//        }
//    }
//    else if array1.count == 1
//    {
//        goods = array1[0]
//    }
//    
//    if goods != nil
//    {
//        print("goods_index = \(goods!.index)")
//    }
//    
//    return goods
//}
//
//func sendGoods()
//{
//    // 1. 取出一个货物运送走
//    var sendingGoods: Goods? = getGoods(array1: startArray, array2: targetArray, togetherAble: true)
//    
//    // 2. 物品到达存入目标
//    if sendingGoods == nil
//    {
//        print("-- SENDING END --")
//        
//        return
//    }
//    else
//    {
//        targetArray.append(sendingGoods!)
//        
//        // 3. 目标口袋出现bug，如果带走跟对岸冲突的一个
//        sendingGoods = getGoods(array1: targetArray, array2: startArray, togetherAble: false)
//    }
//
//    // 4. 带回来的存入口袋
//    if sendingGoods != nil
//    {
//        startArray.append(sendingGoods!)
//        sendingGoods = nil
//    }
//    
//    sendGoods()
//}
//
//print("-- SENDING START --")
//
//sendGoods()

//
//func send
//{
//    
//}

/*
var str = "Hello, playground"
print(str)


protocol Flyable {
    
    // 飞行方法
    func fly()
}

protocol PetType {
    
    // 宠物昵称
    var petName: String? { get set };

    // 宠物年龄
    var petAge: Int? { get set };

    // 打印宠物信息
    func printPetInfo()
}

// 动物
class Animal
{
    // 客观物种
    var species: String?
    
    init() {

    }
}

// 交通工具
class Vehicles
{
    // 客观名称
    var name: String?
    
    init() {

    }
}

class Dog: Animal, PetType {

    var petName: String?
    var petAge: Int?
    
    override init()
    {
        super.init()
        self.species = "宠物狗"
    }
    
    convenience init(name: String, age: Int)
    {
        self.init()
        self.petName = name
        self.petAge = age
    }

    func printPetInfo()
    {
        print("name = \(petName!)")
        print("age = \(petAge!)")
    }
}

class Airplane: Vehicles, Flyable {
    
    override init()
    {
        super.init()
        self.name = "飞机"
    }
    
    func fly() {
        print("I can fly over 500km/h")
    }
}

class Bird : Animal, PetType, Flyable {
    
    var petName: String?
    var petAge: Int?
    
    override init()
    {
        super.init()
        self.species = "宠物鸟"
    }

    convenience init(name: String, age: Int)
    {
        self.init()
        
        self.petName = name
        self.petAge = age
    }

    func printPetInfo()
    {
        print("name = \(petName!)")
        print("age = \(petAge!)")
    }
    
    func fly()
    {
        print("I can't fly over 50km/h")
    }

}


protocol AgeClasificationProtocol
{
    var age: Int { get }
    func agetype() -> String
}

class Person
{
    let firstname: String
    let lastname: String
    var age: Int
    
    init(firstname: String, lastname: String, age: Int)
    {
        self.firstname = firstname
        self.lastname = lastname
        self.age = age
    }
}

extension Person : AgeClasificationProtocol
{
    func fullname() -> String
    {
        var c: String
        c = firstname + " " + lastname
        return c
    }
    
    func agetype() -> String
    {
        switch age {
        case 0...2:
            return "Baby"
        case 2...12:
            return "Child"
        case 13...19:
            return "Teenager"
        case let x where x > 65:
            return "Elderly"
        default:
            return "Normal"
        }
    }
}

class test
{
    var test : String?
    
    init()
    {
        self.test = "test"
    }
    
    func tests()
    {
        let person: Person = Person.init(firstname: "mm", lastname: "nn", age: 5)
        print(person.fullname())
        print(person.agetype())
        
        let dog = Dog.init(name: "乐乐", age: 3)
        dog.printPetInfo()
        
        let bird = Bird.init(name: "欢欢", age: 3)
        bird.printPetInfo()
        bird.fly()
        
        let plane = Airplane.init()
        plane.fly()
    }
    
}
 
*/
