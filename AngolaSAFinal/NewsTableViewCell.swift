//
//  NewsTableViewCell.swift
//  
//
//  Created by Vaibhav Kapur on 18/10/2016.
//
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
