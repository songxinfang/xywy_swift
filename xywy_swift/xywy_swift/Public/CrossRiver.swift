//
//  CrossRiver.swift
//  xywy_swift
//
//  Created by  on 2017/4/17.
//  Copyright © 2017年 xywy. All rights reserved.
//

import Foundation




open class Goods
{
    var index: Int
    
    init(_ index: Int)
    {
        self.index = index
    }
    
    func goodsName() -> String {
        switch index {
        case 1:
            return "狐狸"
        case 2:
            return "鸡"
        default:
            return "大米"
        }
    }
    
    static func togetherAble(goods1: Goods, goods2: Goods) -> Bool
    {
        if goods1.index - goods2.index == 1 || goods2.index - goods1.index == 1
        {
            return false
        }
        
        return true
    }
}

open class TestClass
{
    var startArray : [Goods] = Array.init()
    var targetArray : [Goods] = Array.init()
    
    init()
    {
        startArray.append(Goods.init(1))
        startArray.append(Goods.init(2))
        startArray.append(Goods.init(3))
    }
    
    // togetherAble 选择跟对岸的和谐的那个
    func getGoods( array1: inout [Goods], array2: [Goods], togetherAble:Bool) -> Goods?
    {
        
        var index : Int? = nil
        var goods : Goods? = nil
        
        // 1. 3个物品中找一个,要求剩下的必须不冲突
        if array1.count > 2
        {
            if Goods.togetherAble(goods1: array1[0], goods2: array1[1])
            {
                index = 2
            }
            else if Goods.togetherAble(goods1: array1[0], goods2: array1[2])
            {
                index = 1
            }
            else
            {
                index = 0
            }
        }
        else if array1.count == 2
        {
            if Goods.togetherAble(goods1: array1[0], goods2: array2[0])
            {
                if togetherAble
                {
                    index = 0
                }
                else
                {
                    index = 1
                }
            }
            else
            {
                if togetherAble
                {
                    index = 1
                }
                else
                {
                    index = 0
                }
            }
        }
        else if array1.count == 1
        {
            index = 0
        }
        
        if index != nil
        {
            goods = array1[index!]
            array1.remove(at: index!)
        }
        
        return goods
    }
    
    func printInfo(goods: Goods?, road: String)
    {
        if goods != nil
        {
            print("\(road) : \(goods!.goodsName())")
        }
        else
        {
            print("\(road) : 空 ")
        }
    }
    
    func sendGoods()
    {
        // 1. 取出一个货物运送走
        var sendingGoods: Goods? = getGoods(array1: &startArray, array2: targetArray, togetherAble: true)
        
        // 2. 物品到达存入目标
        if sendingGoods != nil
        {
            printInfo(goods: sendingGoods, road: "send")
            
            targetArray.append(sendingGoods!)
            
            if targetArray.count == 2 && !Goods.togetherAble(goods1: targetArray[0], goods2: targetArray[1])
            {
                
                // 3. 目标口袋出现bug，如果带走跟对岸冲突的一个
                sendingGoods = getGoods(array1: &targetArray, array2: startArray, togetherAble: false)
            }
            else
            {
                sendingGoods = nil
            }
            
            if startArray.count == 0
            {
                print("-- SENDING SEND --")
                
                return
            }
        }
        
        printInfo(goods: sendingGoods, road: "back")
        
        // 4. 带回来的存入口袋
        if sendingGoods != nil
        {
            startArray.append(sendingGoods!)
        }
        
        sendGoods()
    }
    
    
    static func startTest()
    {
        let test = TestClass.init()
        print("-- START SENDING --")
        
        test.sendGoods()
    }
}



