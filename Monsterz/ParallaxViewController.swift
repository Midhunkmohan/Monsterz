//
//  ParallaxViewController.swift
//  Monsterz
//
//  Created by Pixbit Solutions on 03/07/1939 Saka.
//  Copyright © 1939 Saka Pixbit Solutions. All rights reserved.
//

import UIKit

import MXParallaxHeader

class ParallaxViewController: UIViewController, MXParallaxHeaderDelegate {
    
    @IBOutlet weak var scrollView:UIScrollView!
    
    var header:Header!

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationController?.navigationBar.isHidden = true
        
        // Do any additional setup after loading the view.
        
        header = Header.loadNib()
        scrollView.parallaxHeader.delegate = self
        scrollView.parallaxHeader.view = header
        scrollView.parallaxHeader.height = 300
        scrollView.parallaxHeader.mode = MXParallaxHeaderMode.fill
        scrollView.parallaxHeader.minimumHeight = 0
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
