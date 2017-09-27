//
//  Payment.swift
//  Monsterz
//
//  Created by Pixbit Solutions on 14/06/1939 Saka.
//  Copyright © 1939 Saka Pixbit Solutions. All rights reserved.
//

import Foundation

import ObjectMapper

class Payment:Mappable{
    
    var data : Data?
    var httpCode : Int?
    var responseCode : String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map)
    {
        data <- map["data"]
        httpCode <- map["http_code"]
        responseCode <- map["response_code"]
        
    }
}

class Data : Mappable{
    
    var pId : Int?
    var paymentUrl : String?
    var responseCode : String?
    var result : String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map)
    {
        pId <- map["p_id"]
        paymentUrl <- map["payment_url"]
        responseCode <- map["response_code"]
        result <- map["result"]
    }
}
