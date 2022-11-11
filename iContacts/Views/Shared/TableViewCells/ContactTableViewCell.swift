//
//  ContactTableViewCell.swift
//  iContacts
//
//  Created by Masoud Sheikh Hosseini on 11/11/22.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    // MARK: - Statics
    
    static let id = "ContactTableViewCell"
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var statusImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var profileImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
