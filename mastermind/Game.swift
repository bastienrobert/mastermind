//
//  Game.swift
//  mastermind
//
//  Created by Bastien Robert on 20/03/2018.
//  Copyright © 2018 Bastien Robert. All rights reserved.
//

import Foundation

class Game {
    
    var timer : Int = 0
    init() {
        self.startTimer()
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
    
}
