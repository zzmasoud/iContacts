//
//  ContactsTableViewControllerVM.swift
//  iContacts
//
//  Created by Masoud on 12/11/22.
//

import Foundation

protocol ContactsTableViewControllerVMP {
    func setView(_ delegate: ContactsTableViewControllerVD)
    func numberOfRows(inSection: Int) -> Int
    func title(forSection: Int) -> String?
    func viewModelForCell(atSection: Int, index: Int) -> ContactTableViewCellVMP
    var numberOfSections: Int { get }
}

class ContactsTableViewControllerVM {
    
    private let provider: ContactsProvider
    private var groups: [Group] = [] {
        didSet {
            view?.fillUI()
        }
    }
    private weak var view: ContactsTableViewControllerVD? {
        didSet {
            fetchContacts()
        }
    }
    
    init(provider: ContactsProvider) {
        self.provider = provider
    }

    func setView(_ delegate: ContactsTableViewControllerVD) {
        self.view = delegate
    }
    
    private func fetchContacts() {
        provider.load { [weak self] result in
            guard let self = self else { return }
    
            switch result {
            case .success(let groups):
                self.groups = groups
            case .failure(let error):
                self.view?.showError(message: error.localizedDescription)
            }
        }
    }
}

extension ContactsTableViewControllerVM: ContactsTableViewControllerVMP {
    func numberOfRows(inSection section: Int) -> Int {
        return groups[section].people.count
    }
    
    func title(forSection section: Int) -> String? {
        return groups[section].name
    }
    
    func viewModelForCell(atSection section: Int, index: Int) -> ContactTableViewCellVMP {
        return ContactTableViewCellVM(model: groups[section].people[index])
    }
    
    var numberOfSections: Int {
        return groups.count
    }
}
