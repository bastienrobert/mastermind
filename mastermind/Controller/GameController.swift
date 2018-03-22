//
//  GameController.swift
//  mastermind
//
//  Created by Bastien Robert on 20/03/2018.
//  Copyright © 2018 Bastien Robert. All rights reserved.
//

import UIKit

class GameController: ViewController {
    
    var myGame = Game()
    
    // Buttons and labels
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var labelCounter: UILabel!
    @IBOutlet var fruitButtons: [UIButton]!
    @IBOutlet weak var validateButton: UIButton!
    
    // Actions vars
    
    @IBAction func fruitBtnPressed(_ sender: UIButton) {
        myGame.cache.count <= 4 ? myGame.cache.append(sender.tag) : nil
        if (myGame.cache.count >= 4) {
            validateButton.isHidden = false
        }
    }
    @IBAction func restartGame(_ sender: Any) {
        self.myGame = Game()
    }
    @IBAction func validateCombination(_ sender: Any) {
        myGame.check(entry: myGame.cache)
        myGame.endRow()
        validateButton.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(timer), name: Notification.Name(rawValue: "timerUpdated"), object: nil)
        
        for button in fruitButtons {
            let params = Color.Value(rawValue: button.tag)!.label()
            customizeControls(button: button, params: params)
        }
        customizeButton(button: validateButton)
        validateButton.isHidden = true
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
    
}



