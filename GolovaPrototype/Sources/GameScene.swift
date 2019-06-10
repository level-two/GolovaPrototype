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
        headPartUpper = .init(imageNamed: "headPartUpper")
        headPartLower = .init(imageNamed: "headPartLower")
        
        headPartUpper.anchorPoint = .init(x: 0.5, y: 0.0)
        headPartLower.anchorPoint = .init(x: 0.5, y: 1.0)
        
        head = .init()
        
        head.addChild(headPartUpper)
        head.addChild(headPartLower)
        
        self.addChild(head)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let locations = event?.allTouches?.map({ $0.location(in: self) }) else { return }
        
        let touchedNodes = locations.map { self.nodes(at: $0) }.reduce([], +)
        
        guard
            locations.count == 2,
            touchedNodes.contains(headPartUpper),
            touchedNodes.contains(headPartLower)
        else {
            isHeadTouched = false
            return
        }
        
        isHeadTouched = true
        
        centerDelta = head.position - locations.reduce(CGPoint.zero, +)/CGFloat(touches.count)
        
        let distancePoint = locations[0] - locations[1]

        distanceDelta =
            (headPartUpper.position.y - headPartLower.position.y) -
            sqrt(distancePoint.x*distancePoint.x + distancePoint.y*distancePoint.y)
        
        angleDelta = head.zRotation - atan2(locations[0].y - locations[1].y, locations[0].x - locations[1].x)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isHeadTouched else { return }
        guard let locations = event?.allTouches?.map({ $0.location(in: self) }) else { return }
        
        let center = centerDelta + locations.reduce(CGPoint.zero, +)/CGFloat(touches.count)
        head.position = center
        
        let distancePoint = locations[0] - locations[1]
        let distance = distanceDelta + sqrt(distancePoint.x*distancePoint.x + distancePoint.y*distancePoint.y)
        if distance >= 0 {
            headPartUpper.position = .init(x: 0, y: distance/2)
            headPartLower.position = .init(x: 0, y: -distance/2)
        } else {
            headPartUpper.position = .zero
            headPartLower.position = .zero
        }
        
        let angle = angleDelta + atan2(locations[0].y - locations[1].y, locations[0].x - locations[1].x)
        head.zRotation = angle
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    var headPartUpper: SKSpriteNode!
    var headPartLower: SKSpriteNode!
    var head: SKNode!
    
    var isHeadTouched = false
    var centerDelta: CGPoint = .zero
    var angleDelta: CGFloat = 0.0
    var distanceDelta: CGFloat = 0.0
}
