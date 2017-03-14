//
//  HLPublic.swift
//  yios
//
//  Created by 江 on 16/7/27.
//  Copyright © 2016年 江. All rights reserved.
//

import UIKit
// Public
let kWidth = UIScreen.main.bounds.size.width
let kHeight = UIScreen.main.bounds.size.height

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

func kColor(R: CGFloat, G: CGFloat, B: CGFloat) -> UIColor
{
    return UIColor.init(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: 1)
}

// NSUserDefault
let uDefault = UserDefaults.standard

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

// 当前设备版本

// 公共函数
