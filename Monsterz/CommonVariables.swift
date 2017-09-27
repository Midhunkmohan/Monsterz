//
//  CommonVariables.swift
//  Monsterz
//
//  Created by Pixbit Solutions on 08/06/1939 Saka.
//  Copyright © 1939 Saka Pixbit Solutions. All rights reserved.
//

import Foundation


let appDelegate = UIApplication.shared.delegate as! AppDelegate
let wScreen = UIApplication.shared.delegate?.window!

// MARK:- Validate Email

func validateEmail(enteredEmail:String) -> Bool {
    
    let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: enteredEmail)
}
