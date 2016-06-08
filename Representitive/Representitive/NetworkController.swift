//
//  NetworkController.swift
//  Representitive
//
//  Created by Karl Pfister on 6/7/16.
//  Copyright © 2016 Karl Pfister. All rights reserved.
//

import Foundation

class NetworkController {
    
    enum HTTPMethod: String {
        case Get = "GET"
        case Put = "PUT"
        case Post = "POST"
        case Patch = "PATCH"
        case Delete = "DELETE"
        
    }
    
    // Network Controller is what is communicating between our app and the API
    static func performRequestForURL(url: NSURL, completion:((data: NSData?, error: NSError?) -> Void)?) {
        
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithURL(url) { (data, response, error) in
            if let completion = completion {
                completion(data: data, error: error)
            }
        }
        dataTask.resume() // This really means Begin, and resume. 
    }
    
    
    static func urlFromURLParameters(url: NSURL, urlParameters: [String: String]?) -> NSURL {
        let components = NSURLComponents(URL: url, resolvingAgainstBaseURL: true)
        components?.queryItems = urlParameters?.flatMap({NSURLQueryItem(name: $0.0, value: $0.1)})
        
        if let url = components?.URL {
            return url
        } else {
            fatalError("URL optional is nil")
        }
    }
}