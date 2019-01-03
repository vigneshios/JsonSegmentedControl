//
//  Post.swift
//  SegmentedControl3APIs
//
//  Created by Vignesh on 03/01/19.
//  Copyright © 2019 Vignesh. All rights reserved.
//

import Foundation


struct Posts {
    let userId: Int
    let body: String
    
    init(userId: Int, body: String) {
        self.userId = userId
        self.body = body
    }
    
    init?(json: [String: Any]) {
        guard let userID = json["userId"] as? Int,
                let body = json["body"] as? String
            else {return nil}
        
        self.userId = userID
        self.body = body
        
        
    }
}
