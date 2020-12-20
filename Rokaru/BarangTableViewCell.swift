//
//  BarangTableViewCell.swift
//  Rokaru
//
//  Created by Stanley on 21/12/20.
//

import UIKit

class BarangTableViewCell: UITableViewCell {
    @IBOutlet weak var _barangImage: UIImageView!
    @IBOutlet weak var _barangName: UILabel!
    @IBOutlet weak var _barangPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
