//
//  BaseViewController.swift
//  xywy_swift
//
//  Created by  on 2017/4/11.
//  Copyright © 2017年 xywy. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.isExclusiveTouch = true;
        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: UInt.init());
        self.automaticallyAdjustsScrollViewInsets = false;
    }
}
