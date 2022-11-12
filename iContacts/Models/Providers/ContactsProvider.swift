//
//  ContactsProvider.swift
//  iContacts
//
//  Created by Masoud Sheikh Hosseini on 11/11/22.
//

import Foundation

enum ContactsProviderResult {
    case success([Group])
    case failure(Error)
}

protocol ContactsProvider {
    func load(completion: @escaping (ContactsProviderResult)->Void)
}
