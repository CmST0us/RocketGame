//
//  RocketAttitude.swift
//  RocketGame
//
//  Created by CmST0us on 2018/5/7.
//  Copyright © 2018年 eric3u. All rights reserved.
//

import UIKit

class RocketAttitude: NSObject {
    
    // 中心点x
    var x: Double = 0.0
    
    // 中心点y
    var y: Double = 0.0
    
    var width: Double = 0.0
    
    var height: Double = 0.0
    
    var direction: Double = 0.0
    
    // 飞船两个方向的速度
    var vx: Double = 0.0
    
    var vy: Double = 0.0
    
    // 油门
    var power: Double = 0.0
    
    // 飞船旋转弧度改变量
    var ta: Double = 0.0
    
}
