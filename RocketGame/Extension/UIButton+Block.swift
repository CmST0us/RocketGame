//
//  UIButton+Block.swift
//  RocketGame
//
//  Created by CmST0us on 2018/5/7.
//  Copyright © 2018年 eric3u. All rights reserved.
//

import Foundation
import UIKit

fileprivate struct UIButtonRunTimeKey {
    static var addBlock = "UIButtonRunTimeKey.addBlock"
}

extension UIButton {
    func addAction(for event: UIControlEvents, _ block: (_ button: UIButton) -> Void) {
        objc_setAssociatedObject(self, &UIButtonRunTimeKey.addBlock, block, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        self.addTarget(self, action: #selector(blockAction), for: event)
    }
    
    @objc
    private func blockAction() {
        if let block = objc_getAssociatedObject(self, &UIButtonRunTimeKey.addBlock) as? ((_ button: UIButton) -> Void) {
            block(self)
        }
    }
}
