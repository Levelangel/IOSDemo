//
//  ViewController.swift
//  ex1
//
//  Created by Albert Chen on 2018/1/3.
//  Copyright © 2018年 Albert Chen. All rights reserved.

//    let MARGIN_LEFT_AND_RIGHT : CGFloat = 20.0
//    let MARGIN_TOP : CGFloat = 60.0
//    let MARGIN_BOTTOM : CGFloat = 30.0
//
//    let SCREEN_WIDTH = UIScreen.main.bounds.width
//    let SCREEN_HEIGHT = UIScreen.main.bounds.height
//
//    let VIEW_CORNER_RADIUS : CGFloat = 10.0 //view圆角
//
//    let CHILD_VIEW_BORDER_COLOR : UIColor = UIColor(red: 0xE0/255, green: 0xE5/255, blue: 0xED/255, alpha: 1.0)
//    let CHILD_VIEW_BACKGROUND_COLOR : UIColor = UIColor(red: 0xFF/255, green: 0xFF/255, blue: 0xFF/255, alpha: 1.0)
//    let TITLE_FONT_COLOR : UIColor = UIColor(red: 0x4D/255, green: 0x57/255, blue: 0x64/255, alpha: 1.0)
//    let BUTTON_TITLE_COLOR : UIColor = UIColor(red: 0xAF/255, green: 0xAD/255, blue: 0xAD/255, alpha: 1.0)
//
//    let ANIMATION_DURATION : Double = 0.5
//
//    var btn_height : CGFloat!
//    var btn_width : CGFloat!
//
//    var viewContent : UIView!
//    var viewFront : UIView!
//
//    var labelFront : UILabel!
//    var labelBack : UILabel!
//    var btnKnow : UIButton!
//    var btnNotKnow : UIButton!
//    var btnNotSure : UIButton!
//
//    var isFront : Bool = true
//    var isLock : Bool = false
//    var isUp : Bool = false
//    var isLeft : Bool = false
//    var isRight : Bool = false
//
//    var animationFront : UIViewPropertyAnimator!
//    var animationBack : UIViewPropertyAnimator!
//    var animationUp : UIViewPropertyAnimator!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        btn_width = (SCREEN_WIDTH-MARGIN_LEFT_AND_RIGHT*2)/3.0
//        btn_height = 80.0
//
//        self.view.backgroundColor = UIColor(red: 0xF8/255, green: 0xF9/255, blue: 0xFA/255, alpha: 1.0)
//
//        viewContent = initContentSubview()
//        viewFront = initFrontSubview()
//        labelFront = initFrontLabel()
//        labelBack = initBackLabel()
//        btnKnow = initBtnKnow()
//        btnNotKnow = initBtnNotKnow()
//        btnNotSure = initBtnNotSure()
//        viewContent.addSubview(labelBack)
//        viewContent.addSubview(btnKnow)
//        viewContent.addSubview(btnNotKnow)
//        viewContent.addSubview(btnNotSure)
//        viewContent.layer.transform = CATransform3DMakeRotation(CGFloat(.pi*(3.5)), 0, -1, 0)
//        viewFront.addSubview(labelFront)
//        viewContent.isHidden = true
//        self.view.addSubview(viewContent)
//        self.view.addSubview(viewFront)
//
//        aniInit()
//    }
//
//    func initSubview() -> UIView{
//        let subview = UIView(frame: CGRect(x: MARGIN_LEFT_AND_RIGHT, y: MARGIN_TOP, width: SCREEN_WIDTH-MARGIN_LEFT_AND_RIGHT*2-2, height: SCREEN_HEIGHT-MARGIN_TOP-MARGIN_BOTTOM-2))
//        subview.layer.borderColor = CHILD_VIEW_BORDER_COLOR.cgColor
//        subview.layer.borderWidth = 0.5
//        subview.layer.cornerRadius = VIEW_CORNER_RADIUS
//        subview.layer.backgroundColor = CHILD_VIEW_BACKGROUND_COLOR.cgColor
//        subview.layer.shadowColor = UIColor(red: 0xE6/255, green: 0xE6/255, blue: 0xE6/255, alpha: 1.0).cgColor
//        subview.layer.shadowOffset = CGSize(width:6,height:6)
//        subview.layer.shadowOpacity = 0.4
//        subview.clipsToBounds = true
//        subview.isUserInteractionEnabled = true
//        return subview
//    }
//
//    func initFrontSubview() -> UIView {
//        let subview = initSubview()
//        subview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tagGesture)))
//        return subview
//    }
//
//    func initContentSubview() -> UIView{
//        let subview = initSubview()
//
//        subview.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(tagDrag)))
//        return subview
//    }
//
//    func initFrontLabel() -> UILabel {
//        let label : UILabel!
//        label = UILabel(frame: CGRect(x: MARGIN_LEFT_AND_RIGHT, y: 200, width: SCREEN_WIDTH-MARGIN_LEFT_AND_RIGHT*4, height: 100))
//        label.text = "汤姆米切尔提出的机器学习的定义"
//        label.font = UIFont.systemFont(ofSize: 26)
//        label.textColor = TITLE_FONT_COLOR
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        return label
//    }
//
//    func initBackLabel() -> UILabel {
//        let label : UILabel!
//        label = UILabel(frame: CGRect(x: MARGIN_LEFT_AND_RIGHT, y: 60, width: SCREEN_WIDTH-MARGIN_LEFT_AND_RIGHT*4, height: 100))
//        label.text = "汤姆米切尔提出的机器学习的定义"
//        label.font = UIFont.systemFont(ofSize: 26)
//        label.textColor = TITLE_FONT_COLOR
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        return label
//    }
//
//    func initBtnKnow() -> UIButton {
//        let button : UIButton!
//        button = UIButton(frame: CGRect(x: 0, y:viewContent.bounds.height-btn_height, width: btn_width, height: btn_height))
//        button.backgroundColor = UIColor(red: 0xF8/255, green: 0xF9/255, blue: 0xFA/255, alpha: 1.0)
//        button.setTitle("知道", for: .normal)
//        button.setTitleColor(BUTTON_TITLE_COLOR, for: .normal)
//        button.layer.borderWidth = 0.5
//        button.layer.borderColor = CHILD_VIEW_BORDER_COLOR.cgColor
//        button.addTarget(self, action: #selector(btnKnowClick), for: .touchUpInside)
//        return button
//    }
//
//    @objc func btnKnowClick(){
//        print("dddd")
//    }
//
//    func initBtnNotKnow() -> UIButton {
//        let button : UIButton!
//        button = UIButton(frame: CGRect(x: btn_width*2-1, y:viewContent.bounds.height-btn_height, width: btn_width, height: btn_height))
//        button.backgroundColor = UIColor(red: 0xF8/255, green: 0xF9/255, blue: 0xFA/255, alpha: 1.0)
//        button.setTitle("不知道", for: .normal)
//        button.setTitleColor(BUTTON_TITLE_COLOR, for: .normal)
//        button.layer.borderWidth = 0.5
//        button.layer.borderColor = CHILD_VIEW_BORDER_COLOR.cgColor
//        return button
//    }
//
//    func initBtnNotSure() -> UIButton {
//        let button : UIButton!
//        button = UIButton(frame: CGRect(x: btn_width-0.5, y:viewContent.bounds.height-btn_height, width: btn_width, height: btn_height))
//        button.backgroundColor = UIColor(red: 0xF8/255, green: 0xF9/255, blue: 0xFA/255, alpha: 1.0)
//        button.setTitle("不确定", for: .normal)
//        button.setTitleColor(BUTTON_TITLE_COLOR, for: .normal)
//        button.layer.borderWidth = 0.5
//        button.layer.borderColor = CHILD_VIEW_BORDER_COLOR.cgColor
//        return button
//    }
//
//    // View点击事件
//    @objc func tagGesture() {
//
//        animationFront.startAnimation()
//        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) {_ in
////            self.viewContent.subviews.map{ $0.removeFromSuperview()}
////            if self.isFront {
//            self.viewContent.isHidden = false
//            self.viewFront.isHidden = true
//            self.view.bringSubview(toFront: self.viewContent)
//////                self.viewContent.addSubview(self.labelBack)
//////                self.viewContent.addSubview(self.btnKnow)
//////                self.viewContent.addSubview(self.btnNotKnow)
//////                self.viewContent.addSubview(self.btnNotSure)
////            } else {
//////                self.viewContent.addSubview(self.labelFront)
////            }
////            self.isFront = !self.isFront
//            self.viewContent.layer.transform = CATransform3DMakeRotation(CGFloat(.pi*3.5), 0, -1, 0)
//
//            self.animationBack.startAnimation()
//            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) {_ in
//                self.viewFront.layer.transform = CATransform3DMakeRotation(CGFloat(.pi*4.0), 0, -1, 0)
//                self.viewFront.isHidden = false
//            }
//        }
//
//    }
//
//
//
//    //View 拖拽事件
//    @objc func tagDrag(sender: UIPanGestureRecognizer) {
////        if isFront {
////            return
////        }
//
//        let transition:CGPoint = sender.translation(in: viewContent)
//        checkLockAndDirection(transition)
//        switch sender.state {
//
//        case .changed:
//            if isLock {
//                if isUp && transition.y < 0 {
//                    viewContent.transform = CGAffineTransform(translationX: 0, y: transition.y)
//                }
//            }
//
//        case .ended:
//            break
//        default :
//            break
//
//        }
//    }
//
//    func checkLockAndDirection(_ transition : CGPoint){
//        let x = abs(transition.x)
//        let y = abs(transition.y)
//
//        if(x > 1 || y > 1){
//            isLock = true
//            if y > x*2 {
//                isUp = true
//            }
//        } else {
//            isLock = false
//        }
//    }

