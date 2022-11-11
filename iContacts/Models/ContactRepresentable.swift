//
//  ContactRepresentable.swift
//  iContacts
//
//  Created by Masoud Sheikh Hosseini on 11/11/22.
//

import Foundation

enum ContactStatus {
    case online, away, busy, offline, callForwarding, pending
}

protocol ContactRepresentable {
    var title: String { get }
    var subtitle: String { get }
    var imageURL: String { get }
    var status: ContactStatus { get }
}
