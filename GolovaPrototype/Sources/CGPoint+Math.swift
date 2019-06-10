//
//  CGPoint+Math.swift
//  GolovaPrototype
//
//  Created by Yauheni Lychkouski on 6/10/19.
//  Copyright © 2019 Yauheni Lychkouski. All rights reserved.
//

import Foundation
import UIKit

extension CGPoint {
    static func +(_ a: CGPoint, _ b: CGPoint) -> CGPoint {
        return CGPoint(x: a.x + b.x, y: a.y + b.y)
    }
    
    static func -(_ a: CGPoint, _ b: CGPoint) -> CGPoint {
        return CGPoint(x: a.x - b.x, y: a.y - b.y)
    }
    
    static func /(_ a: CGPoint, _ b: CGFloat) -> CGPoint {
        return CGPoint(x: a.x / b, y: a.y / b)
    }
    
    static func *(_ a: CGPoint, _ b: CGFloat) -> CGPoint {
        return CGPoint(x: a.x * b, y: a.y * b)
    }
}
