//
//  ContactRepresentable.swift
//  iContacts
//
//  Created by Masoud Sheikh Hosseini on 11/11/22.
//

import Foundation

enum ContactStatus: String {
    case online, away, busy, offline, callForwarding, pending
    
    var icon: String {
        return "contacts_list_status_\(self)"
    }
}

protocol ContactRepresentable {
    var firstName: String { get }
    var lastName: String { get }
    var imageURL: String { get }
    var status: ContactStatus { get }
    var message: String? { get }
}
