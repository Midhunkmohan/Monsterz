//
//  FoldingCell.swift
//  Monsterz
//
//  Created by Pixbit Solutions on 07/06/1939 Saka.
//  Copyright © 1939 Saka Pixbit Solutions. All rights reserved.
//

import UIKit

class FoldingCell: UITableViewCell {

    @IBOutlet var crossLine: UIView!
    @IBOutlet var condainer: UIView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDescription: UILabel!
    
    var gradientLayer:CAGradientLayer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        condainer.getShadow()
        condainer.layer.cornerRadius = 5
        condainer.clipsToBounds = true
        
        gradientLayer = CAGradientLayer()
        self.crossLine.clipsToBounds = true
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.crossLine.bounds.width, height: 1.0 / UIScreen.main.scale)
        gradientLayer.colors = [ UIColor.primary.cgColor, UIColor.white.cgColor, UIColor.primary.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        self.crossLine.layer.addSublayer(gradientLayer)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
