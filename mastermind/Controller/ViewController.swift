//
//  ViewController.swift
//  mastermind
//
//  Created by Bastien Robert on 19/03/2018.
//  Copyright © 2018 Bastien Robert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customizeButton(button: UIButton) {
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
    }


}

