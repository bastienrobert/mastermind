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
    
    var timer: Int = 0
    var row: Int = 0
    var solution: [Int] = []
    var cache: [[Int]] = []
    var results: [[Bool?]] = []
    
    init() {
        self.startTimer()
        self.solution = self.createCombination()
        print(self.resolveCombination(entry: self.solution))
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
    
    func resolveCombination(entry: Array<Int>) -> Array<String> {
        var resolution: Array<String> = []
        for i in entry {
            resolution.append(Color.Value(rawValue: i)!.label()["icon"] as! String)
        }
        return resolution
    }
    
    func check() {
        if (self.row >= 9) {
            self.endGame()
        } else {
            self.engine()
            let isAllTrue = self.results[row].index(where: { $0 == false || $0 == nil }) == nil
            isAllTrue == true ? self.youWin() : nil
        }
    }
    
    func engine() {
        var result: [Bool?] = []
        var entry = self.cache[self.row]
        var solution = self.solution as Array<Int>
        
        for i in 0..<solution.count where solution[i] == entry[i] {
            result.append(true)
            solution[i] = -1
            entry[i] = -1
        }
        
        for i in 0..<solution.count {
            for j in 0..<entry.count where solution[i] == entry[j] && solution[i] != -1 {
                result.append(false)
                solution[i] = -1
                entry[j] = -1
            }
        }
        
        for _ in result.count..<4 {
            result.append(nil)
        }
        
        self.results.append(result)
    }
    
    func removeFromCache(id: Int) {
        return self.cache[self.row].removeSubrange(id..<self.cache.count)
    }
    
    func endRow() {
        self.row += 1
    }
    
    func endGame() {
        print("PERDU")
    }
    
    func youWin() {
        print("GAGNÉ")
    }
    
}