//    //初始化动画
//    func aniInit(){
//        animationFront = UIViewPropertyAnimator(duration: 0.1, curve: .easeIn, animations: {
//            self.viewFront.layer.transform = CATransform3DMakeRotation(CGFloat(.pi*0.5), 0, -1, 0)
//        })
//
//        animationBack = UIViewPropertyAnimator(duration: 0.1, curve: .easeOut, animations: {
//            self.viewContent.layer.transform = CATransform3DMakeRotation(CGFloat(.pi*4.0), 0, -1, 0)
//        })
//    }

import UIKit

class ViewController: UIViewController {
    //屏幕常数
    let LEFT_AND_RIGHT_MARGIN : CGFloat = 20.0 //左右边距
    let UP_MARGIN : CGFloat = 59.0 //上边距
    let BOTTOM_MARGIN : CGFloat = 30 //下边距
    let SCREEN_WIDTH = UIScreen.main.bounds.width //屏幕宽度
    let SCREEN_HEIGHT = UIScreen.main.bounds.height //屏幕高度
    //数值常数
    let THRESHOLD : Double = 150 //滑动阈值
    let LOCK_THRESHOLD : Double = 1 //手势锁定阈值
    let DURATION :Double = 0.5 //动画播放速度
    //字符串常数
    let MSG_FRONT = "汤姆米切尔提出的机器学习的定义" //卡片前面文本
    let MSG_BACK = "汤姆米切尔提出的机器学习的定义" //卡片后面文本
    let KNOW = "知道" //按钮——知道
    let NOT_SURE = "不确定" //按钮——不确定
    let NOT_KNOW = "不知道" //按钮——不知道
    //颜色常数
    let VIEW_BACKGROUND_COLOR : UIColor = #colorLiteral(red: 0.9725001454, green: 0.9764924645, blue: 0.9841788411, alpha: 1)//页面背景色
    let LEFT_BTN_COLOR : UIColor = #colorLiteral(red: 0.2901960784, green: 0.5647058824, blue: 0.8862745098, alpha: 1)//左边 知道 按钮
    let MIDDLE_BTN_COLOR : UIColor = #colorLiteral(red: 0.8509803922, green: 0.8745098039, blue: 0.8980392157, alpha: 1)//中间 不确定 按钮
    let RIGHT_BTN_COLOR : UIColor = #colorLiteral(red: 1, green: 0.7333333333, blue: 0.3176470588, alpha: 1)//右边 不知道 按钮
    
