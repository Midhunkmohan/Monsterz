//
//  MainViewController.swift
//  Monsterz
//
//  Created by Pixbit Solutions on 08/06/1939 Saka.
//  Copyright © 1939 Saka Pixbit Solutions. All rights reserved.
//

import UIKit

import ToastSwiftFramework

import Alamofire

import ObjectMapper

import AlamofireObjectMapper

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!

    struct List {
        var title:String!
        var description:String
        
        init(title:String, description:String) {
            self.title = title
            self.description = description
        }
    }
    
    var urlStr = String()
    var arrList = [List]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.backgroundColor = UIColor.backgroundColor
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib(nibName:"FoldingCell", bundle:nil), forCellReuseIdentifier: "FoldingCell")
        
        appDelegate.window?.makeToast("Successfully logged in")
        
        arrList =  [List(title: "MTBarcode Scanner", description: "Can scan barcode and QRCode"),
                    List(title: "WebView ", description: "Can Load any links and show pdf"),
                    List(title: "QR & BarCode Generator", description: "Can generate both QRCode and Barcode"),
                    List(title: "Paytm Payment Gateway", description: "Paytm SDK and sandbox account for testing"),
                    List(title: "Parallax effect", description: "Parallax effect Testing")]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Work List"
        
        // Creating barbutton item
        let btnAction:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didActionBtnClicked))
        self.navigationItem.rightBarButtonItem = btnAction
    }
    
    // MARK:- UIBarButton Action
    
    // left barbutton
    
    func didActionBtnClicked(){
        
        self.action()
    }
    
    // MARK:- UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return arrList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoldingCell", for: indexPath)as! FoldingCell
        
        let list = arrList[indexPath.row]
        cell.lblTitle.text = list.title
        cell.lblDescription.text = list.description
        return cell
    }
    
    // MARK:- UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        if indexPath.row == 0{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "ScannerViewController") as! ScannerViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 1{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                vc.fileUrl = urlStr
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 2{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "CodeGeneratorViewController") as! CodeGeneratorViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 3{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "PaytmViewController") as! PaytmViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 4{
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "ParallaxViewController") as! ParallaxViewController
            self.navigationController?.pushViewController(vc, animated: true)
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
