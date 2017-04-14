//
//  UserInfoModel.swift
//  xywy_swift
//
//  Created by  on 2017/4/11.
//  Copyright © 2017年 xywy. All rights reserved.
//

import Foundation

open class UserInfoModel: NSObject{
        
    // 用户ID
    var userid: String?
    // 用户名
    var username: String?
    // 注册时间
    var insert_data: String?
    // 用户手机号
    var userphone: String?
    // 用户邮箱
    var useremail: String?
    // 用户绑定邮箱
    var auth_email: String?
    // 用户绑定邮箱状态
    var auth_email_status: String?
    // 用户绑定手机
    var auth_phone: String?
    // 用户绑定手机状态
    var auth_phone_status: Int64 = 0
    // 用户来源
    var usersource: String?
    // 密码
    var passwd: String?
    // 密码
    var newpasswd: String?
    // 用户类型
    var type: String?
    // 设备ID
    var devid: String?
    // 最后一次登录时间
    var lasttime: String?
    // 昵称
    var nickname: String?
    // 真实姓名
    var realname: String?
    // 生日
    var birthday: String?
    // 性别
    var sex: String?
    // 年龄
    var age: Int64 = 0
    // 身份证号
    var idcard: String?
    // 体重(kg)
    var weight: Int64 = 0
    // 身高(cm)
    var height: Int64 = 0
    // 血型
    var blood_type: String?
    // 血压
    var blood_pressure: String?
    // 用户头像地址
    var photo: String?
    // 用户可用积分
    var points: Int64 = 0
    // 省id
    var province: String?
    // 市id
    var city: String?
    // 固定电话
    var telephone: String?
    // 年收入
    var salary: String?
    // 联系地址
    var address: String?
    // 腾讯qq
    var qq: String?
    // 用户首次登录时间
    var first_login_time: String?
    
    var today_if_signin: String?
    
    // 环信账号
    var huanxin_user: String?
    // 环信密码
    var huanxin_pwd: String?
    
    //  token
    var token: String?
    //  expir
    var expire: Int64 = 0
    
    
    var is_auth_alipay: Int64 = 0
    var is_auth_qq: Int64 = 0
    var is_auth_sina: Int64 = 0
    var is_auth_weixin: Int64 = 0

    
    public init(dic: [String : AnyObject]) {
    
        super.init()
        setValuesForKeys(dic)
    
    }
}