    var width : CGFloat!
    var height : CGFloat!
    var btnHeight : CGFloat!
    var subWidth : CGFloat!
    
    var lblFront : UILabel!
    var lblBack : UILabel!
    var btn_know : UIButton! = UIButton()
    var btn_notSure : UIButton! = UIButton()
    var btn_notKnow : UIButton! = UIButton()
    
    var lock : Bool!
    var isUp : Bool!
    var isFront : Bool!
    
    var childView : UIView!
    //动作
    var aniTapGesture, aniNewViewGesture, aniAddNewView, aniShowNewView : UIViewPropertyAnimator!
    var aniLeftGesture, aniRightGesture, aniUpGesture : UIViewPropertyAnimator!
    var aniSlideToLeft, aniSlideToUp, aniSlideToRight : UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //初始化宽高、界面
        width = SCREEN_WIDTH - self.LEFT_AND_RIGHT_MARGIN * 2
        height = SCREEN_HEIGHT - UP_MARGIN - BOTTOM_MARGIN
        btnHeight = 72
        subWidth = width / 3
        
        //前面的label
        lblFront = lblMaker(message: MSG_FRONT, width: width, height: height)
        
        //后面的label
        lblBack = lblMaker(message: MSG_BACK, width: width, height: height - btnHeight)
        
