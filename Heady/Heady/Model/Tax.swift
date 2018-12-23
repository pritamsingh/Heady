//
//  Tax.swift
//  Heady
//
//  Created by Pritam on 20/12/18.
//  Copyright © 2018 parihar. All rights reserved.
//

import UIKit

protocol Tax {
    var name: String {get}
    var value : Float {get}
}
struct ProductTax : Tax {
    var name: String
    
    var value: Float
    
    init(_ dict : NSDictionary) {
        name = dict.value(forKey: "name") as! String
        
        value = dict.value(forKey: "value") as! Float
    }
    
}
