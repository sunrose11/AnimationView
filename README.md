＃弹窗抖动效果
！[你的小可爱已上线（http://upload-images.jianshu.io/upload_images/7882691-886183f3a8e30c93.GIF?imageMogr2/auto-orient/strip）
>效果弹窗不想弹出那么单调，我们可以进行一些小的动画效果，让页面更加鲜活

动画效果中我选择用的是`UIView`动画，弹性动画方法`animateWithDuration: delay: usingSpringWithDamping: initialSpringVelocity: options: animations`实现页面抖动效果，设定`view`初始位置和动画过程位置完成出场动画和结束动画效果，当`usingSpringWithDamping`的范围为0.0f到1.0f，数值越小「弹簧」的振动效果越明显,`initialSpringVelocity`则表示初始的速度，数值越大一开始移动越快，就是形变的速度，从视觉上看可以理解弹簧的形变速度，到动画结束，该速度减为0。
>我把他们写成一个demo的类可以在需要时候调用
```
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

```
>***需要的人可以直接copy走吧！记得帮我点点❤ 爱你哟!***
外加git地址:https://github.com/sunrose11/AnimationView

![](http://upload-images.jianshu.io/upload_images/7882691-ca45d1830b9b562a.gif?imageMogr2/auto-orient/strip)
