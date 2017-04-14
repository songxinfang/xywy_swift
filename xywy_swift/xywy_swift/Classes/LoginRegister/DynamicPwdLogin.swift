//
//  DynamicPwdLogin.swift
//  xywy_swift
//
//  Created by  on 2017/4/12.
//  Copyright © 2017年 xywy. All rights reserved.
//

import UIKit

class DynamicPwdLogin: UIView {
    
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var passWord: UITextField!
    
    @IBOutlet weak var dynamicPwd: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("init")
        
        let view : UIView = Bundle.main.loadNibNamed("DynamicPwdLogin", owner: self, options: nil)?.first as! UIView
        view.frame.size = frame.size
        addSubview(view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    @IBAction func loginBtnClick(_ sender: Any) {

    }
    
    @IBAction func forgetPassWord(_ sender: Any) {
        print("forgetPassWord")
    }
    
    @IBAction func accessDynamicPwd(_ sender: Any)
    {
        print("accessDynamicPwd")
    }
}
