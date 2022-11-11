//
//  ContactTableViewCell.swift
//  iContacts
//
//  Created by Masoud Sheikh Hosseini on 11/11/22.
//

import UIKit

protocol ContactTableViewCellViewDelegate: AnyObject {
    func fillUI()
}

class ContactTableViewCell: UITableViewCell {
    
    // MARK: - Statics
    
    static let id = "ContactTableViewCell"
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var statusImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var profileImageView: UIImageView!
    
    // MARK: - Properties
    
    var viewModel: ContactTableViewCellVMP! {
        didSet {
            viewModel.setView(self)
        }
    }
}

extension ContactTableViewCell: ContactTableViewCellViewDelegate {
    func fillUI() {
        titleLabel.text = viewModel.name
        subtitleLabel.text = viewModel.message
        statusImageView.image = UIImage(named: viewModel.iconImage)
        profileImageView.image = UIImage(named: viewModel.profileImage)
    }
}
