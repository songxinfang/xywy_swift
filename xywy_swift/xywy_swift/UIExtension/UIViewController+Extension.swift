//
//  UIViewController+Extension.swift
//  xywy_swift
//
//  Created by  on 2017/4/11.
//  Copyright © 2017年 xywy. All rights reserved.
//

import UIKit

extension UIViewController {
 
    func setLeftBackButton(icon: String?, highIcon: String?)
    {
        if (self.navigationController != nil) {
            
            let iconName = ((icon != nil) ? icon : "nav_back")
            
            let imageItem = UIBarButtonItem.init(normalIcon: iconName,
                                                 highIcon: highIcon,
                                                 title: nil,
                                                 target: self,
                                                 action: #selector(backAction))
            self.navigationItem.leftBarButtonItem = imageItem;
        }
    }
    
    func setRightButton(icon: String?, highIcon: String?, action: Selector)
    {
        let imageItem = UIBarButtonItem.init(normalIcon: icon,
                                             highIcon: highIcon,
                                             title: nil,
                                             target: self,
                                             action: action)
        self.navigationItem.rightBarButtonItem = imageItem;
    }

    func setRightButton(title: String, action: Selector)
    {
        let imageItem = UIBarButtonItem.init(normalIcon: nil,
                                             highIcon: nil,
                                             title: title,
                                             target: self,
                                             action: action)
        self.navigationItem.rightBarButtonItem = imageItem;
    }

    func backAction()
    {
        self.view.endEditing(true)
        
        if (self.navigationController!.viewControllers.count > 1) {
            self.navigationController!.popViewController(animated: true)
        }
        else
        {
            self.navigationController?.dismiss(animated: true, completion:nil)
        }
    }
}
