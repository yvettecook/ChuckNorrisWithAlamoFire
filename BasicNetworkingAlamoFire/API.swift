//
//  API.swift
//  BasicNetworkingAlamoFire
//
//  Created by Yvette Cook on 11/08/2015.
//  Copyright (c) 2015 Yvette. All rights reserved.
//

import Foundation
import Alamofire

class API {
    
    func getQuoteFromChuckNorrisAPI() -> String {
        
        var apiResponse = ""
        
        Alamofire.request(.GET, "http://api.icndb.com/jokes/random", parameters: nil)
            .response { request, response, data, error in
                println(request)
                println(response)
                println(data)
                println(error)
                
                apiResponse = response!.description as String
        }
        
        return apiResponse
    }
}

