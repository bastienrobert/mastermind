//
//  Color.swift
//  mastermind
//
//  Created by Bastien Robert on 21/03/2018.
//  Copyright © 2018 Bastien Robert. All rights reserved.
//

import Foundation
import UIKit

class Color {
    enum Value: Int {
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
                while let _ = Value(rawValue: max) { max += 1 }
                return max
            }
        }
        
        static var values: [Value] {
            get {
                var response = [Value]()
                for i in 0..<Value.count {
                    response.append(Value(rawValue: i)!)
                }
                return response
            }
        }
    }
}
