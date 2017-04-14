//
//  MyTabBarViewController.swift
//  xywy
//
//  Created by  on 2017/3/13.
//  Copyright © 2017年 xywy. All rights reserved.
//

import UIKit

class MyTabBarViewController: UITabBarController, UITabBarControllerDelegate {

    var isTabbarHidden = false
    var firstVCArr = [UIViewController]()

    init() {
        super.init(nibName: nil, bundle: nil)
        self.zjInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.zjInit()
        //        fatalError("init(coder:) has not been implemented")
    }
    
    func swiftClassFromString(className: String) -> UIViewController! {
        // get the project name
        if  let appName: String = Bundle.main.object(forInfoDictionaryKey:"CFBundleName") as! String? {
            //拼接控制器名
            let classStringName = "\(appName).\(className)"
            //将控制名转换为类
            let classType = NSClassFromString(classStringName) as? UIViewController.Type
            if let type = classType {
                let newVC = type.init()
                return newVC
            }
        }
        return nil;
    }

    
    private func zjInit() {
        var vcarray = [UINavigationController]()
        
        let vcClasses : Array = ["MainViewController", "SecondViewController", "ThirdViewController", "FourthViewController", "MyCenterViewController"];

        for (index, classStringName) in vcClasses.enumerated()
        {
            if let newVC = self.swiftClassFromString(className: classStringName)
            {
                let newNav = UINavigationController(rootViewController: newVC)
                newNav.navigationBar.tintColor = UIColor.init(white: (CGFloat(5 - index) * CGFloat(0.2)), alpha: 1.0)
                vcarray.append(newNav)
                firstVCArr.append(newVC)
            }
        }
        
        self.viewControllers = vcarray
        
        var icons = ["tabbar_home", "tabbar_health_header", "tabbar_search_doctor", "tabbar_ask_drug", "tabbar_mine"]
        let tabbarTitles = ["首页", "健康头条", "寻医", "问药", "我的"]
        
        for (index, _) in vcarray.enumerated() {
            var temimg = UIImage.init(named: icons[index])
            temimg = temimg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            
            let nav = vcarray[index]
            nav.tabBarItem.image = temimg
            nav.tabBarController?.tabBar.tintColor = UIColor.black
            nav.tabBarItem.title = tabbarTitles[index]
            nav.tabBarItem.selectedImage = UIImage.init(named: icons[index].appending("_selected"))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

        // Do any additional setup after loading the view.
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool
    {
        if (viewController.isEqual(self.viewControllers?.last) && !UserInfoCenter.standard.isLogin())
        {
            // 去登陆
            LoginHelper.popLoginVc(vc: self, isPush: false, animated: true)
            return false
        }
        
        return true
    }
    
    func setTabbarHidden(isH: Bool) {
        if isH != self.tabBar.isHidden {
            if isH {
                if self.tabBar.y >= screenHeight {
                    return
                }
                UIView.animate(withDuration: 0.2, animations: { 
                    self.tabBar.y += 49
                }, completion: { (isfinished) in
                    self.tabBar.isHidden = isH
                })
            }
            else {
                if self.tabBar.y <= screenHeight - 49 {
                    return
                }
                self.tabBar.isHidden = isH
                
                UIView.animate(withDuration: 0.2, animations: {
                    self.tabBar.y -= 49
                }, completion: { (isfinished) in
                })
            }
        }
    }
    
    func callTheTabbar(willcurVC: UIViewController) {
        if firstVCArr.contains(willcurVC)
        {
            self.setTabbarHidden(isH: false)
        }
        else
        {
            self.setTabbarHidden(isH: true)
        }
    }
    
    
}
