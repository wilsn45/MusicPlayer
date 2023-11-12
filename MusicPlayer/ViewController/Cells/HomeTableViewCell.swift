//
//  HomeTableViewCell.swift
//  MusicPlayer
//
//  Created by wilson shakya on 12/11/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(songName: String) {
        self.label.text = songName
    }

}
