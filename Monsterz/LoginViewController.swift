//
//  LoginViewController.swift
//  Monsterz
//
//  Created by Pixbit Solutions on 07/06/1939 Saka.
//  Copyright © 1939 Saka Pixbit Solutions. All rights reserved.
//

import UIKit

import FacebookCore

import FacebookLogin

import RealmSwift

class LoginViewController: UIViewController, UITextFieldDelegate, GIDSignInUIDelegate, GIDSignInDelegate {
    
    @IBOutlet var viewGradientLine: UIView!
    @IBOutlet var btnFacebook: UIButton!
    @IBOutlet var btnGoogle: UIButton!
    @IBOutlet var txtFieldEmail: UITextField!
    @IBOutlet var txtFieldPassword: UITextField!
    @IBOutlet var lblSignup: UILabel!
  
    var gradientLayer:CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // print realm path
        
        print(Realm.Configuration.defaultConfiguration.fileURL! )
        
        // Hide keyboard while tapped around
    
        self.hideKeyboardWhenTappedAround()
        
        // Google Sign in
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        //CAGradientLayer Customization
        
        gradientLayer = CAGradientLayer()
        self.viewGradientLine.clipsToBounds = true
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.viewGradientLine.bounds.width, height: 1.0 / UIScreen.main.scale)
        gradientLayer.colors = [ UIColor.whiteAlpha.cgColor, UIColor.white.cgColor, UIColor.whiteAlpha.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        self.viewGradientLine.layer.addSublayer(gradientLayer)
        
        // UITextField Customization
        
        txtFieldEmail.returnKeyType = .next
        txtFieldEmail.delegate = self
        txtFieldPassword.returnKeyType = .done
        txtFieldPassword.delegate = self
        
        let signupTap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didSignUpLabelTapped))
        lblSignup.addGestureRecognizer(signupTap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = UIColor.primary
    }
    
    // MARK:- UIGestureRecognizer Actions
    
    // Signup Label
    
    func didSignUpLabelTapped(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")as! SignUpViewController
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }

    // MARK:- UIButton Actions
    
    // Facebook Button
    
    @IBAction func didFacebookBtnClicked(_ sender: Any) {
        
        let loginManager = LoginManager()
        
        loginManager.logIn([.publicProfile, .email, .userFriends], viewController: self) { result in
            self.loginManagerDidComplete(result)
        }
    }
    
    // Google Button
    
    @IBAction func didGoogleBtnClicked(_ sender: Any) {
        
        GIDSignIn.sharedInstance().signIn()
    }
    
    // MARK:- UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        if textField == txtFieldEmail{
            
            txtFieldPassword.becomeFirstResponder()
        }
        else{
            
            self.view.endEditing(true)
        }
        return true
    }
    
    // MARK:- GIDSignInUIDelegate
    
    // pressed the Sign In button
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        
    }
    
    // Present a view that prompts the user to sign in with Google
    
    func sign(_ signIn: GIDSignIn!,present viewController: UIViewController!) {
        
        viewController.modalTransitionStyle = .crossDissolve
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    
    func sign(_ signIn: GIDSignIn!,dismiss viewController: UIViewController!) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // Google SDK did complete
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!){
        
        if (error == nil) {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            
            print("\(userId)\n\(idToken)\n\(fullName)\n\(givenName)\n\(familyName)\n\(email)")
            
            UserDefaults.standard.set(true, forKey: "googleSignIn")
            print(email!)
            self.txtFieldEmail.text = email
           
        } else {
            print("\(error.localizedDescription)")
        }
    }

    // MARK:- Facebook SDK did complete
    
    func loginManagerDidComplete(_ result: LoginResult) {
        let alertController: UIAlertController
        switch result {
        case .cancelled:
            alertController = UIAlertController(title: "Login Cancelled", message: "User cancelled login.")
        case .failed(let error):
            alertController = UIAlertController(title: "Login Fail", message: "Login failed with error \(error)")
        case .success(let grantedPermissions,let email, _):
            alertController = UIAlertController(title: "Login Success",
                                                message: "Login succeeded with granted permissions: \(grantedPermissions)\n\(email.first)")
            
            let request = GraphRequest(graphPath: "me", parameters: ["fields":"email,name"], accessToken: AccessToken.current, httpMethod: .GET, apiVersion: FacebookCore.GraphAPIVersion.defaultVersion)
            request.start { (response, result) in
                
                // Insert your code here
                
                switch result {
                case .success(let value):
                    print(value.dictionaryValue!)
                    let details = value.dictionaryValue
                    let email = details?["email"] as! String
                    
                    
                    UserDefaults.standard.set(false, forKey: "googleSignIn")
                    print(email)
                    self.txtFieldEmail.text = email
                    
                case .failed(let error):
                    print(error)
                }
            }
        }
        self.present(alertController, animated: true, completion: nil)
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
