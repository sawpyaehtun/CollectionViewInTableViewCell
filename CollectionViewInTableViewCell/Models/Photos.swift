//
//  Photos.swift
//  CollectionViewInTableViewCell
//
//  Created by SawPyaeHtun on 12/28/18.
//  Copyright © 2018 SawPyaeHtun. All rights reserved.
//

import Foundation
import Gloss

struct Photos {
    let page : Int?
    let pages : Int?
    let perpage : Int?
    let total : Int?
    var photo : [Photo]?
    
    init?(json: JSON) {
        self.page = "photos.page" <~~ json
        self.pages = "photos.pages" <~~ json
        self.perpage = "photos.perpage" <~~ json
        self.total = "photos.total" <~~ json
        self.getPhotoArray(json: ("photos.photo" <~~ json))
    }
    
    mutating func getPhotoArray(json : [JSON]?) {
    
            var photoArray = [] as [Photo]
            for jsonObj in json!
            {
                photoArray.append(Photo(json: jsonObj)!)
            }
            self.photo = photoArray
        }
    
}
