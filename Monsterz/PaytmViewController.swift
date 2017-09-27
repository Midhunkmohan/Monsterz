//
//  PaytmViewController.swift
//  Monsterz
//
//  Created by Pixbit Solutions on 27/06/1939 Saka.
//  Copyright © 1939 Saka Pixbit Solutions. All rights reserved.
//

import UIKit

import Alamofire

class PaytmViewController: UIViewController, PGTransactionDelegate {
    
    var checksum:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.startPaytmPayment()
        
//        let merchantConfig = PGMerchantConfiguration.default()
//        merchantConfig?.checksumGenerationURL = "http://brandedpets.com/api/shop/generateChecksum"
//        merchantConfig?.checksumValidationURL = "http://brandedpets.com/api/shop/validateChecksum"
//        
//        var odrDict: [AnyHashable : Any] = NSDictionary() as! [AnyHashable : Any]
//        
//        odrDict["MID"] = "Pixbit53855007781475"
//        odrDict["CHANNEL_ID"] = "WAP"
//        odrDict["INDUSTRY_TYPE_ID"] = "Retail"
//        odrDict["WEBSITE"] = "APP_STAGING"
//        odrDict["TXN_AMOUNT"] = "1.00"
//        odrDict["ORDER_ID"] = "ORDER894659"
//        odrDict["REQUEST_TYPE"] = "DEFAULT"
//        odrDict["CUST_ID"] = "CUST09475"
//        odrDict["CALLBACK_URL"] = "https://pguat.paytm.com/paytmchecksum/paytmCallback.jsp"
////        odrDict["MOBILE"]=""
////        odrDict["EMAIL"]=""
//        
//        odrDict["CHECKSUMHASH"] = "l9krp9gp4fxbV1g5yJfskjHsLCJZqYg8lEW9UZv46poJrDo7ITCrO6P45HWN+q8lNH0phA0v3DNL\\/u15esBQlIhR+433w8RfLZ\\/t20Ze9xE="
//        let order: PGOrder = PGOrder(params: odrDict)
//        
//        let transactionController = PGTransactionViewController.init(transactionFor: order)
//        transactionController? .serverType = eServerTypeStaging
//        transactionController? .merchant = merchantConfig
//        transactionController? .delegate = self
////        self.showController(transactionController)
//        self.show(transactionController!, sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    // MARK:- WebService
    
    func generateChecksumhash(){
        let parms = ["MID":"Pixbit53855007781475",
                     "CHANNEL_ID":"WAP",
                     "INDUSTRY_TYPE_ID":"Retail",
                     "WEBSITE":"APP_STAGING",
                     "TXN_AMOUNT":"1.00",
                     "ORDER_ID":"ORDER84345",
                     "REQUEST_TYPE":"DEFAULT",
                     "CUST_ID":"CUST09475",
                     "CALLBACK_URL":"https://pguat.paytm.com/paytmchecksum/paytmCallback.jsp",
                     "MOBILE_NO":"",
                     "EMAIL":""]
        
        let url = "http://brandedpets.com/api/shop/generateChecksum"
        request(url, method: .post, parameters: parms).validate().responseJSON{ response in
            
            switch response.result{
                
            case.success(let data):
                print(data)
                self.startPaytmPayment()
            case.failure(let failed):
                print(failed.localizedDescription)
                
                self.startPaytmPayment()
            }
        }
    }
    
    func startPaytmPayment(){
        
        let merchantConfig = PGMerchantConfiguration.default()
        merchantConfig?.checksumGenerationURL = "http://brandedpets.com/api/shop/generateChecksum"
        merchantConfig?.checksumValidationURL = "http://brandedpets.com/api/shop/validateChecksum"
        
        var odrDict: [AnyHashable : Any] = NSDictionary() as! [AnyHashable : Any]
        
        odrDict["MID"] = "Pixbit53855007781475"
        odrDict["CHANNEL_ID"] = "WAP"
        odrDict["INDUSTRY_TYPE_ID"] = "Retail"
        odrDict["WEBSITE"] = "APP_STAGING"
        odrDict["TXN_AMOUNT"] = "1.00"
        odrDict["ORDER_ID"] = "ORDER84345"
        odrDict["CUST_ID"] = "CUST09475"
        odrDict["CALLBACK_URL"] = "https://pguat.paytm.com/paytmchecksum/paytmCallback.jsp"
        odrDict["EMAIL"] = "abc@gmail.com"
        odrDict["MOBILE_NO"] = "9999999999"
        
        odrDict["CHECKSUMHASH"] = "cKABXfRLVmIczAxbd8n/NkVzXe2DPPd0bajiZMgTMnInaaxL9BUy0RBrD7Y4ps/lx2kpWsxbEeQuRPHkbleVa0ZNs5BEAlLeEjkaET+BGOU="
        let order: PGOrder = PGOrder(params: odrDict)
        
        let transactionController = PGTransactionViewController.init(transactionFor: order)
        transactionController? .serverType = eServerTypeStaging
        transactionController? .merchant = merchantConfig
        transactionController? .delegate = self
        //        self.showController(transactionController)
        self.show(transactionController!, sender: self)

    }
       
    // MARK:- PGTransactionDelegate
        
   // On Failure
   
    func errorMisssingParameter(_ controller: PGTransactionViewController!, error: Error!) {
        print("error missing parameter \(error.localizedDescription)")
        _=self.navigationController?.popViewController(animated: true)
    }
    
    //On Cancellation
    
    func didCancelTrasaction(_ controller: PGTransactionViewController!) {
        print("transaction cancelled")
        
        _=self.navigationController?.popViewController(animated: true)
    }
    
    // On Successful Payment
    
    func didFinishedResponse(_ controller: PGTransactionViewController!, response responseString: String!) {
        
        print("paytm response string ::  \(responseString)")
        _=self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:- Helper Function
    
    
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
