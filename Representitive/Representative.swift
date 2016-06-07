//
//  Representative.swift
//  Representitive
//
//  Created by Karl Pfister on 6/7/16.
//  Copyright © 2016 Karl Pfister. All rights reserved.
//

import Foundation


class Representative {
    
    
    private let kName = "name"
    private let kParty = "party"
    private let kState = "state"
    private let kDistrict = "district"
    private let kPhone = "phone"
    private let kOffice = "office"
    private let kLink = "link"
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
    init(name: String, party: String, state: String, district: String, phone: String, office: String, link: String) {
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
    }
    
    init?(jsonDictionary: [String:AnyObject]){
        guard let name = jsonDictionary[kName] as? String, party = jsonDictionary[kParty] as? String, state = jsonDictionary[kState] as? String, district = jsonDictionary[kDistrict] as? String, phone = jsonDictionary[kPhone] as? String, office = jsonDictionary[kOffice] as? String, link = jsonDictionary[kLink] as? String else {return nil}
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
    }

}