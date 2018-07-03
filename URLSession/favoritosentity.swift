//
//  favoritosentity.swift
//  URLSession
//
//  Created by Aceleradora Mobile Perú on 2/07/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

struct favoritosentity : Decodable{

    var interbankTransferFavoriteList : [interbankCardPaymentFavoriteList]
    
    struct InterbankAccount: Decodable {
        var number: String
    }
    struct InterbankTransfer : Decodable {
        var interbankAccount : InterbankAccount
        
    }
    
    struct interbankCardPaymentFavoriteList : Decodable  {
        var alias : String
        var interbankTransfer : InterbankTransfer

    }

    private enum CodingKeys: String, CodingKey {
        case interbankTransferFavoriteList 
        
    }
    
    
}
