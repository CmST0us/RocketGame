//
//  Utils.swift
//  RocketGame
//
//  Created by CmST0us on 2018/5/7.
//  Copyright © 2018年 eric3u. All rights reserved.
//

import Foundation
import UIKit

func rad(_ degree: CGFloat) -> Double {
    return Double.pi / 180.0 * Double(degree)
}

func rad(_ degree: CGFloat) -> CGFloat {
    return CGFloat(Double.pi / 180.0) * degree
}

func degree(_ rad: CGFloat) -> CGFloat {
    return CGFloat(180.0 / Double.pi) * rad
}

func animate(_ dur: TimeInterval = 0.25, _ block: () -> Void) {
    CATransaction.begin()
    CATransaction.setAnimationDuration(dur)
    block()
    CATransaction.commit()
}
