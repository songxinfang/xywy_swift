//
//  HTTPApiBase.swift
//  xywy
//
//  Created by  on 2017/4/10.
//  Copyright © 2017年 xywy. All rights reserved.
//

import Foundation
import UIKit

let SIGN_PRIVATE_KEY = "JtLtqyYrf6qe2aNt"

func initBaseParams(api: String, version : String) -> NSMutableDictionary {
    
    let getParameters: NSMutableDictionary = NSMutableDictionary.init();
    getParameters["version"] = version;
    getParameters["api"] = api;
    
    getParameters["source"] = "xywyapp";
    getParameters["os"] = "ios";
    getParameters["pro"] = "xywyf32l24WmcqquqqTdhXaEng";
    
    
    return getParameters;
}

// 计算sign参数
func signParam(params: [String : AnyObject]) -> [String : AnyObject]?
{
    if (params.count > 0)
    {
        var newParams : [String : AnyObject] = params
        newParams["token"] = "" as AnyObject
        
        //根据key排序并拼接。
        let resultArray = newParams.keys.sorted(by: { (str1: String, str2: String) -> Bool in
            return str1 < str2
        })

        var buffer: String = String.init()
        
        for key in resultArray {
            
            if (key == "sign")
            {
                return newParams
            }

            if (key == "file" || key == "files")
            {
                break
            }

            let value = newParams[key] as! String
            
            if buffer.characters.count > 0
            {
                buffer.append("&")
            }
            
            buffer += (key + "=" + value)
        }
        
        buffer.append(SIGN_PRIVATE_KEY);

        newParams["sign"] = buffer.md5() as AnyObject
        
        return newParams
    }
    
    return nil
}

func sendGetRequest(urlString: String, params : [String : AnyObject], success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->())
{
    let newParams = signParam(params: params)
    NetworkRequest.sharedInstance.getRequest(urlString: urlString, params: newParams! , success: success, failture: failture)
}

//MARK: - POST 请求
func sendPostRequest(urlString : String, params : [String : AnyObject], success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->())
{
    let newParams = signParam(params: params)
    NetworkRequest.sharedInstance.postRequest(urlString: urlString, params: newParams!, success: success, failture: failture)
}


