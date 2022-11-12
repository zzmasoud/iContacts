//
//  ContactTableViewCellVM.swift
//  iContacts
//
//  Created by Masoud Sheikh Hosseini on 11/11/22.
//

import Foundation

protocol ContactTableViewCellVMP {
    func setView(_ delegate: ContactTableViewCellVD)
    var name: String { get }
    var message: String { get }
    var iconImage: String { get }
    var profileImage: String { get }
}

class ContactTableViewCellVM {
    
    private let model: Contact
    private weak var view: ContactTableViewCellVD? {
        didSet {
            view?.fillUI()
        }
    }
    
    init(model: Contact) {
        self.model = model
    }
    
    func setView(_ delegate: ContactTableViewCellVD) {
        self.view = delegate
    }
}

extension ContactTableViewCellVM: ContactTableViewCellVMP {
    var name: String {
        return [model.firstName, model.lastName].joined(separator: " ")
    }
    
    var message: String {
        return model.message ?? ""
    }
    
    var iconImage: String {
        return model.status.icon
    }
    
    var profileImage: String {
        return model.gender?.image ?? Contact.Gender.unknown.image
    }
}
