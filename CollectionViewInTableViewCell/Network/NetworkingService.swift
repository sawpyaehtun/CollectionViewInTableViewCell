//
//  NetworkingService.swift
//  AlamofireAndGloss
//
//  Created by SawPyaeHtun on 12/19/18.
//  Copyright © 2018 SawPyaeHtun. All rights reserved.
//

import Foundation
import Alamofire
typealias JSON = [String : Any]

class NetworkingService {
    
    static let networkCall = NetworkingService()
    let url = "https://api.flickr.com/services/rest"
    let parameters : Parameters = [
        "method" : "flickr.galleries.getPhotos",
        "api_key" : "2529534e5383284c8e7666983b066a3f",
        "gallery_id" : "72157645610524777",
        "format" : "json",
        "nojsoncallback" : "1",
    ]
    
    private init(){}
    
    func getPhotoList(success successBlock: @escaping (Photos) -> Void) {
        
        Alamofire.request(url,method : .get, parameters: parameters).responseJSON { (response) in
            guard let json = response.result.value as? JSON else {print(response.error!)
                return}
            let photos = Photos(json: json)
            successBlock(photos!)
        }
        
    }
    
//    func getCompanyArray(json : [JSON]) -> [Company] {
//
//        var companies = [] as [Company]
//        var i = 0
//        for jsonObj in json
//        {
//            companies.append(Company(json: jsonObj, logo : companyLogo[i])!)
//            i += 1
//        }
//        return companies
//    }
//
}

