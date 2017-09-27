//
//  AlertWidth.swift
//  Monsterz
//
//  Created by Pixbit Solutions on 07/06/1939 Saka.
//  Copyright © 1939 Saka Pixbit Solutions. All rights reserved.
//

import Foundation

import UIKit

class AlertWidth: NSLayoutConstraint{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.constant = UIScreen.main.bounds.width - UIScreen.main.bounds.width*(25/100)
    }
}
