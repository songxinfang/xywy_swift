//
//  HTTPApiBase.swift
//  xywy
//
//  Created by  on 2017/4/10.
//  Copyright © 2017年 xywy. All rights reserved.
//

import Foundation


class HTTPApiBase {
    
    static func initBaseParams(api: String, version : String) -> NSMutableDictionary {
        
        let getParameters: NSMutableDictionary = NSMutableDictionary.init();
        getParameters["version"] = version;
        getParameters["api"] = api;

        getParameters["source"] = "xywyapp";
        getParameters["os"] = "ios";
        getParameters["pro"] = "xywyf32l24WmcqquqqTdhXaEng";


        return getParameters;
    }
}


