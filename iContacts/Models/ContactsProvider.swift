//
//  ContactsProvider.swift
//  iContacts
//
//  Created by Masoud Sheikh Hosseini on 11/11/22.
//

import Foundation

enum ContactsProviderResult<Error: Swift.Error> {
    case success([ContactRepresentable])
    case failure(Error)
}

protocol ContactsProvider {
    associatedtype Error: Swift.Error
    func load(completion: @escaping (ContactsProviderResult<Error>)->Void)
}
