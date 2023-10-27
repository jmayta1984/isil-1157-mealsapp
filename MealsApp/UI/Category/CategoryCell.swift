//
//  CategoryCell.swift
//  MealsApp
//
//  Created by user247205 on 10/26/23.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    static var identifier: String {
        return String (describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.nameLabel.text = nil
    }
    
}
