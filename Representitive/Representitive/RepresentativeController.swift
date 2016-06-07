//
//  RepresentativeController.swift
//  Representitive
//
//  Created by Karl Pfister on 6/7/16.
//  Copyright © 2016 Karl Pfister. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let baseURL = "http://whoismyrepresentative.com"
    // http://whoismyrepresentative.com/getall_reps_bystate.php?state=CA&output=json
    // The API had me add &output=json so I would guess i might need to use that as my endPoint...
    // Also, I tink i need to as State as a endpoint? ?state=CA      &output=json
    
    static func searchURLByState(searchTerm: String) -> NSURL {
        return NSURL(string: baseURL + "/getall_reps_bystate.php?state=\(searchTerm)&output=json")!
        
    }
    
    static func searchRepsByState(searchTerm: String, completion: (representative: [Representative]) -> Void){
        // Step 1: Get/Make my complete URL
        let url = searchURLByState(searchTerm)
        
        // Step 2: Use that complete URL to get data from the network by passing it into our performRequestForURL
        NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
            
            // Step 3: Alright... I have my data...well, hopefully. lets check/guard against it
            
            guard let data = data,
                
                // Step 4: Now that i have my data I am going to convert it to JSON
                let json = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String:AnyObject],
                let representativeDictionaries = json["results"] as? [[String:AnyObject]] else {
                    
                    print("Unable to serialize Json, sorry fam.")
                    completion(representative: [])
                    return
            }
            let representatives = representativeDictionaries.flatMap({Representative(jsonDictionary:$0)})
            completion(representative: representatives)
        }
        
    }
}