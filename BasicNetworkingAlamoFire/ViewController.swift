//
//  ViewController.swift
//  BasicNetworkingAlamoFire
//
//  Created by Yvette Cook on 11/08/2015.
//  Copyright (c) 2015 Yvette. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet var lbWordsOfWisdom: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tappedGetMeAQuote(sender: AnyObject) {
        getQuote()
    }
    
    func getQuote() {
        
        let onAPIResponse : (String) -> Void = {
            (quote : String) in
                self.lbWordsOfWisdom.text = quote
        }
        
        getQuoteFromChuckNorrisAPI(onAPIResponse)
        
    }
    
    func getQuoteFromChuckNorrisAPI(onResponseCallback: (String) -> Void) {
        
        var quoteFromAPI = ""
        
        Alamofire.request(.GET, "http://api.icndb.com/jokes/random", parameters: nil)
            .responseJSON { _, _, JSON, error in
                println("json: \(JSON)")
                if error == nil {
                    let value: AnyObject? = JSON?.objectForKey("value")
                    quoteFromAPI = value?.objectForKey("joke") as! String
                    onResponseCallback(quoteFromAPI)
                } else {
                    onResponse("Error")
                }
                
                println(quoteFromAPI)
            }
    }


}

