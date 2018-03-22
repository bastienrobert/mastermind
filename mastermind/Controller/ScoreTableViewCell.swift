//
//  ScoreTableViewCell.swift
//  mastermind
//
//  Created by Bastien Robert on 22/03/2018.
//  Copyright © 2018 Bastien Robert. All rights reserved.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {

    @IBOutlet weak var scoreId: UILabel!
    @IBOutlet weak var scoreName: UILabel!
    @IBOutlet weak var scoreRounds: UILabel!
    @IBOutlet weak var scoreTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
