//
//  SplashViewController.swift
//  Monsterz
//
//  Created by Pixbit Solutions on 07/06/1939 Saka.
//  Copyright © 1939 Saka Pixbit Solutions. All rights reserved.
//

import UIKit

import Spring

class SplashViewController: UIViewController {

    @IBOutlet var springLabel: SpringLabel!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Spring Label Customization
        
        springLabel.animation = "fadeIn"
        springLabel.duration = 3
        springLabel.delay = 1
        springLabel.animate()
        springLabel.animateNext {
            
            self.springLabel.animation = "fadeOut"
            self.springLabel.duration = 3
            self.springLabel.delay = 1
            self.springLabel.animate()
            
            self.springLabel.animateNext {
                
                self.appDelegate.rootViewController()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = UIColor.primary
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
