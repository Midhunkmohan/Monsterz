//
//  UIView.swift
//  Pets
//
//  Created by Pixbit Solutions on 22/11/16.
//  Copyright © 2016 Pixbit Solutions. All rights reserved.
//

import UIKit

extension UIView {
    class func loadNib<T: UIView>(_ viewType: T.Type) -> T {
        let className = String.className(viewType)
        return Bundle(for: viewType).loadNibNamed(className, owner: self, options: nil)!.first as! T
    }
    
    class func loadNib() -> Self {
        return loadNib(self)
    }
    
    func getShadow(){
        
        let layer = self.layer
        layer.shadowColor = UIColor(hex: "000000", alpha: 0.1).cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 4.0
        layer.masksToBounds = false
    }
    
}
