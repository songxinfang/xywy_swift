//
//  MainViewController.swift
//  xywy
//
//  Created by  on 2017/3/28.
//  Copyright © 2017年 xywy. All rights reserved.
//

import UIKit
import RxSwift

class MainViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!

    @IBOutlet weak var testButton: UIButton!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.init(white: 0.5, alpha: 1.0)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
