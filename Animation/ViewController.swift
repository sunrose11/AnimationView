//
//  ViewController.swift
//  Animation
//
//  Created by 信宝网络科技 on 2018/12/26.
//  Copyright © 2018 叶熙文. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var screenSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let arr = ["动画1","动画2","动画3","动画4","动画5"]
        for (i,name) in arr.enumerated(){
            let btn = UIButton.init(frame: CGRect(x: 100, y: 100+50*i, width: 100, height: 30))
            btn.backgroundColor = UIColor.brown
            btn.setTitle(name, for: .normal)
            view.addSubview(btn)
            btn.tag = i+100
            btn.addTarget(self, action: #selector(actionBtn(btn:)), for: .touchUpInside)
        }
    }
    
    @objc func actionBtn(btn:UIButton){
        let animationArr = [AnimationType.animationZoom,
                            AnimationType.topToCenterSpring,
                            AnimationType.downToCenterSpring,
                            AnimationType.leftToCenterSpring,
                            AnimationType.rightToCenterSpring]
        let showView = AnimationView.init(frame:CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        showView.show(type:animationArr[btn.tag-100])
        view.addSubview(showView)
    }

}

