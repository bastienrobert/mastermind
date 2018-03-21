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
    
    enum Color: Int {
        case strawberry = 0, banana = 1, perry = 2, orange = 3, peach = 4, grape = 5
        
        func label() -> [String: Any] {
            switch self {
            case .strawberry:
                return [
                    "icon": "🍓",
                    "backgroundColor": UIColor(red:0.98, green:0.92, blue:0.92, alpha:1.0),
                    "borderColor": UIColor(red:0.96, green:0.85, blue:0.84, alpha:1.0).cgColor
                ]
            case .banana:
                return [
                    "icon": "🍌",
                    "backgroundColor": UIColor(red:1.00, green:0.99, blue:0.91, alpha:1.0),
                    "borderColor": UIColor(red:0.99, green:0.98, blue:0.83, alpha:1.0).cgColor
                ]
            case .perry:
                return [
                    "icon": "🍐",
                    "backgroundColor": UIColor(red:0.95, green:0.98, blue:0.91, alpha:1.0),
                    "borderColor": UIColor(red:0.90, green:0.96, blue:0.83, alpha:1.0).cgColor
                ]
            case .orange:
                return [
                    "icon": "🍊",
                    "backgroundColor": UIColor(red:1.00, green:0.96, blue:0.91, alpha:1.0),
                    "borderColor": UIColor(red:0.99, green:0.93, blue:0.84, alpha:1.0).cgColor
                ]
            case .peach:
                return [
                    "icon": "🍑",
                    "backgroundColor": UIColor(red:0.98, green:0.95, blue:0.94, alpha:1.0),
                    "borderColor": UIColor(red:0.97, green:0.91, blue:0.88, alpha:1.0).cgColor
                ]
            case .grape:
                return [
                    "icon": "🍇",
                    "backgroundColor": UIColor(red:0.98, green:0.95, blue:0.98, alpha:1.0),
                    "borderColor": UIColor(red:0.96, green:0.91, blue:0.96, alpha:1.0).cgColor
                ]
            }
        }
        
        static var count: Int {
            get {
                var max: Int = 0
                while let _ = Color(rawValue: max) { max += 1 }
                return max
            }
        }
        
        static var values: [Color] {
            get {
                var response = [Color]()
                for i in 0..<Color.count {
                    response.append(Color(rawValue: i)!)
                }
                return response
            }
        }
    }
    
    init() {
        self.startTimer()
        self.solution = self.createCombination()
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
    
    func createCombination() -> Array<Any> {
        var combination: Array<Any> = []
        var random : Int
        for _ in 0..<4 {
            random = Int(arc4random_uniform(UInt32(Color.count)))
            combination.append(Color(rawValue: random)!.label() as Any)
        }
        return combination
    }
    
}
