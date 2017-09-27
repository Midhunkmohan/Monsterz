//
//  SignUpViewController.swift
//  Monsterz
//
//  Created by Pixbit Solutions on 14/06/1939 Saka.
//  Copyright © 1939 Saka Pixbit Solutions. All rights reserved.
//

import UIKit

import RealmSwift

class SignUpViewController: UIViewController {
    
    @IBOutlet var txtFieldEmail: UITextField!
    @IBOutlet var txtFieldPassword: UITextField!
    @IBOutlet var txtFieldRePassword: UITextField!
    @IBOutlet var viewLine: UIView!
    @IBOutlet var lblLogin: UILabel!

    var gradientLayer:CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //CAGradientLayer Customization
        
        gradientLayer = CAGradientLayer()
        self.viewLine.clipsToBounds = true
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.viewLine.bounds.width, height: 1.0 / UIScreen.main.scale)
        gradientLayer.colors = [ UIColor.whiteAlpha.cgColor, UIColor.white.cgColor, UIColor.whiteAlpha.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        self.viewLine.layer.addSublayer(gradientLayer)
        
        // UIGestureRecognizer Customization
        
        let loginTap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didLoginLabelTapped))
        self.lblLogin.addGestureRecognizer(loginTap)
        
        let arr = ["A","B","C","D","E","F"]
        let str = arr.joined(separator: ", ")
    }
    
    // MARK:- UIGestureRecognizer
    
    // Login Label
    
    func didLoginLabelTapped(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")as! LoginViewController
        vc.modalTransitionStyle = .crossDissolve
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK:- UIButton Actions
    
    // Sign up Button
    @IBAction func didSignupBtnClicked(_ sender: Any) {
        
        if txtFieldEmail.text?.characters.count != 0 && txtFieldPassword.text?.characters.count != 0 && txtFieldRePassword.text?.characters.count != 0{
            
            if validateEmail(enteredEmail: txtFieldEmail.text!) {
                
                if  txtFieldPassword.text == txtFieldRePassword.text{
                    
                    self.signUpAction()
                }
            }
        }
    }
    
    // MARK:- Helper Functions
    
    func incrementID() -> Int {
        // to get realm db increment id
        let realm = try! Realm()
        return (realm.objects(Users.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
    func signUpAction(){
        
        let realm = try! Realm()
        let user = realm.objects(Users.self)
        
        if user.count == 0{
            
            let users = Users()
            users.id = self.incrementID()
            users.email = txtFieldEmail.text!
            users.password = txtFieldRePassword.text
            
            do {
                try realm.write() {
                    
                    realm.add(users)
                }
            }catch let error as NSError {
                
                print(error.localizedDescription)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
