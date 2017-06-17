//
//  CircleView.swift
//  firstSocialMediaApp
//
//  Created by Raphael Reiter on 16/06/2017.
//  Copyright © 2017 Raphael Reiter. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    
  
    
    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }
    
  
}
