//
//  LoginViewController.swift
//  xywy_swift
//
//  Created by  on 2017/4/11.
//  Copyright © 2017年 xywy. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    lazy var loginSwitchView: LoginSwitchView = {
        return LoginSwitchView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: 44), titleArray: ["密码登录","动态密码"]) }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
        self.title = "登录"

        self.setLeftBackButton(icon: "nav_back")
        
        self.view.addSubview(self.loginSwitchView)
    }

    
}
