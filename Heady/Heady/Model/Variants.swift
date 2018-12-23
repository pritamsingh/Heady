//
//  Variants.swift
//  Heady
//
//  Created by Pritam on 20/12/18.
//  Copyright © 2018 parihar. All rights reserved.
//

import UIKit

protocol Variants{
    var id : Int {get }
    var color : String {get}
    var size : Int {get}
    var price : Int{get}
    
}
struct ProductVariants : Variants {
    var id: Int
    
    var color: String
    
    var size: Int
    
    var price: Int
    
    init(_ dict : NSDictionary) {
        if let id =  dict.value(forKey: "id") as? Int{
            self.id = id
        }else{
            self.id = 0
        }
        if let color = dict.value(forKey: "color") as? String{
            self.color = color
        }else{
            self.color = ""
        }
        if let size = dict.value(forKey: "size") as? Int {
            self.size = size
        }else{
            self.size = 0
        }
        if let price = dict.value(forKey: "price") as? Int {
            self.price = price
        }else{
            self.price = 0
        }

        
    }
}
