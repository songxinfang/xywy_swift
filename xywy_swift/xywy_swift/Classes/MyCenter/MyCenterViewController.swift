//
//  MyCenterViewController.swift
//  xywy_swift
//
//  Created by  on 2017/4/11.
//  Copyright © 2017年 xywy. All rights reserved.
//

import UIKit

class MyCenterViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate
{
    var dataSource = Array<Array<MyCenterModel>>()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "个人中心"
        
        self.setRightButton(title: "退出", action: #selector(MyCenterViewController.logoutAction))
        
        addTableView()
    }
    
    func createData()
    {
        var array1: [MyCenterModel] = Array.init()
        array1.append(MyCenterModel.init(icon: "mine_item_collection", title: "收藏", number: "0"))
        dataSource.append(array1)
        
        
        var array2: [MyCenterModel] = Array.init()
        array2.append(MyCenterModel.init(icon: "mine_item_ask_answer", title: "问答", number: "0"))
        array2.append(MyCenterModel.init(icon: "mine_item_register", title: "预约转诊", number: "0"))
        array2.append(MyCenterModel.init(icon: "mine_item_phone_doctor", title: "电话医生", number: "1"))
        array2.append(MyCenterModel.init(icon: "mine_item_home_doctor", title: "家庭医生", number: "1"))
        dataSource.append(array2)

        
        var array3: [MyCenterModel] = Array.init()
        array3.append(MyCenterModel.init(icon: "mine_item_community", title: "社区", number: "2"))
        array3.append(MyCenterModel.init(icon: "mine_item_small_tools", title: "小工具", number: "3"))
        dataSource.append(array3)
    }
    
    func addTableView()
    {
        createData()

        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight - topBarHeight - tabBarHeight), style: UITableViewStyle.grouped)
            
        tableView.backgroundColor = kRGBColorFromHex(rgbValue: 0xfcfcfc)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        tableView.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 140))
        tableView.tableHeaderView?.backgroundColor = UIColor.orange
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib.init(nibName: "MyCenterTableViewCell", bundle: nil), forCellReuseIdentifier: "MyCenterTableViewCell")

        self.view.addSubview(tableView)
    }
    
    func logoutAction()
    {
        let alert = UIAlertView.init(title: nil, message: "确认退出登录吗", delegate: self, cancelButtonTitle: "取消")
        alert.addButton(withTitle: "确定")
        alert.show()
    }
    
    // MARK: ------------ UITableViewDataSource ------------
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 44.0
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 8.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 0.00001
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let header = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 30))
        header.backgroundColor = kRGBColorFromHex(rgbValue: 0xefefef)
        return header;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : MyCenterTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "MyCenterTableViewCell") as? MyCenterTableViewCell
        cell?.setCenterModel(model: dataSource[indexPath.section][indexPath.row])
        return cell!
    }
    
    // MARK: ------------ UITableViewDelegate ------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("didSelectRowAt \(indexPath)")
    }

    // MARK: ------------ UIAlertViewDelegate ------------
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        
        if buttonIndex != alertView.cancelButtonIndex
        {
            UserInfoCenter.standard.removeAllUserInfoWhenLongout()
            LoginHelper.popLoginVc(vc: self, isPush: false, animated: true)
        }
    }
    
}

