//
//  Business.swift
//  Yelp-iOS
//
//  Created by Keith Smyth on 26/10/2016.
//  Copyright © 2016 Keith Smyth. All rights reserved.
//

import Foundation
import BDBOAuth1Manager

class Business {
    let name: String?
    let imageURL: URL?
    let distance: String?
    let address: String?
    let categories: String?
    let ratingImageURL: URL?
    let reviewCount: NSNumber?
    
    init (dict: NSDictionary) {
        name = dict["name"] as? String
        
        let imageURLString = dict["image_url"] as? String
        imageURL = imageURLString != nil ? URL(string: imageURLString!) : nil
        
        let distanceMeters = dict["distance"] as? NSNumber
        if distanceMeters != nil {
            let milesPerMeter = 0.000621371
            distance = String(format: "%.2f mi", milesPerMeter * distanceMeters!.doubleValue)
        } else {
            distance = nil
        }
        
        let location = dict["location"] as? NSDictionary
        var address = ""
        if location != nil {
            let addressArray = location!["address"] as? NSArray
            if addressArray != nil && addressArray!.count > 0 {
                address = addressArray![0] as! String
            }
            
            let neighborhoods = location!["neighborhoods"] as? NSArray
            if neighborhoods != nil && neighborhoods!.count > 0 {
                if !address.isEmpty {
                    address += ", "
                }
                address += neighborhoods![0] as! String
            }
        }
        self.address = address
        
        let categoriesArray = dict["categories"] as? [[String]]
        if categoriesArray != nil {
            var categoryNames = [String]()
            for category in categoriesArray! {
                let categoryName = category[0]
                categoryNames.append(categoryName)
            }
            categories = categoryNames.joined(separator: ", ")
        } else {
            categories = nil
        }
        
        let ratingImageURLString = dict["rating_img_url_large"] as? String
        if ratingImageURLString != nil {
            ratingImageURL = URL(string: ratingImageURLString!)
        } else {
            ratingImageURL = nil
        }
        
        reviewCount = dict["review_count"] as? NSNumber
    }
    
    class func search(term: String, completion: @escaping ([Business]?, Error?) -> Void) {
        
        // Default the location to San Francisco
        let params: [String : AnyObject] = ["term": term as AnyObject, "ll": "37.785771,-122.406165" as AnyObject]
        
        YelpApi.sharedInstance.get("search", parameters: params,
                                          success: { (operation: AFHTTPRequestOperation, response: Any) in
                                            if let response = response as? [String: Any] {
                                                if let dictionaries = response["businesses"] as? [NSDictionary] {
                                                    var businesses = [Business]()
                                                    for dict in dictionaries {
                                                        businesses.append(Business(dict: dict))
                                                    }
                                                    completion(businesses, nil)
                                                }
                                            }},
                                          failure: { (operation:AFHTTPRequestOperation?, error: Error) in
                                            completion(nil, error)
        })
    }
}
