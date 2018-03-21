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
    var cache: Array<Int> = []
    var rows: Int = 0
    
    // Buttons and labels
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var labelCounter: UILabel!
    @IBOutlet var fruitButtons: [UIButton]!
    
    // Actions vars
    
    @IBAction func fruitBtnPressed(_ sender: UIButton) {
        self.cache.count <= 4 ? self.cache.append(sender.tag) : nil
        if (self.cache.count >= 4) {
            myGame.check(entry: self.cache)
            self.cache = []
            self.rows += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(timer), name: Notification.Name(rawValue: "timerUpdated"), object: nil)
        
        for button in fruitButtons {
            let params = Color.Value(rawValue: button.tag)!.label()
            customizeControls(button: button, params: params)
        }
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



