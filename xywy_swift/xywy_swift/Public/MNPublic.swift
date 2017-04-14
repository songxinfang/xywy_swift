//
//  HLPublic.swift
//  yios
//
//  Created by 江 on 16/7/27.
//  Copyright © 2016年 江. All rights reserved.
//

import UIKit

// Public
let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

let topBarHeight: CGFloat = 64
let tabBarHeight: CGFloat = 49

// 当前设备系统版本
let IS_IOS8 = (UIDevice.current.systemVersion as NSString).doubleValue >= 8.0
let IS_IOS9 = (UIDevice.current.systemVersion as NSString).doubleValue >= 9.0
let IS_IOS10 = (UIDevice.current.systemVersion as NSString).doubleValue >= 10.0

// 屏幕尺寸
let IS_IPHONE4 = UIScreen.main.currentMode!.size.equalTo(CGSize.init(width: 640, height: 960))
let IS_IPHONE5 = UIScreen.main.currentMode!.size.equalTo(CGSize.init(width: 640, height: 1136))
let IS_IPHONE6 = UIScreen.main.currentMode!.size.equalTo(CGSize.init(width: 750, height: 1334))
let IS_IPHONE6P = UIScreen.main.currentMode!.size.equalTo(CGSize.init(width: 1242, height: 2208))

// 通知
let LoginHasFinishNotification = "LoginHasFinishNotification"


// 公共函数
func ImageUrl(str: String?) -> NSURL {
    if let temp = str {
        return NSURL.init(string: temp)!
    }
    else {
        return NSURL.init(string: "")!
    }
}

// 颜色
func defauleColor() -> UIColor
{
    return UIColor.lightGray
}

func RGBColor(R: CGFloat, G: CGFloat, B: CGFloat) -> UIColor
{
    return UIColor.init(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: 1)
}

func RGBAColor (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor
{
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

func kRGBColorFromHex(rgbValue: Int) -> (UIColor)
{
    return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
                   green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
                   blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,
                   alpha: 1.0)
}

// NSUserDefault
let userDefault = UserDefaults.standard
let notifyDefault = NotificationCenter.default

// 文字大小适配
func f(num: CGFloat) -> UIFont
{
    return UIFont.systemFont(ofSize: num)
}

func fAndN(num: CGFloat, fontName: String) -> UIFont
{
    let temp = UIFont.init(name: fontName, size: num)
    if let t = temp
    {
        return t
    }
    else {
        return f(num: num)
    }
}

func fb(num: CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: num)
}
