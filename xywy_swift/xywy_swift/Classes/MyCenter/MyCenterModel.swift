//
//  MyCenterModel.swift
//  xywy_swift
//
//  Created by  on 2017/4/14.
//  Copyright © 2017年 xywy. All rights reserved.
//

import Foundation

class MyCenterModel
{
    var iconName : String?
    var titleStr : String?
    var numberStr : String?
    
    init(icon : String?, title : String?, number : String?)
    {
        self.iconName = icon
        self.titleStr = title
        self.numberStr = number
    }
}
