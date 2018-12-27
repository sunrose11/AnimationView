//
//  AnimationView.swift
//  Animation
//
//  Created by 信宝网络科技 on 2018/12/26.
//  Copyright © 2018 叶熙文. All rights reserved.
//

import UIKit

class AnimationView: UIView {

    private var bg : UIView!
    private var W = UIScreen.main.bounds.width / 375
    private var H = UIScreen.main.bounds.height / 667
    private var screenSize = UIScreen.main.bounds.size
    override init(frame: CGRect) {
        super.init(frame: frame)
        //获取window
        let rootVC = UIApplication.shared.delegate as! AppDelegate
        rootVC.window?.addSubview(self)
        self.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.35)
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap(tap:)))
        self.addGestureRecognizer(tapGesture)
        
        bg = UIView.init(frame: CGRect(x: (screenSize.width - 250*W)/2, y: 140*H, width: 250*W, height: 350*W))
        bg.layer.cornerRadius = 8
        bg.clipsToBounds = true
        bg.backgroundColor = UIColor(red: 30/255, green: 195/255, blue: 243/255, alpha: 1)
        self.addSubview(bg)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show(type:AnimationType){
        let model = AnimationModel()
        model.show(view: self, changeView: bg,type:type)
    }
    
    @objc func tap(tap: UITapGestureRecognizer) {
        self.removeFromSuperview()
    }
    
}
