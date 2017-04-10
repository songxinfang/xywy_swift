//
//  SecondViewController.swift
//  xywy
//
//  Created by  on 2017/3/31.
//  Copyright © 2017年 xywy. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "健康头条"
        self.view.backgroundColor = UIColor.blue
        
        
        Alamofire.request("https://api.500px.com/v1/photos").responseJSON { (DataResponse) in
            
            print(DataResponse)
            
            let Json = DataResponse.result.value
            if (Json != nil){
                print("Json:\(Json) ")
            }
        }

    }
}
