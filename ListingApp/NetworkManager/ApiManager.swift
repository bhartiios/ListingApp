//
//  ApiManager.swift
//  VenueSearch
//
//  Created by Bharti Sharma on 13/12/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import Foundation
protocol ApiManager {
    
}

extension ApiManager{
    
    
    /// Get Webservice
    ///
    /// - Parameters:
    ///   - strURL: url string
    ///   - completionHandler: Completion closure
    
    func makeGETWebserviceCall(strURL:String, completionHandler: @escaping (_ jsonResponse:Any?, _ error:Error?) -> Void){
        
        guard let url = URL(string:strURL) else{
            completionHandler(nil, nil)
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if error != nil{
                completionHandler(nil, error)
                return
            }
            guard let responseData  = data else{
                completionHandler(nil,nil)
                return
            }
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: responseData) as? [String:AnyObject]
                completionHandler(jsonResponse, nil)
            } catch let err as NSError {
                print("error trying to convert data to JSON \(err)")
                return
            }
        }.resume()
    }
}
