//
//  OriginPwdLoginView.swift
//  xywy_swift
//
//  Created by  on 2017/4/12.
//  Copyright © 2017年 xywy. All rights reserved.
//

import UIKit

class OriginPwdLoginView: UIView {

    
    @IBOutlet weak var userName: UITextField!

    @IBOutlet weak var passWord: UITextField!

    @IBOutlet weak var showPwdBtn: UIButton!

    @IBOutlet weak var loginBtn: UIButton!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("init")
        
        let view : UIView = Bundle.main.loadNibNamed("OriginPwdLoginView", owner: self, options: nil)?.first as! UIView
        view.frame.size = frame.size
        addSubview(view)
    }
    
    override func awakeFromNib()
    {
        userName.text = "18601275918"
        passWord.text = "qqqqqq"
        
        super .awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }

    @IBAction func loginBtnClick(_ sender: Any) {
        print("loginBtnClick")
        
        if (passWord.text?.characters.count == 0 || userName.text?.characters.count == 0 ) {
            return;
        }

        resignFirstResponder()
        
        loginWith(username: userName.text!, password: passWord.text!)
    }
    
    @IBAction func forgetPassWord(_ sender: Any) {
        print("forgetPassWord")
    }

    @IBAction func showPwdBtnClick(_ sender: UIButton)
    {        
        sender.isSelected = !sender.isSelected
        passWord.isSecureTextEntry = !sender.isSelected
        passWord.becomeFirstResponder()
    }
}
