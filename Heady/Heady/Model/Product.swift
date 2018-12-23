//
//  Product.swift
//  Heady
//
//  Created by Pritam on 20/12/18.
//  Copyright © 2018 parihar. All rights reserved.
//

import UIKit

protocol Product  {
    var id : Int {get}
    var name : String {get}
    var dateAdded : String {get}
}
struct IProduct : Product {
    var id: Int
    
    var name: String
    
    var dateAdded: String
    
    var variants : [ProductVariants]
    
    var  tax : ProductTax
    
    init(_ jsonDic : NSDictionary) {
        
        id = jsonDic.value(forKey: "id") as! Int
        
        name = jsonDic.value(forKey: "name") as! String
        
        dateAdded = jsonDic.value(forKey: "date_added") as! String

         self.variants = [ProductVariants]()
//        variants = jsonDic.value(forKey: "variants") as! [ProductVariants]
        if let variants = jsonDic.value(forKey: "variants") as? NSArray {
            for i in 0 ..< variants.count {
                let variant =  ProductVariants(variants[i] as! NSDictionary)
                print(variant.price)
                self.variants.append(variant)
            }
        }
       
        tax =  ProductTax(jsonDic.value(forKey: "tax") as! NSDictionary)
        print(tax.name)
        
        
//       tax = jsonDic.value(forKey: "tax") as! ProductTax
//        print(tax.name)
//        for  variant in  variantItems{
//
//
//        }
    }
}
