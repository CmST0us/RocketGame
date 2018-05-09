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
    private let kFps = 144.0
    
    private var lastRenderTime: TimeInterval = 0
    
    private var skView: SKView {
        return self.view as! SKView
    }

    private var attitudeJoyStickView: RocketAttitudeJoyStick!
    
    private var rocketAttitude = RocketAttitude()
    
    
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

// MARK: - Life Cycle Method
extension GamePadViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAttitudeJoyStickView()
        
        self.skView.showsFPS = true
        self.skView.showsFields = true
        
        // 如果设置了Delegate就把游戏逻辑移交给了ViewController
        // self.skView.scene?.delegate = self
        
        self.skView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let secne = self.skView.scene as? GameScene {
            secne.attitudeJoyStickView = self.attitudeJoyStickView
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: - StoryBoard Method
extension GamePadViewController {
    
}

// MARK: - SKSceneDelegate
extension GamePadViewController: SKSceneDelegate {
    func update(_ currentTime: TimeInterval, for scene: SKScene) {
        
    }
}


// MARK: - SKViewDelegate
extension GamePadViewController: SKViewDelegate {
    func view(_ view: SKView, shouldRenderAtTime time: TimeInterval) -> Bool {
        if time - lastRenderTime >= 1 / kFps {
            lastRenderTime = time
            return true
        }
        return false
    }
}
