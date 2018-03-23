//
//  ViewController.swift
//  mastermind
//
//  Created by Bastien Robert on 19/03/2018.
//  Copyright © 2018 Bastien Robert. All rights reserved.
//

import UIKit
import GameKit

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
    
    func customizeFruit(button: UIButton, id: Int?) {
        if (id != nil) {
            let params = Color.Value(rawValue: id!)!.label()
            button.setTitle(params["icon"] as? String, for: .normal)
            button.backgroundColor = params["backgroundColor"] as? UIColor
            button.layer.borderColor = (params["borderColor"] as! CGColor)
        } else {
            button.setTitle("", for: .normal)
            button.backgroundColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0)
            button.layer.borderColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0).cgColor
        }
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.layer.borderWidth = 2
    }
    
    func customizeResult(label: UILabel, id: Int?) {
        let params = Color.Value(rawValue: id!)!.label()
        label.text = params["icon"] as? String
        label.backgroundColor = params["backgroundColor"] as? UIColor
        label.layer.borderColor = (params["borderColor"] as! CGColor)
        label.layer.cornerRadius = 25
        label.layer.masksToBounds = true
        label.layer.borderWidth = 2
    }
    
    func customizeSolution(label: UILabel, status: Bool?) {
        if (status == true) {
            label.backgroundColor = UIColor(red:0.95, green:0.98, blue:0.91, alpha:1.0)
            label.layer.borderColor = UIColor(red:0.90, green:0.97, blue:0.83, alpha:1.0).cgColor
        } else if (status == false) {
            label.backgroundColor = UIColor(red:0.96, green:0.80, blue:0.82, alpha:1.0)
            label.layer.borderColor = UIColor(red:0.93, green:0.64, blue:0.67, alpha:1.0).cgColor
        } else {
            label.backgroundColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0)
            label.layer.borderColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0).cgColor
        }
        label.layer.cornerRadius = 7
        label.layer.masksToBounds = true
        label.layer.borderWidth = 2
    }


}

