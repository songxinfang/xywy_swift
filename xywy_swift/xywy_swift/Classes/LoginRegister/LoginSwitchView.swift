//
//  LoginSwitchView.swift
//  xywy_swift
//
//  Created by  on 2017/4/11.
//  Copyright © 2017年 xywy. All rights reserved.
//

import UIKit


protocol LoginSwitchViewDelegate : NSObjectProtocol
{
    func loginSwitchViewSelectIndex(index: NSInteger)
}




class LoginSwitchView: UIView {

    open var delegate: LoginSwitchViewDelegate?

    var btnArray: [UIButton]?
//    var bottomView: UIView? = nil
    var bgLineView: UIView? = nil
    
    var selectBtn: UIButton?

    init(frame: CGRect, titleArray: [String], delegate: LoginSwitchViewDelegate)
    {
        super.init(frame: frame)
        
//        self.backgroundColor = UIColor.white
        
        self.backgroundColor = kRGBColorFromHex(rgbValue: 0xf2f2f2)

        self.delegate = delegate
        
        self.buildUI(titleArray: titleArray)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    

    @objc private func btnClick(btn: UIButton)
    {
        self.selectBtn?.isSelected = false;
        btn.isSelected = true;
        
        UIView.animate(withDuration: 0.25) { 
            self.bgLineView!.x = btn.x;
        }
        
        self.delegate?.loginSwitchViewSelectIndex(index: btn.tag)

        self.selectBtn = btn;
    }
    
    private func buildUI(titleArray: [String])
    {
        let Width = self.bounds.size.width;
        let Height = self.bounds.size.height;

        let count = titleArray.count
        let W = Width/CGFloat(count)
        let H = Height-2;

        
        self.bgLineView = UIView.init(frame: CGRect.init(x: 0, y: H, width: W, height: 2))
        bgLineView!.backgroundColor = kRGBColorFromHex(rgbValue: 0x6ed8ff)
        addSubview(bgLineView!);
        
//        self.bottomView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Width, height: Height))
//        self.addSubview(self.bottomView!)
        
        for (index,title) in titleArray.enumerated() {
            let btn = UIButton.init(frame: CGRect.init(x: CGFloat(index) * W, y: 0, width: W, height: H))
            btn.tag = index
            btn.setTitle(title, for: UIControlState.normal)
            btn.titleLabel?.font = f(num: 14)
            btn.setTitleColor(kRGBColorFromHex(rgbValue: 0x6fd8ff), for: UIControlState.selected)
            btn.setTitleColor(kRGBColorFromHex(rgbValue: 0x666666), for: UIControlState.normal)
            btn.addTarget(self, action: #selector(LoginSwitchView.btnClick), for: UIControlEvents.touchUpInside)
            
            if index == 0 {
                self.btnClick(btn: btn)
            }
            addSubview(btn)
            btnArray?.append(btn)
        }
    }
    
}
