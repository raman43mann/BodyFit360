//
//  ExcerciseCell.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh 
//
//  Created by Kaushal on 22/10/24.
//

import UIKit

class ExcerciseCell: UITableViewCell {
    @IBOutlet weak var seprator: UIView!
    @IBOutlet weak var excersicelabel: UILabel!
    
    @IBOutlet weak var excercisecount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
