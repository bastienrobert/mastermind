//
//  HomeController.swift
//  mastermind
//
//  Created by Bastien Robert on 20/03/2018.
//  Copyright © 2018 Bastien Robert. All rights reserved.
//

import UIKit

class HomeController: ViewController {
    
    @IBOutlet weak var buttonPlay: UIButton!
    @IBOutlet weak var buttonScores: UIButton!
    @IBOutlet weak var buttonCredits: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        customizeButton(button: buttonPlay)
        customizeButton(button: buttonScores)
        customizeButton(button: buttonCredits)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customizeButton(button: UIButton) {
        button.backgroundColor = .clear
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
    }
    
    
}


