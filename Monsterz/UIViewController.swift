//
//  UIViewController.swift
//  Monsterz
//
//  Created by Pixbit Solutions on 07/06/1939 Saka.
//  Copyright © 1939 Saka Pixbit Solutions. All rights reserved.
//

import Foundation

import UIKit

extension UIViewController{
    
    
    
    func hideKeyboardWhenTappedAround(){
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard(){
        
        self.view.endEditing(true)
    }
    
    func action(){
        
        let actionSheet:UIAlertController = UIAlertController(title: "Select any action", message: nil, preferredStyle: .actionSheet)
        actionSheet.view.tintColor = UIColor.black
        actionSheet.addAction(UIAlertAction(title: "Logout", style: .default, handler: {action in
        
            appDelegate.rootViewController()
        }))
        actionSheet.addAction(UIAlertAction(title: "Change Password", style: .default, handler: { action in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func showAlertViewWithTitle(title : String,message:String) -> Void {
        let alertController : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            NSLog("OK Pressed")
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

}
