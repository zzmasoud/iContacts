//
//  ContactsTableViewController.swift
//  iContacts
//
//  Created by Masoud Sheikh Hosseini on 11/11/22.
//

import UIKit

protocol ContactsTableViewControllerVD: AnyObject {
    func fillUI()
}

class ContactsTableViewController: UITableViewController {

    var viewModel: ContactsTableViewControllerVMP! {
        didSet {
            viewModel.setView(self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: ContactTableViewCell.id, bundle: nil), forCellReuseIdentifier: ContactTableViewCell.id)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.title(forSection: section)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(inSection: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.id, for: indexPath) as? ContactTableViewCell else { fatalError("expected to be ContactTableViewCell") }
        
        cell.viewModel = viewModel.viewModelForCell(atSection: indexPath.section, index: indexPath.row)
        
        return cell
    }
}

extension ContactsTableViewController: ContactsTableViewControllerVD {
    func fillUI() {
        tableView.reloadData()
    }
}
