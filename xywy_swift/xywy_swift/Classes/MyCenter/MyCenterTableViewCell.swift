//
//  MyCenterTableViewCell.swift
//  xywy_swift
//
//  Created by  on 2017/4/14.
//  Copyright © 2017年 xywy. All rights reserved.
//

import UIKit

class MyCenterTableViewCell: UITableViewCell {

    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var numberLabel: UILabel!

    
    override func awakeFromNib()
    {
        super.awakeFromNib()

        self.contentView.backgroundColor = UIColor.clear
        self.separatorInset = UIEdgeInsets.zero;
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    func setCenterModel(model: MyCenterModel) {
        
        if model.numberStr != nil && Int(model.numberStr!)! > 0
        {
            numberLabel.isHidden = false
            numberLabel.text = model.numberStr
        }
        else
        {
            numberLabel.isHidden = true
        }
        
        if model.iconName != nil
        {
            pic.image = UIImage.init(named: model.iconName!)
        }
        
        title.text = model.titleStr
    }
}
