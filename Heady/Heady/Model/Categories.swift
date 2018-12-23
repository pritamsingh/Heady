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
    
    init(dict : NSDictionary) {
        id = dict.value(forKey: "id") as! Int
        name = dict.value(forKey: "name") as! String
        products = [IProduct]()

        if let productsArray = dict.value(forKey: "products") as? NSArray {
            for i in 0 ..< productsArray.count {
                let product =  IProduct(productsArray[i] as! NSDictionary) // Product(productsArray.count[i])
                self.products.append(product)
            }
        }
    }
}
