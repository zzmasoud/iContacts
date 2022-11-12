//
//  Contact.swift
//  iContacts
//
//  Created by Masoud Sheikh Hosseini on 11/11/22.
//

import Foundation

struct Contact: Decodable {
    
    // MARK: - Enums
    
    enum ContactStatus: String, Decodable {
        case online, away, busy, offline, callforwarding, pending
        
        var icon: String {
            switch self {
            case .callforwarding:
                return "contacts_list_call_forward"
            default:
                return "contacts_list_status_\(self)"
            }
        }
    }

    enum Gender: String, Decodable {
        case male, female, unknown
        
        var image: String {
            return "contacts_list_avatar_\(self)"
        }
    }
    
    // MARK: - Properties

    var firstName: String
    var lastName: String
    var gender: Gender?
    var status: ContactStatus
    var message: String?
    
    // MARK: - JSON keys
    
    enum CodingKeys: String, CodingKey {
        case status = "statusIcon"
        case message = "statusMessage"
        
        case firstName, lastName, gender
    }
}
