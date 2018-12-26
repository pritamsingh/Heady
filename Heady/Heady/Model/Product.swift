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
    var viewCount:Int{get}
    var orderCount:Int{get}
    var shares:Int{get}
}
struct IProduct : Product {
    var id: Int
    
    var name: String
    
    var dateAdded: String
    
    var variants : [ProductVariants]
    
    var  tax : ProductTax
    
    var  viewCount : Int = 0
    
    var orderCount: Int = 0

    var shares: Int = 0

    init(_ jsonDic : NSDictionary,ranking:NSArray) {
        
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
        
        
        /// calculate view count ////////////////////////////
        let mostViewed = (ranking[0] as! NSDictionary)
        var mostViewedProducts = mostViewed.value(forKey: "products") as! NSArray
        //                mostViewedProducts.filter{$0["id"] == 1}
        let  idPredicate = NSPredicate(format: "id == %d", id);
        mostViewedProducts = mostViewedProducts.filter { idPredicate.evaluate(with: $0) } as NSArray;
         if mostViewedProducts.count > 0 {
        viewCount = (mostViewedProducts[0] as AnyObject).value(forKey: "view_count") as! Int
        }
         /////////////////////////////////////////////////////////////////
        
        /// calculate order count ////////////////////////////
        if  let mostOrdered = ranking[1] as? NSDictionary{
        var mostOrderedProducts = mostOrdered.value(forKey: "products") as! NSArray
        mostOrderedProducts = mostOrderedProducts.filter { idPredicate.evaluate(with: $0) } as NSArray;
             if mostOrderedProducts.count > 0 {
                orderCount = (mostOrderedProducts[0] as AnyObject).value(forKey: "order_count") as! Int
            }
        }
        /////////////////////////////////////////////////////////////////
        
        /// calculate shared count ////////////////////////////
        if   let mostShared = ranking[2] as? NSDictionary{
        var mostSharedProducts = mostShared.value(forKey: "products") as! NSArray
        mostSharedProducts = mostSharedProducts.filter { idPredicate.evaluate(with: $0) } as NSArray;
            if mostSharedProducts.count > 0 {
            shares = (mostSharedProducts[0] as AnyObject).value(forKey: "shares") as! Int
            }
        }
        
//       tax = jsonDic.value(forKey: "tax") as! ProductTax
//        print(tax.name)
//        for  variant in  variantItems{
//
//
//        }
    }
}
