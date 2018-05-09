//
//  GamePadViewController.swift
//  RocketGame
//
//  Created by CmST0us on 2018/5/7.
//  Copyright © 2018年 eric3u. All rights reserved.
//

import UIKit
import SpriteKit

class GamePadViewController: UIViewController {
    
    // MARK: Public Member
    
    // MARK: Private Member
    private let kFps = 30.0
    private var spriteView: SKView {
        return self.view as! SKView
    }
    private var attitudeJoyStickView: RocketAttitudeJoyStick!
    
    private var rocketAttitude = RocketAttitude()
    
    private var gameLoopTimer: Timer!
    
    private lazy var rocketView: UIImageView = {
        let v = UIImageView(frame: CGRect(x: 0, y: 0, width: 58, height: 52))
        v.image = #imageLiteral(resourceName: "rocket")
        self.view.addSubview(v)
        return v
    }()
    
    // MARK: Public Method
    
    
    
    // MARK: Private Method
    
}


// MARK: - Game UI Setup
extension GamePadViewController {
    func setupAttitudeJoyStickView() {
        self.attitudeJoyStickView = RocketAttitudeJoyStick()
        self.attitudeJoyStickView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.attitudeJoyStickView)
        
        self.attitudeJoyStickView.snp.makeConstraints { (make) in
            make.width.equalTo(162)
            make.height.equalTo(157)
            make.left.equalToSuperview().offset(60)
            make.bottom.equalToSuperview().offset(-60)
        }
        
    }
}

// MARK: - GameLoop
extension GamePadViewController {
    
    private func checkJoyStickStateAndChangeAttitude() {
        if self.attitudeJoyStickView.isUpButtonDown {
            rocketAttitude.power = 0.1
        } else {
            rocketAttitude.power = 0
        }
        
        if self.attitudeJoyStickView.isLeftButtonDown {
            rocketAttitude.ta = -rad(CGFloat(5))
            return
        } else {
            rocketAttitude.ta = 0
        }
        
        if self.attitudeJoyStickView.isRightButtonDown {
            rocketAttitude.ta = rad(CGFloat(5))
            return
        } else {
            rocketAttitude.ta = 0
        }
    }
    
    private func updateRocketAttitudeModel() {
        rocketAttitude.direction = rocketAttitude.direction + rocketAttitude.ta
        
        self.rocketAttitude.vx += rocketAttitude.power * sin(rocketAttitude.direction)
        self.rocketAttitude.vy += rocketAttitude.power * -cos(rocketAttitude.direction)
        
        self.rocketAttitude.x += self.rocketAttitude.vx
        self.rocketAttitude.y += self.rocketAttitude.vy
        
        
        if rocketAttitude.x > Double(self.view.frame.size.width) {
            rocketAttitude.x = 0
        }
        
        if rocketAttitude.x < 0 {
            rocketAttitude.x = Double(self.view.frame.size.width)
        }
        
        if rocketAttitude.y > Double(self.view.frame.size.height) {
            rocketAttitude.y = 0
        }
        
        if rocketAttitude.y < 0 {
            rocketAttitude.y = Double(self.view.frame.size.height)
        }
        
    }
    
    private func animateRocket() {
        animate(0.1) {
            rocketView.layer.position = CGPoint(x: rocketAttitude.x, y: rocketAttitude.y)
            rocketView.layer.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(rocketAttitude.direction)))
        }
    }
    
    
    private func gameLoop() {
        checkJoyStickStateAndChangeAttitude()
        updateRocketAttitudeModel()
        animateRocket()
    }
    
}
// MARK: - Life Cycle Method
extension GamePadViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAttitudeJoyStickView()
        // 60 fps
        self.gameLoopTimer = Timer.scheduledTimer(withTimeInterval: 1.0 / kFps, repeats: true, block: { [weak self] (timer) in
            self?.gameLoop()
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: - StoryBoard Method
extension GamePadViewController {
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

