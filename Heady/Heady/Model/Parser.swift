//
//  Parser.swift
//  Heady
//
//  Created by Pritam on 19/12/18.
//  Copyright © 2018 parihar. All rights reserved.
//

import UIKit

class Parser: NSObject {

     init(_ url : String, handler: @escaping (NSDictionary) -> Void) {
        super.init()
        self.getData(url, handler: handler)
    }
    func getData(_ urlString:String, handler: @escaping (NSDictionary) -> Void){
        //create the url with NSURL
        let url = URL(string: urlString )!
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        let request = URLRequest(url: url)
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary {
                    handler(json)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        
        task.resume()
    }
}
