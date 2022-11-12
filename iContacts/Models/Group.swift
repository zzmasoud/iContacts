//
//  Group.swift
//  iContacts
//
//  Created by Masoud Sheikh Hosseini on 11/11/22.
//

import Foundation

struct Group: Decodable {
    let name: String
    let people: [Contact]
    
    enum CodingKeys: String, CodingKey {
        case name = "groupName"
        case people
    }
}
