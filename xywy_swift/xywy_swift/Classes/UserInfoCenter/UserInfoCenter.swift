//
//  UserInfoCenter.swift
//  xywy_swift
//
//  Created by  on 2017/4/11.
//  Copyright © 2017年 xywy. All rights reserved.
//

import Foundation


let kCurrentUserIdKey = "kPrivateCurrentUserId"


open class UserInfoCenter {

    static let standard = UserInfoCenter()

    var userID : String? = nil
    
    private init() {}
    
    // 是否登录
    func isLogin() -> Bool {
        return (self.getUserID() != nil)
    }
    
    // userid
    func getUserID() -> String? {
        return uDefault.object(forKey: kCurrentUserIdKey) as? String
    }
    
    ///清除用户登录信息
    func removeAllUserInfoWhenLongout() {
        
    }

}

