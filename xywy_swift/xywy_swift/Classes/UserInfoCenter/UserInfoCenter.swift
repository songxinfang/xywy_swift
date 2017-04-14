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
    
    var currenUserInfo : UserInfoModel?
    
    var userID : String? = nil
    
    private init() {}
    
    // 是否登录
    func isLogin() -> Bool
    {
        return (self.getUserID() != nil)
    }
    
    // userid
    func setUserID(userid: String)
    {
        userDefault.set(userid, forKey: kCurrentUserIdKey)
    }

    func getUserID() -> String?
    {
        return userDefault.object(forKey: kCurrentUserIdKey) as? String
    }
    
    func getCurrenUserInfo() -> UserInfoModel?
    {
        if self.isLogin() && currenUserInfo == nil
        {
            let  data = userDefault.object(forKey: self.getUserID()!)
            self.currenUserInfo = UserInfoModel.init(dic: data as! [String : AnyObject])
        }
        
        return self.currenUserInfo
    }

    ///清除用户登录信息
    func removeAllUserInfoWhenLongout()
    {
        if self.isLogin()
        {
            userDefault.set(nil, forKey: self.getUserID()!)
            userDefault.set(nil, forKey: kCurrentUserIdKey)
        }
    }

    func saveUserInfo(data: [String : AnyObject])
    {
        self.setUserID(userid: data["userid"] as! String)
        
        userDefault.set(data, forKey: self.getUserID()!)
        
        userDefault.synchronize()
    }
}

