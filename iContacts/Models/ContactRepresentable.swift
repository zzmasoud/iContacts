//
//  ContactRepresentable.swift
//  iContacts
//
//  Created by Masoud Sheikh Hosseini on 11/11/22.
//

import Foundation

enum ContactStatus: CustomStringConvertible {
    case online, away, busy, offline, callForwarding, pending
    
    var description: String { return "" }
    var icon: String { return "" }
}

protocol ContactRepresentable {
    var firstName: String { get }
    var lastName: String { get }
    var imageURL: String { get }
    var status: ContactStatus { get }
}
