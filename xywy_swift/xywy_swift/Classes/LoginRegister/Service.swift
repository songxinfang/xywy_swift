//
//  Service.swift
//  xywy
//
//  Created by  on 2017/4/1.
//  Copyright © 2017年 xywy. All rights reserved.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

class ValidationService {
    
    static let instance = ValidationService()
    
    private init() {}
    
    let minCharactersCount = 6
    
    func validateUsername(_ username: String) -> Observable<Result> {
        
        if username.characters.count == 0 {
            return .just(.empty)
        }
        
        if username.characters.count < minCharactersCount {
            return .just(.failed(message: "用户名长度不够长"))
        }
        
        return .just(.ok(message: "用户名可用"))
    }
    
    
    func validatePassword(_ password: String) -> Result {
        
        if password.characters.count == 0 {
            return .empty
        }
        
        if password.characters.count < minCharactersCount {
            return .failed(message: "密码长度至少6个字符")
        }
        
        return .ok(message: "密码可用")
    }
    
    
    func validateRepeatedPassword(_ password: String, repeatedPasswordword: String) -> Result {
        if repeatedPasswordword.characters.count == 0 {
            return .empty
        }
        
        if repeatedPasswordword == password {
            return .ok(message: "密码可用")
        }
        
        return .failed(message: "两次密码不一样")
    }
    
    func register(_ username: String, password: String) -> Observable<Result> {
        
        loginWith(username: username, password: password)
        
        let userDic = [username: password]
        
        let filePath = NSHomeDirectory() + "/Documents/users.plist"
        
        if (userDic as NSDictionary).write(toFile: filePath, atomically: true) {
            return .just(.ok(message: "注册成功"))
        }
        return .just(.failed(message: "注册失败"))
    }

}
