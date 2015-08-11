//
//  ViewController.swift
//  BasicNetworkingAlamoFire
//
//  Created by Yvette Cook on 11/08/2015.
//  Copyright (c) 2015 Yvette. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lbWordsOfWisdom: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tappedGetMeAQuote(sender: AnyObject) {
    }
    
    func getQuote() -> String {
        return "test"
    }
    


}

