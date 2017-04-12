//
//  UIViewController+Extension.swift
//  xywy_swift
//
//  Created by  on 2017/4/11.
//  Copyright © 2017年 xywy. All rights reserved.
//

import UIKit

extension UIViewController {
 
    func setLeftBackButton(icon: String) {
        
        if (self.navigationController != nil) {
         
            
//            if (icon == nil) {
//                icon = "nav_back"
//            }
            
            let imageItem = UIBarButtonItem.init(image: UIImage.init(named: icon),
                                                 style: UIBarButtonItemStyle.plain,
                                                 target: self,
                                                 action: #selector(backAction))

            self.navigationItem.leftBarButtonItem = imageItem;

        }
    }
    
    func setRightButton(icon: String, action: Selector) {
        
    }
    
    func backAction()
    {
        self.view.endEditing(true)
        
        if (self.navigationController!.viewControllers.count > 1) {
            self.navigationController!.popViewController(animated: true)
        }
        else
        {
            self.navigationController?.dismiss(animated: true, completion: { 
                
            })
        }
    }
}
