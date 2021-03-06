//
//  Categories.swift
//  Heady
//
//  Created by Pritam on 21/12/18.
//  Copyright © 2018 parihar. All rights reserved.
//

import UIKit

protocol Categorie {
    var id : Int {get}
    var name : String {get}
    var products : [IProduct] {get}
}

struct HeadyCategorie : Categorie {
    var products: [IProduct]
    
    var id: Int
    
    var name: String
    
    init(dict : NSDictionary,ranking:NSArray) {
        id = dict.value(forKey: "id") as! Int
        name = dict.value(forKey: "name") as! String
        products = [IProduct]()

        if let productsArray = dict.value(forKey: "products") as? NSArray {
            for i in 0 ..< productsArray.count {
                let product =  IProduct(productsArray[i] as! NSDictionary, ranking: ranking) // Product(productsArray.count[i])
                
                self.products.append(product)
            }
        }
         self.products =  self.products.sorted{($1.viewCount > $0.viewCount) && ($1.orderCount > $0.orderCount)  }
      
    }
}
