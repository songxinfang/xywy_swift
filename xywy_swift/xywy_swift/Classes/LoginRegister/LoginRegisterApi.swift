//
//  LoginRegisterApi.swift
//  xywy_swift
//
//  Created by  on 2017/4/13.
//  Copyright © 2017年 xywy. All rights reserved.
//

import Foundation
import SwiftyJSON

func loginWith(username: String, password: String)
{
    
    let url: String = "https://api.wws.xywy.com/api.php/xywyapp/userlogin/index"
    let param = initBaseParams(api: "1012", version: "1.1");
    
    param["account"] = username;
    param["passwd"] = password;

    sendGetRequest(urlString: url, params: param as! [String : AnyObject], success:
    { (json) in
        
        notifyDefault.post(name: NSNotification.Name.init(LoginHasFinishNotification), object: json)
        
    }) { (error) in
        print(error)
    }
    
}
