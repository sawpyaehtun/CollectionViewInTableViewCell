//
//  Photo.swift
//  CollectionViewInTableViewCell
//
//  Created by SawPyaeHtun on 12/28/18.
//  Copyright © 2018 SawPyaeHtun. All rights reserved.
//

import Foundation
import Gloss

struct Photo {
    let id : String?
    let owner : String?
    let secret : String?
    let server : String?
    let farm : Int?
    let title : String?
    let ispublic : Int?
    let isfriend : Int?
    let isfamily : Int?
    let is_primary : Int?
    let has_comment : Int?
    
    init?(json: JSON) {
        self.id = "id" <~~ json
        self.owner = "owner" <~~ json
        self.secret = "secret" <~~ json
        self.server = "server" <~~ json
        self.farm = "farm" <~~ json
        self.title = "title" <~~ json
        self.ispublic = "ispublic" <~~ json
        self.isfriend = "isfriend" <~~ json
        self.isfamily = "isfamily" <~~ json
        self.is_primary = "is_primary" <~~ json
        self.has_comment = "has_comment" <~~ json
       
    }
}
