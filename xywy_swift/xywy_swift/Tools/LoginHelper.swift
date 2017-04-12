//
//  XYWYLoginHelper.swift
//  xywy_swift
//
//  Created by  on 2017/4/11.
//  Copyright © 2017年 xywy. All rights reserved.
//

import Foundation
import UIKit

class LoginHelper {
     
    static func popLoginVc(vc: UIViewController, isPush: Bool, animated: Bool)
    {
     
        let loginVC = LoginViewController.init(nibName: "LoginViewController", bundle: nil)
        loginVC.hidesBottomBarWhenPushed = true
        let loginNav = UINavigationController.init(rootViewController: loginVC)
        
        if (isPush && vc.navigationController != nil)
        {
            vc.navigationController!.pushViewController(loginNav, animated: animated)
        }
        else
        {
            vc.present(loginNav, animated: animated, completion: nil)
        }
    }

}
