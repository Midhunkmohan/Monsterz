//
//  WebViewController.swift
//  Monsterz
//
//  Created by Pixbit Solutions on 14/06/1939 Saka.
//  Copyright © 1939 Saka Pixbit Solutions. All rights reserved.
//

import UIKit

import AlamofireObjectMapper

import Alamofire

import SwiftyJSON

class WebViewController: UIViewController, UIWebViewDelegate {
    
    
    @IBOutlet var webView: UIWebView!

    var fileUrl:String = ""
    
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // UIWebView Customization
        
        let url = NSURL (string: fileUrl)
        let requestObj = NSURLRequest(url: url! as URL)
        webView.delegate = self
        webView.loadRequest(requestObj as URLRequest)
    }
    
    // MARK:- UIWebViewDelegate
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool{
        
        print("request  : \(request.description)")
        return true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView){
        
        print("\(webView.request?.description)")
        
        i += 1
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView){
        
        print("\(webView.request?.description)")
        
        if i == 5{
            
            self.getdata(url:(webView.request?.description)!)
        }
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error){
        
    }
    
    func getdata(url:String){
        
        request(url, method: .get).validate().responseJSON{response in
            
            switch response.result{
                
            case.success(let data):
                let json = JSON(data)
                print("printed data  :: \(json)")
                
            case.failure(let failed):
                
                print(failed.localizedDescription)
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
