//
//  MedalModel.swift
//  AngolaSAFinal
//
//  Created by Vaibhav Kapur on 18/10/2016.
//  Copyright © 2016 AgeAnalytics. All rights reserved.
//

import Foundation
import Alamofire

struct NewsModel: ResponseObjectSerializable,ResponseCollectionSerializable, CustomStringConvertible{
    let newstitle: String
    let newsDescription: String
    let link: String
    let detailedDescription: String
    
    var description: String {
        return "Medal: { name: \(newstitle) }"
    }
    
    init?(response: HTTPURLResponse, representation: Any) {
        guard
            let representation = representation as? [String: Any],
            let newstitle = representation["newstitle"] as? String,
            let newsDescription = representation["newsdescription"] as? String,
            let link = representation["link"] as? String,
            let detailedDescription = representation["detailed_description"] as? String
        
        else {
            return nil
        }
    
        self.newstitle = newstitle
        self.newsDescription = newsDescription
        self.link = link
        self.detailedDescription = detailedDescription

    }
}

