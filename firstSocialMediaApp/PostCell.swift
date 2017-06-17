//
//  PostCell.swift
//  firstSocialMediaApp
//
//  Created by Raphael Reiter on 17/06/2017.
//  Copyright © 2017 Raphael Reiter. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var  profileImage: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var postImmg: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLbl: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
