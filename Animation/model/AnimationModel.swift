//
//  AnimationModel.swift
//  Animation
//
//  Created by 信宝网络科技 on 2018/12/26.
//  Copyright © 2018 叶熙文. All rights reserved.
//

import UIKit

enum AnimationType {
    case animationZoom
    case topToCenterSpring
    case downToCenterSpring
    case leftToCenterSpring
    case rightToCenterSpring
}

class AnimationModel: NSObject {
    
    private var screenSize = UIScreen.main.bounds.size
    
    //view:底层的 changeView:需要动画的view type:动画样式
    func show(view:UIView,changeView:UIView,type:AnimationType){
        switch type {
        case .animationZoom:
            changeView.layer.setValue(0, forKey: "transform.scale")
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                changeView.layer.position = view.center
                changeView.layer.setValue(1.0, forKey: "transform.scale")
            }, completion: nil)
            break
        case .topToCenterSpring:
            changeView.layer.position = CGPoint.init(x: view.center.x, y: -changeView.frame.size.height)
            UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                changeView.layer.position = view.center
            }, completion: nil)
            break
        case .downToCenterSpring:
            changeView.layer.position = CGPoint.init(x: view.center.x, y: screenSize.height)
            UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                changeView.layer.position = view.center
            }, completion: nil)
            break
        case .leftToCenterSpring:
            changeView.layer.position = CGPoint.init(x: -250, y: view.center.y)
            UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                changeView.layer.position = view.center
            }, completion: nil)
            break
        case .rightToCenterSpring:
            changeView.layer.position = CGPoint.init(x: screenSize.width+250, y: view.center.y)
            UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                changeView.layer.position = view.center
            }, completion: nil)
            break
        default:
            break
        }
    }
    
}
