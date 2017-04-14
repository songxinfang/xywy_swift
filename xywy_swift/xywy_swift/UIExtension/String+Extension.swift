//
//  String+Extension.swift
//  xywy_swift
//
//  Created by  on 2017/4/13.
//  Copyright © 2017年 xywy. All rights reserved.
//

import Foundation


extension String {
    
    func md5() -> String!{
        
        let cStr = self.cString(using: String.Encoding.utf8)
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
    

}
