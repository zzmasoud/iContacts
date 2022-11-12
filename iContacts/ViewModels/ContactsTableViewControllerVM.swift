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
