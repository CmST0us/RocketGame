//
//  RocketAttitudeJoyStick.swift
//  RocketGame
//
//  Created by CmST0us on 2018/5/4.
//  Copyright © 2018年 eric3u. All rights reserved.
//

import UIKit
import SnapKit

class RocketAttitudeJoyStick: RocketJoyStick {

    var upButton: UIButton!
    var leftButton: UIButton!
    var rightButton: UIButton!
    
    var isUpButtonDown: Bool {
        return self.upButton.state == .highlighted
    }
    
    var isLeftButtonDown: Bool {
        return self.leftButton.state == .highlighted
    }
    
    var isRightButtonDown: Bool {
        return self.rightButton.state == .highlighted
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        upButton = UIButton()
        upButton.setImage(#imageLiteral(resourceName: "joy_stick_up"), for: .normal)
        upButton.translatesAutoresizingMaskIntoConstraints = false
        
        leftButton = UIButton()
        leftButton.setImage(#imageLiteral(resourceName: "joy_stick_left"), for: .normal)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        
        rightButton = UIButton()
        rightButton.setImage(#imageLiteral(resourceName: "joy_stick_right"), for: .normal)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(upButton)
        self.addSubview(leftButton)
        self.addSubview(rightButton)
        
        upButton.snp.makeConstraints { (make) in
            make.width.equalTo(68)
            make.height.equalTo(68)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        leftButton.snp.makeConstraints { (make) in
            make.width.equalTo(68)
            make.height.equalTo(68)
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        rightButton.snp.makeConstraints { (make) in
            make.width.equalTo(68)
            make.height.equalTo(68)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
}
