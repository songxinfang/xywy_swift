//
//  MainViewController.swift
//  xywy
//
//  Created by  on 2017/3/28.
//  Copyright © 2017年 xywy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: BaseViewController {

    @IBOutlet weak var testLabel: UILabel!

    @IBOutlet weak var testButton: UIButton!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "首页"
        self.view.backgroundColor = UIColor.init(white: 0.5, alpha: 1.0)

//        RxSwiftTest.tests()
         textField.text = "aaa"
        let disposeBag = DisposeBag()

        textField.rx.text.orEmpty
            .bind(to: testLabel.rx.text)
            .addDisposableTo(disposeBag)
    }

//    func getRequestTest()
//    {
//     
//        let url: String = "https://api.wws.xywy.com/api.php/xywyapp/index_home_3/index"
//        let param = initBaseParams(api: "1515", version: "1.0");
//
//        param["is_lunbo"] = "1";
//        param["is_reward"] = "1";
//        param["depart_id"] = "272";
////        param["sign"] = "7a859752f46436e1c411113e52a840f5";
//
//        
//        sendGetRequest(urlString: url, params: param as! [String : Any], success: { (json) in
//            print(json)
//        }) { (error) in
//            print(error)
//        }
//        
//    }
//    
//    
//    func postRequestTest()
//    {
//        
//        let url: String = "https://api.wws.xywy.com/api.php/media/article/collectArticle"
//        let param = initBaseParams(api: "1549", version: "1.0");
//        
//        param["token"] = "f18714ee5ad0da13150d21e2603b4dc8";
//        
//        param["user_id"] = "111312744";
//        param["article_id"] = "944735";
//
//        if true
//        {
//            param["action"] = "1";
////            param["sign"] = "94df31dbe4a7aae2e2129c53eb44ac2f";
//        }
//        else
//        {
//            param["action"] = "2";
////            param["sign"] = "ca382ad9d6b56e79067262dbf2c2b625";
//        }
//        
//        sendPostRequest(urlString: url, params: param as! [String : Any], success: { (json) in
//            print(json)
//        }) { (error) in
//            print(error)
//        }
//    
//    }


 /*
    @IBAction func buttonAction(_ sender: Any) {
        
        let aa : String = "aaaaa"
        if aa.isEmpty {
            
        }
        
        if testButton.titleLabel?.text == "aaaa"
        {
            testButton.setTitle("啊啊啊啊", for: UIControlState.normal)
        }
        else
        {
            testButton.setTitle("aaaa", for: UIControlState.normal)
        }
    }
     */

}
