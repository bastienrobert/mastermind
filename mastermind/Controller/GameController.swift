//
//  GameController.swift
//  mastermind
//
//  Created by Bastien Robert on 20/03/2018.
//  Copyright © 2018 Bastien Robert. All rights reserved.
//

import UIKit

class GameController: ViewController, UITableViewDataSource, UITableViewDelegate {
    
    var myGame = Game()
    @IBOutlet weak var gameTable: UITableView!
    
    // Buttons and labels
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var labelCounter: UILabel!
    @IBOutlet var fruitButtons: [UIButton]!
    @IBOutlet weak var validateButton: UIButton!
    
    // Popup
    @IBOutlet weak var popupContainer: UIView!
    @IBOutlet weak var popupTitle: UILabel!
    @IBOutlet weak var popupLabel: UILabel!
    @IBOutlet weak var popupButton: UIButton!
    @IBOutlet var popupResults: [UILabel]!
    @IBAction func popupBtnPressed(_ sender: UIButton) {
        customizePopup(visible: false, result: false)
        self.myGame = Game()
        gameTable.reloadData()
    }
    @IBOutlet weak var popupBackground: UIImageView!
    
    
    // Actions vars
    @IBAction func fruitBtnPressed(_ sender: UIButton) {
        myGame.cache.count == 0 ? myGame.cache.append([]) : nil
        myGame.cache[myGame.row].append(sender.tag)
        if (myGame.cache[myGame.row].count % 4 == 0) {
            validateButton.isHidden = false
        }
        myGame.cache[myGame.row].count % 4 == 0 ? myGame.cache.append([]) : nil
        gameTable.reloadData()
    }
    @IBAction func restartGame(_ sender: Any) {
        self.myGame.endGame()
    }
    @IBAction func validateCombination(_ sender: Any) {
        myGame.check()
        validateButton.isHidden = true
        gameTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(timer), name: Notification.Name(rawValue: "timerUpdated"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(endGame), name: Notification.Name(rawValue: "endGame"), object: nil)
        
        for button in fruitButtons {
            let params = Color.Value(rawValue: button.tag)!.label()
            customizeControls(button: button, params: params)
        }
        customizeButton(button: validateButton)
        customizePopup(visible: false, result: false)
        validateButton.isHidden = true
        
        gameTable.delegate = self
        gameTable.dataSource = self
        self.gameTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    @objc func timer() {
        self.labelCounter.text = myGame.getTimer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customizeControls(button: UIButton, params: [String : Any]) {
        button.setTitle(params["icon"] as? String, for: .normal)
        button.backgroundColor = params["backgroundColor"] as? UIColor
        button.layer.borderColor = (params["borderColor"] as! CGColor)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.layer.borderWidth = 2
    }
    
    func customizePopup(visible: Bool, result: Bool) {
        popupContainer.layer.cornerRadius = 5
        popupButton.clipsToBounds = true
        popupButton.layer.cornerRadius = 5
        popupButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        popupContainer.isHidden = !visible
        popupBackground.isHidden = !visible
        popupTitle.isHidden = result
        for label in popupResults {
            label.isHidden = !result
            customizeResult(label: label, id: myGame.solution[label.tag])
        }

    }
    
    @objc func endGame() {
        myGame.stopTimer()
        if myGame.end == true {
            customizePopup(visible: true, result: false)
            popupTitle.text = "🏆 YOU WIN! 🏆"
            popupLabel.text = "\(myGame.row) rounds in \(myGame.getTimer()), you’re dope!"
            popupButton.setTitle("Save my score", for: .normal)
        } else if myGame.end == false {
            customizePopup(visible: true, result: true)
            popupLabel.text = "Oh no! So cloooose!\nNext time will be the one!"
            popupButton.setTitle("Yep for sure! 💪", for: .normal)
        } else {
            customizePopup(visible: false, result: false)
        }
    }
    
    //GAME TABLE VIEW
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = gameTable.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as? GameTableViewCell else {
            fatalError("can't cast cell")
        }
        
        let row = indexPath.row
        
        cell.gameId.text = String(indexPath.row + 1)
        for button in cell.gameButtons {
            if !myGame.cache.isEmpty, myGame.cache.count > row, !myGame.cache[row].isEmpty, myGame.cache[row].count > button.tag {
                customizeFruit(button: button, id: myGame.cache[row][button.tag])
            } else {
                customizeFruit(button: button, id: nil)
            }
        }
        
        for label in cell.gameSolutions {
            if !myGame.results.isEmpty, myGame.results.count > row {
                customizeSolution(label: label, status: myGame.results[row][label.tag])
            } else {
                customizeSolution(label: label, status: nil)
            }
        }
        
        return cell
    }
    
}



