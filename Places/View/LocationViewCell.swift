//
//  LocationViewCell.swift
//  Places
//
//  Created by MacBook on 4/4/22.
//

import UIKit

class LocationViewCell: UITableViewCell {
    static let identifier = "LocationViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    
    
    @IBOutlet weak var detailss: UILabel!
    
    func setupUI(mark:LandMark){
        name.text = mark.name
        time.text = "\(mark.time)"
        detailss.text = mark.details
        
    }
}
