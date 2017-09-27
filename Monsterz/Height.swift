//
//  Height.swift
//  Monsterz
//
//  Created by Pixbit Solutions on 08/06/1939 Saka.
//  Copyright © 1939 Saka Pixbit Solutions. All rights reserved.
//

import Foundation

import UIKit

class Height:NSLayoutConstraint{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.constant = 1.0 / UIScreen.main.scale
    }
}
