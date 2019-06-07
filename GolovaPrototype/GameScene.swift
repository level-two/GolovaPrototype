//
//  GameScene.swift
//  GolovaPrototype
//
//  Created by Yauheni Lychkouski on 6/7/19.
//  Copyright © 2019 Yauheni Lychkouski. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
        
        // Create shape node to use during mouse interaction
//        let w = (self.size.width + self.size.height) * 0.05
//        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
//        if let spinnyNode = self.spinnyNode {
//            spinnyNode.lineWidth = 2.5
//
//            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                              SKAction.fadeOut(withDuration: 0.5),
//                                              SKAction.removeFromParent()]))
//        }
        
        headPartUpper = .init(imageNamed: "headPartUpper")
        headPartLower = .init(imageNamed: "headPartLower")
        
        headPartUpper.anchorPoint = .init(x: 0.5, y: 0.0)
        headPartLower.anchorPoint = .init(x: 0.5, y: 1.0)
        
        self.addChild(headPartUpper)
        self.addChild(headPartLower)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
//
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        
//        touches
//            .filter { $0.location(in: self.view).fallsIn(head.frame) }
//            .forEach { $0. }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
        
        let locations = touches.map { $0.location(in: self) }
        let center = locations.reduce(CGPoint.zero, +)/CGFloat(touches.count)
        let gap = locations.max { $0.y > $1.y }!.y - locations.min { $0.y > $1.y }!.y
        
        let rightmost = locations.max { $0.x > $1.x }!
        let leftmost = locations.min { $0.x > $1.x }!
        
        let angle = atan2(leftmost.y - rightmost.y, leftmost.x - rightmost.x)
        
        headPartUpper.position = center + .init(x: 0, y: -gap/2)
        headPartLower.position = center + .init(x: 0, y:  gap/2)
        
        headPartUpper.zRotation = angle
        headPartLower.zRotation = angle
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    var headPartUpper: SKSpriteNode!
    var headPartLower: SKSpriteNode!
    var defaultHeadSize: CGSize = .zero
}

/*
extension GameScene {
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
}
 */

//extension CGPoint {
//    func fallsIn(_ rect: CGRect) -> Bool {
//        return
//            self.x >= rect.minX &&
//            self.x <= rect.maxX &&
//            self.y >= rect.minY &&
//            self.y <= rect.maxY
//    }
//}

extension CGPoint {
    static func +(_ a: CGPoint, _ b: CGPoint) -> CGPoint {
        return CGPoint(x: a.x + b.x, y: a.y + b.y)
    }
    
    static func /(_ a: CGPoint, _ b: CGFloat) -> CGPoint {
        return CGPoint(x: a.x / b, y: a.y / b)
    }
}
