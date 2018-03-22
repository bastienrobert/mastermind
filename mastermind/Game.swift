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
    var rows: Int = 0
    var solution: Array<Int> = []
    var cache: Array<Int> = []
    
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
    
    func check(entry: Array<Int>) {
        if (self.solution == entry) {
            print("GAGNÉ")
        } else if (self.rows >= 10) {
            self.endGame()
        } else {
            let checker = self.engine(entry: entry)
            print(checker)
        }
    }
    
    func engine(entry: Array<Int>) -> [String: Int] {
        var ok = 0
        var nok = 0
        var entry = entry as Array<Int?>
        var solution = self.solution as Array<Int?>
        
        for i in 0..<solution.count where solution[i] == entry[i] {
            ok += 1
            solution[i] = nil
            entry[i] = nil
        }
        
        for i in 0..<solution.count {
            for j in 0..<entry.count where solution[i] == entry[j] && solution[i] != nil {
                nok += 1
                solution[i] = nil
                entry[j] = nil
            }
        }
        
        return ["ok": ok, "nok": nok]
    }
    
    func removeFromCache(id: Int) {
        return self.cache.removeSubrange(id..<self.cache.count)
    }
    
    func endRow() {
        self.cache = []
        self.rows += 1
    }
    
    func endGame() {
        print("PERDU")
    }
    
}
