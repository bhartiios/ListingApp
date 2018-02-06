//
//  Product.swift
//  ListingApp
//
//  Created by Bharti Sharma on 05/02/18.
//  Copyright © 2018 Bharti Sharma. All rights reserved.
//

import Foundation

struct Product {
    var title = ""
    var description = ""
    var imageUrl = ""
    
    mutating func fillProduct(dictProduct:[String:String]){
        if let title = dictProduct["title"]{
            self.title = title
        }
        if let description = dictProduct["description"]{
            self.description = description
        }
        if let url = dictProduct["imageHref"]{
            imageUrl = url
        }
    }
}
