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
        var quote = getQuoteFromChuckNorrisAPI()

        lbWordsOfWisdom.text = quote
    }
    
    func getQuoteFromChuckNorrisAPI() -> String {
        
        var quoteFromAPI = ""
        
        Alamofire.request(.GET, "http://api.icndb.com/jokes/random", parameters: nil)
            .responseJSON { _, _, JSON, error in
                println("json response: \(JSON!)")
                if error == nil {
                    let value: AnyObject? = JSON?.objectForKey("value")
                    quoteFromAPI = value?.objectForKey("joke") as! String
                } else {
                    quoteFromAPI = "Error"
                }
                
                println("Quote returned from API: \(quoteFromAPI)")
        }
        
        println("returning quoteFromAPI as value: \(quoteFromAPI)")
        return quoteFromAPI
        
    }
    
    
    
}