        //后面下排的按钮
        btn_know.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(aniLeft)))
        btn_notSure.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(aniUp)))
        btn_notKnow.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(aniRight)))
        btnInit()
        
        lockInit()
        
        childView = subViewInit()
        showNewView()
        
        view.backgroundColor = VIEW_BACKGROUND_COLOR
    }
    
    func subViewInit() -> UIView {
        let subView = UIView(frame: CGRect(x: LEFT_AND_RIGHT_MARGIN, y: UP_MARGIN, width: width, height: height))
        subView.isUserInteractionEnabled = true
        subView.backgroundColor = UIColor.white
        subView.addSubview(lblFront)
        subView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapView)))
        subView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(swipe)))
        subView.alpha = 0
        view.addSubview(subView)
        isFront = true
        return subView
    }
    
    //新的动作函数
    @objc func aniLeft(gesture: UITapGestureRecognizer) {
        aniLeftGesture.startAnimation()
        aniSlideToLeft.startAnimation()
    }
    @objc func aniRight(gesture: UITapGestureRecognizer) {
        aniRightGesture.startAnimation()
        aniSlideToRight.startAnimation()
    }
    @objc func aniUp(gesture: UITapGestureRecognizer) {
        aniUpGesture.startAnimation()
        aniSlideToUp.startAnimation()
    }
    @objc func tapView(gesture: UITapGestureRecognizer) {
        aniTapGesture.startAnimation()
    }
    
    //手势控制
    @objc func swipe(sender: UIPanGestureRecognizer) {
        if isFront {return}
        let translation : CGPoint = sender.translation(in: childView)
        let delta_x : Double = Double(translation.x)
        let delta_y : Double = Double(translation.y)
        
        var pre : Double!
        
        if !lock {
            checkLock(delta_x: abs(delta_x), delta_y: abs(delta_y))
        }
        if isUp {
            if delta_y < 0 {
                let temp = abs(delta_y) / Double(self.SCREEN_HEIGHT) * 5
                pre = temp > 1.0 ? 1.0 : temp
                childView.transform = CGAffineTransform(translationX: 0, y: translation.y)
                aniUpGesture.fractionComplete = CGFloat(pre)
            }
        } else {
            childView.transform = CGAffineTransform(translationX: translation.x, y: getY(x: delta_x))
            let temp = abs(delta_x) / Double(self.SCREEN_WIDTH) * 5
            pre = temp > 1.0 ? 1.0 : temp
            if delta_x > 0 {
                aniRightGesture.fractionComplete = CGFloat(pre)
            } else {
                aniLeftGesture.fractionComplete = CGFloat(pre)
            }
        }
        if sender.state == UIGestureRecognizerState.ended {
            if isUp && abs(delta_y) > THRESHOLD {
                aniSlideToUp.startAnimation()
            } else if abs(delta_x) > THRESHOLD {
                if delta_x > 0 {
                    aniSlideToRight.startAnimation()
                } else {
                    aniSlideToLeft.startAnimation()
                }
            } else {
                childView.transform = CGAffineTransform(translationX: 0, y: 0)
            }
            aniUpGesture.stopAnimation(true)
            aniLeftGesture.stopAnimation(true)
            aniRightGesture.stopAnimation(true)
            lockInit()
            btnInit()
        }
    }
    
    func btnInit() {
        btnSharp(btn: btn_know, title: KNOW, x: 0)
        btnSharp(btn: btn_notSure, title: NOT_SURE, x: subWidth)
        btnSharp(btn: btn_notKnow, title: NOT_KNOW, x: subWidth * 2)
        aniInit()
    }
    
    func btnSharp(btn: UIButton, title : String, x: CGFloat) {
        btn.frame = CGRect(x: x, y: height - btnHeight, width: subWidth, height: btnHeight)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.alpha = 0.5
        btn.isUserInteractionEnabled = true
        btn.backgroundColor = UIColor.white
    }
    
    func checkLock(delta_x: Double,delta_y: Double){
        if delta_x > LOCK_THRESHOLD || delta_y > LOCK_THRESHOLD {
            lock = true
            if delta_x * 2 < delta_y {
                isUp = true
            }else{
                isUp = false
            }
        }
    }
    
    func lockInit() {
        lock = false
        isUp = false
    }
    
    func aniInit() {
        aniTapGesture = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut, animations: {
            //页面翻转
            if !self.isFront {return}
            UIView.setAnimationCurve(UIViewAnimationCurve.easeInOut)
            UIView.setAnimationTransition(UIViewAnimationTransition.flipFromRight, for: self.childView, cache: true)
            self.childView.subviews.map({$0.removeFromSuperview()})
            self.btnInit()
            self.childView.addSubview(self.lblBack)
            self.childView.addSubview(self.btn_know)
            self.childView.addSubview(self.btn_notSure)
            self.childView.addSubview(self.btn_notKnow)
            self.isFront = false
        })
        
        aniLeftGesture = UIViewPropertyAnimator(duration: DURATION, curve: .easeInOut, animations: {
            //左滑
            UIView.animate(withDuration: 2, animations: {
                self.btn_know.frame = CGRect(x: 0, y: self.height - self.btnHeight, width: self.width, height: self.btnHeight)
                self.btn_know.alpha = 1
                self.btn_know.backgroundColor = self.LEFT_BTN_COLOR
                self.btn_notSure.alpha = 0
                self.btn_notKnow.alpha = 0
            })
        })
        aniRightGesture = UIViewPropertyAnimator(duration: DURATION, curve: .easeInOut, animations: {
            //右滑
            self.btn_notKnow.frame = CGRect(x: 0, y: self.height - self.btnHeight, width: self.width, height: self.btnHeight)
            self.btn_notKnow.alpha = 1
            self.btn_notKnow.backgroundColor = self.MIDDLE_BTN_COLOR
            self.btn_know.alpha = 0
            self.btn_notSure.alpha = 0
        })
        
        aniUpGesture = UIViewPropertyAnimator(duration: DURATION, curve: .linear, animations: {
            //上滑
            self.btn_notSure.frame = CGRect(x: 0, y: self.height - self.btnHeight, width: self.width, height: self.btnHeight)
            self.btn_notSure.alpha = 1
            self.btn_notSure.backgroundColor = self.RIGHT_BTN_COLOR
            self.btn_know.alpha = 0
            self.btn_notKnow.alpha = 0
        })
        
        aniSlideToRight = UIViewPropertyAnimator(duration: DURATION, curve: .easeInOut, animations: {
            //滑向右边
            self.childView.transform = CGAffineTransform(translationX: self.SCREEN_WIDTH, y: self.getY(x: Double(self.SCREEN_WIDTH)))
            self.aniAddNewView.startAnimation(afterDelay: self.DURATION)
            self.aniShowNewView.startAnimation(afterDelay: self.DURATION)
        })
        
        aniSlideToUp = UIViewPropertyAnimator(duration: DURATION, curve: .easeInOut, animations: {
            //滑向上
            self.childView.transform = CGAffineTransform(translationX: 0, y: -self.SCREEN_HEIGHT)
            self.aniAddNewView.startAnimation(afterDelay: self.DURATION)
            self.aniShowNewView.startAnimation(afterDelay: self.DURATION)
        })
        
        aniSlideToLeft = UIViewPropertyAnimator(duration: DURATION, curve: .easeInOut, animations: {
            //滑向左边
            self.childView.transform = CGAffineTransform(translationX: -self.SCREEN_WIDTH, y: self.getY(x: Double(self.SCREEN_WIDTH)))
            self.aniAddNewView.startAnimation(afterDelay: self.DURATION)
            self.aniShowNewView.startAnimation(afterDelay: self.DURATION)
        })
        
        aniAddNewView = UIViewPropertyAnimator(duration: DURATION, curve: .linear, animations: {
            self.childView = self.subViewInit()
        })
        
        aniShowNewView = UIViewPropertyAnimator(duration: DURATION, curve: .linear, animations: {
            self.showNewView()
        })
    }
    
    func showNewView() {
        self.childView.alpha = 1
    }
    
    fileprivate func  getY(x: Double) -> CGFloat {
        let temp : Double = Double(width)
        return CGFloat(sqrt(pow(7.21 * temp, 2) - x * x) - 7.12 * temp) - BOTTOM_MARGIN
    }
    
    fileprivate func lblMaker(message: String, width: CGFloat, height: CGFloat) -> UILabel {
        //建立一个label
        let lblTemp = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height))
        lblTemp.text = message
        lblTemp.backgroundColor = UIColor.white
        return lblTemp
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
