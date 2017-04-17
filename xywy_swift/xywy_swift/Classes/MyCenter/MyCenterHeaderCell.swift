//
//  MyCenterHeaderCell.swift
//  xywy_swift
//
//  Created by  on 2017/4/17.
//  Copyright © 2017年 xywy. All rights reserved.
//

import UIKit
import Kingfisher

class MyCenterHeaderCell: UITableViewCell {

    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        headerImageView.layer.borderColor = UIColor.lightGray.cgColor
        headerImageView.layer.borderWidth = 1.0
        headerImageView.layer.cornerRadius = 30
        headerImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCenterModel(model: UserInfoModel) {
        
        if model.photo != nil
        {
            let url = URL(string: model.photo!)
            headerImageView.kf.setImage(with: url, placeholder: UIImage.init(named: "touxiang1"), options: nil, progressBlock: nil, completionHandler: nil)
        }

        nicknameLabel.text = model.nickname
        scoreLabel.text = "\(model.points)"
    }
}
