//
//  ScoreController.swift
//  mastermind
//
//  Created by Bastien Robert on 22/03/2018.
//  Copyright © 2018 Bastien Robert. All rights reserved.
//

import UIKit

class ScoreController: ViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var scoreTable: UITableView!
    
    var scoreArray : [[String:String]] = [["id":"0","name":"Bastien","rounds":"3","time":"00:33"],
                                   ["id":"1","name":"Mat","rounds":"1","time":"00:23"],
                                   ["id":"2","name":"Seb","rounds":"18","time":"00:53"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scoreTable.delegate = self
        scoreTable.dataSource = self
        self.scoreTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoreArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = scoreTable.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath) as? ScoreTableViewCell else {
            fatalError("can't cast cell")
        }
        
        cell.scoreId.text = scoreArray[indexPath.row]["id"]
        cell.scoreName.text = scoreArray[indexPath.row]["name"]
        cell.scoreRounds.text = scoreArray[indexPath.row]["rounds"]
        cell.scoreTime.text = scoreArray[indexPath.row]["time"]
        
        return cell
    }
}

