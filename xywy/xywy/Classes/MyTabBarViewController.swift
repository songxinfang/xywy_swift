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
    private func zjInit() {
        var vcarray = [UINavigationController]()
        
//        let mainVM = MNLoginViewModel()
        let mainVC = UIViewController.init()
        let mainNav = UINavigationController(rootViewController: mainVC)
        vcarray.append(mainNav)
        firstVCArr.append(mainVC)
        
        self.viewControllers = vcarray
        
        let imgs = ["tabbar_home"]
        let tabbarTitles = ["首页"]
        let selectedImages = ["tabbar_home_selected"]
        
        for (index, _) in vcarray.enumerated() {
            var temimg = UIImage.init(named: imgs[index])
            temimg = temimg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            
            let nav = vcarray[index]
            nav.tabBarItem.image = temimg
            nav.tabBarController?.tabBar.tintColor = UIColor.black
            nav.tabBarItem.title = tabbarTitles[index]
            nav.tabBarItem.selectedImage = UIImage.init(named: selectedImages[index])
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController)
    {
        
    }
    
    func setTabbarHidden(isH: Bool) {
        if isH != self.tabBar.isHidden {
            if isH {
                if self.tabBar.y >= kHeight {
                    return
                }
                UIView.animate(withDuration: 0.2, animations: { 
                    self.tabBar.y += 49
                }, completion: { (isfinished) in
                    self.tabBar.isHidden = isH
                })
            }
            else {
                if self.tabBar.y <= kHeight - 49 {
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
