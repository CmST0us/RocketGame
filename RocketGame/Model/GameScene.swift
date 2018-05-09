//
//  GameScene.swift
//  RocketGame
//
//  Created by CmST0us on 2018/5/9.
//  Copyright © 2018年 eric3u. All rights reserved.
//

import UIKit
import SpriteKit

class GameScene: SKScene {
    
    lazy var rocketAttitude: RocketAttitude = {
        let rocket = self.childNode(withName: "rocket")!
        let a = RocketAttitude()
        a.x = Double(rocket.position.x)
        a.y = Double(rocket.position.y)
        
        return a
    }()
    
    var attitudeJoyStickView: RocketAttitudeJoyStick!
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        // 等待初始化
        if attitudeJoyStickView != nil {
            gameLoop()
        }
        
    }
    
}


// MARK: - Game Loop
extension GameScene {
    private func checkJoyStickStateAndChangeAttitude() {
        if self.attitudeJoyStickView.isUpButtonDown {
            rocketAttitude.power = 0.1
        } else {
            rocketAttitude.power = 0
        }
        
        if self.attitudeJoyStickView.isLeftButtonDown {
            rocketAttitude.ta  = rad(CGFloat(5))
            return
        } else {
            rocketAttitude.ta = 0
        }
        
        if self.attitudeJoyStickView.isRightButtonDown {
            rocketAttitude.ta = -rad(CGFloat(5))
            return
        } else {
            rocketAttitude.ta = 0
        }
    }
    
    private func updateRocketAttitudeModel() {
        rocketAttitude.direction = rocketAttitude.direction + rocketAttitude.ta
        
        self.rocketAttitude.vx += rocketAttitude.power * sin(rocketAttitude.direction)
        self.rocketAttitude.vy += rocketAttitude.power * -cos(rocketAttitude.direction)
        
        self.rocketAttitude.x -= self.rocketAttitude.vx
        self.rocketAttitude.y -= self.rocketAttitude.vy
        
        
        if rocketAttitude.x > Double(self.size.width) {
            rocketAttitude.x = 0
        }
        
        if rocketAttitude.x < 0 {
            rocketAttitude.x = Double(self.size.width)
        }
        
        if rocketAttitude.y > Double(self.size.height) {
            rocketAttitude.y = 0
        }
        
        if rocketAttitude.y < 0 {
            rocketAttitude.y = Double(self.size.height)
        }
        
    }
    
    private func animateRocket() {
        
        if let rocketNode = self.childNode(withName: "rocket") {
            rocketNode.position = CGPoint(x: rocketAttitude.x, y: rocketAttitude.y)
            rocketNode.zRotation = CGFloat(rocketAttitude.direction)
        }
    }
    
    
    private func gameLoop() {
        checkJoyStickStateAndChangeAttitude()
        updateRocketAttitudeModel()
        animateRocket()
    }
}
