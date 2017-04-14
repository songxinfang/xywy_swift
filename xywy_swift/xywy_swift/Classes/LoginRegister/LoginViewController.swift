//
//  LoginViewController.swift
//  xywy_swift
//
//  Created by  on 2017/4/11.
//  Copyright © 2017年 xywy. All rights reserved.
//

import UIKit

class LoginViewController : BaseViewController, LoginSwitchViewDelegate {

    lazy var loginSwitchView: LoginSwitchView =
    {
        return LoginSwitchView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 48), titleArray: ["密码登录","动态密码"], delegate: self)}()
    
    lazy var originLogin: OriginPwdLoginView = {
        return OriginPwdLoginView.init(frame: CGRect.init(x: 0, y: 48, width: screenWidth, height: 200))}()
    
    lazy var dynamicPwdLogin: DynamicPwdLogin = {
        return DynamicPwdLogin.init(frame: CGRect.init(x: 0, y: 48, width: screenWidth, height: 200))}()

    lazy var thirdView: ThirdLoginView = {
        return ThirdLoginView.init(frame: CGRect.init(x: 0, y: 248, width: screenWidth, height: 200))}()

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "登录"

        self.setLeftBackButton(icon: "login_page_close", highIcon: nil)
        
        self.view.addSubview(self.loginSwitchView)
        self.view.addSubview(self.originLogin)
        self.view.addSubview(self.dynamicPwdLogin)
//        self.view.addSubview(self.thirdView)
        
        self.setRightButton(title: "注册", action: #selector(LoginViewController.registerAction))
    }
    
    
    func loginSwitchViewSelectIndex(index: NSInteger)
    {
        if (index == 0)
        {
            self.originLogin.isHidden = false
            self.dynamicPwdLogin.isHidden = true
            self.dynamicPwdLogin.endEditing(true)
        }
        else
        {
            self.originLogin.isHidden = true
            self.dynamicPwdLogin.isHidden = false
            self.originLogin.endEditing(true)
        }
    }
    
    func registerAction()
    {
        let registerVC = RegisterViewController.init(nibName: "RegisterViewController", bundle: nil)
        registerVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        notifyDefault.addObserver(self, selector: #selector(LoginViewController.userDidLogin), name: NSNotification.Name.init(LoginHasFinishNotification), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        notifyDefault.removeObserver(self)
    }
    
    func userDidLogin(notifyData : NSNotification)
    {
        
        let json = notifyData.object as! [String : AnyObject]
        let data = json["data"]
        
        UserInfoCenter.standard.saveUserInfo(data: data as! [String : AnyObject])
        
        print("userDidLogin")
        
        self.backAction()
    }

}
