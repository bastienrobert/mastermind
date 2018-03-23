//
//  GameTableViewCell.swift
//  mastermind
//
//  Created by Bastien Robert on 22/03/2018.
//  Copyright © 2018 Bastien Robert. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet var gameSolutions: [UILabel]!
    @IBOutlet var gameButtons: [UIButton]!
    @IBOutlet weak var gameId: UILabel!
    
    @IBAction func gameBtnPressed(_ sender: UIButton) {
        print(sender.tag)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
