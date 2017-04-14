//
//  UIBarButtonItem+Extension.swift
//  xywy_swift
//
//  Created by  on 2017/4/12.
//  Copyright © 2017年 xywy. All rights reserved.
//

import UIKit

extension UIBarButtonItem
{
    public convenience init(normalIcon: String?, highIcon: String?, title: String?, target:Any?, action: Selector?)
    {
        let button = UIButton.init(type: UIButtonType.custom)
        
        if (normalIcon != nil && !normalIcon!.isEmpty)
        {
            button.setBackgroundImage(UIImage.init(named: normalIcon!), for: UIControlState.normal)
        }

        if (highIcon != nil && !highIcon!.isEmpty)
        {
            button.setBackgroundImage(UIImage.init(named: highIcon!), for: UIControlState.highlighted)
        }
        
        if title != nil
        {
            button.setTitle(title, for: UIControlState.normal)
            button.setTitleColor(UIColor.black, for: UIControlState.normal)
            button.titleLabel?.font = f(num: 14)
        }

        if (target != nil && action != nil)
        {
            button.addTarget(target, action: action!, for: UIControlEvents.touchUpInside)
        }
        
        if button.currentBackgroundImage != nil
        {
            button.frame = CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: button.currentBackgroundImage!.size);
        }
        else
        {
            button.frame = CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: 60, height: 44));
        }
        
        self.init(customView: button);
    }
}
