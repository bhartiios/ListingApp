//
//  FoursquareApiMgr.swift
//  VenueSearch
//
//  Created by Bharti Sharma on 13/12/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import Foundation

protocol ListingApiMgr: ApiManager {}

extension ListingApiMgr{
    
    //MARK:- Webservices
    
    /// Webservice to fetch list of venues
    ///
    /// - Parameters:
    ///   - completionHandler: block to handle success & failure
    func getProducts(completionHandler: @escaping (_ arrVenueResults:[Product]?, _ error: Error?) -> Void){
        self.makeGETWebserviceCall(strURL: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json", completionHandler: { (response, error) in
            
            if error != nil{
                completionHandler(nil, error)
                return
            }
            guard let _ = error, let dictResponse = response as? [String:AnyObject] else{
                completionHandler(nil, nil)
                return
            }
            
            guard let dic = dictResponse["response"] as? [String:AnyObject], let arrayResult = dic["rows"] as? [[String:String]] else{
                return
            }
            
            var arrProd = [Product]()
            
            for dictProd in arrayResult{
                var venue = Product()
                venue.fillProduct(dictProduct: dictProd)
                arrProd.append(venue)
            }
            completionHandler(arrProd,nil)
        })
    }
}
