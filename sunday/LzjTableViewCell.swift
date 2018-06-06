//
//  LzjTableViewCell.swift
//  sunday
//
//  Created by 锦色年华 on 2018/6/4.
//  Copyright © 2018年 锦色年华. All rights reserved.
//

import UIKit

class LzjTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!

    @IBOutlet weak var lzjimg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
