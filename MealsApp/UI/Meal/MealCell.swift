//
//  MealCell.swift
//  MealsApp
//
//  Created by user247205 on 11/2/23.
//

import UIKit

class MealCell: UITableViewCell {
    
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
    
}
