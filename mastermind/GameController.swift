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
    
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var labelCounter: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(timer), name: Notification.Name(rawValue: "timerUpdated"), object: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func timer() {
        self.labelCounter.text = myGame.getTimer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



