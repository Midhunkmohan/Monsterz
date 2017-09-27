//
//  ScannerViewController.swift
//  Monsterz
//
//  Created by Pixbit Solutions on 08/06/1939 Saka.
//  Copyright © 1939 Saka Pixbit Solutions. All rights reserved.
//

import UIKit

import MTBBarcodeScanner

class ScannerViewController: UIViewController {
    
    @IBOutlet var scannerView: UIView!
    
    var scanner:MTBBarcodeScanner?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scanner = MTBBarcodeScanner(previewView: scannerView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Scanner"
        
        // hide navigation shadow
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        do {
            try self.scanner?.startScanning(resultBlock: { codes in
                if let codes = codes {
                    for code in codes {
                        let stringValue = code.stringValue!
                        print("Found code: \(stringValue)")
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            })
        } catch {
            print("Unable to start scanning")
            self.showAlertViewWithTitle(title: "", message: "Unable to start scanning")
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
