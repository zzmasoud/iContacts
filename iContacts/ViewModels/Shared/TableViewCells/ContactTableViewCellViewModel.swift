//
//  ContactTableViewCellViewModel.swift
//  iContacts
//
//  Created by Masoud Sheikh Hosseini on 11/11/22.
//

import Foundation

protocol ContactTableViewCellVMP {
    func setView(_ delegate: ContactTableViewCellViewDelegate)
    var name: String { get }
    var message: String { get }
    var iconImage: String { get }
    var profileImage: String { get }
}

class ContactTableViewCellViewModel {
    
    private let model: ContactRepresentable
    private weak var view: ContactTableViewCellViewDelegate? {
        didSet {
            view?.fillUI()
        }
    }
    
    init(model: ContactRepresentable) {
        self.model = model
    }
    
    func setView(_ delegate: ContactTableViewCellViewDelegate) {
        self.view = delegate
    }
}

extension ContactTableViewCellViewModel: ContactTableViewCellVMP {
    var name: String {
        return [model.firstName, model.lastName].joined(separator: " ")
    }
    
    var message: String {
        return model.status.description
    }
    
    var iconImage: String {
        return model.status.icon
    }
    
    var profileImage: String {
        return model.imageURL
    }
}
