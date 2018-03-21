//
//  Game.swift
//  mastermind
//
//  Created by Bastien Robert on 20/03/2018.
//  Copyright © 2018 Bastien Robert. All rights reserved.
//

import Foundation
import UIKit

class Game {
    
    var timer : Int = 0
    var solution : Array<Any> = []
    
    init() {
        self.startTimer()
        self.solution = self.createCombination()
        print(self.solution)
        print(self.resolveCombination())
    }
    
    func startTimer() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.setTimer), userInfo: nil, repeats: true)
    }
    
    @objc func setTimer() {
        timer += 1
        let notification = Notification(name: Notification.Name("timerUpdated"))
        NotificationCenter.default.post(notification)
    }
    
    func getTimer() -> String {
        let m : Int = timer / 60
        let s : Int = timer % 60
        return (String(format: "%02d:%02d", m, s))
    }
    
    func createCombination() -> Array<Int> {
        var combination: Array<Int> = []
        var random : Int
        for _ in 0..<4 {
            random = Int(arc4random_uniform(UInt32(Color.Value.count)))
            combination.append(random)
        }
        return combination
    }
    
    func resolveCombination() -> Array<String> {
        var resolution: Array<String> = []
        for i in self.solution {
            resolution.append(Color.Value(rawValue: i as! Int)!.label()["icon"] as! String)
        }
        return resolution
    }
    
}
