//
//  ViewController.swift
//  ex1
//
//  Created by Albert Chen on 2018/1/3.
//  Copyright © 2018年 Albert Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let MARGIN_LEFT_AND_RIGHT : CGFloat = 20.0
    let MARGIN_TOP : CGFloat = 60.0
    let MARGIN_BOTTOM : CGFloat = 30.0
    
    let SCREEN_WIDTH = UIScreen.main.bounds.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.height
    
    let VIEW_CORNER_RADIUS : CGFloat = 10.0 //view圆角
    
    let CHILD_VIEW_BORDER_COLOR : UIColor = UIColor(red: 0xE0/255, green: 0xE5/255, blue: 0xED/255, alpha: 1.0)
    let CHILD_VIEW_BACKGROUND_COLOR : UIColor = UIColor(red: 0xFF/255, green: 0xFF/255, blue: 0xFF/255, alpha: 1.0)
    let TITLE_FONT_COLOR : UIColor = UIColor(red: 0x4D/255, green: 0x57/255, blue: 0x64/255, alpha: 1.0)
    let BUTTON_TITLE_COLOR : UIColor = UIColor(red: 0xAF/255, green: 0xAD/255, blue: 0xAD/255, alpha: 1.0)
    
    let ANIMATION_DURATION : Double = 0.5
    
    var btn_height : CGFloat!
    var btn_width : CGFloat!
    
    var viewContent : UIView!
    var viewFront : UIView!
    
    var labelFront : UILabel!
    var labelBack : UILabel!
    var btnKnow : UIButton!
    var btnNotKnow : UIButton!
    var btnNotSure : UIButton!

    var isFront : Bool = true
    var isLock : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btn_width = (SCREEN_WIDTH-MARGIN_LEFT_AND_RIGHT*2)/3.0
        btn_height = 80.0
        
        self.view.backgroundColor = UIColor(red: 0xF8/255, green: 0xF9/255, blue: 0xFA/255, alpha: 1.0)
        
        viewContent = initSubview()
        labelFront = initFrontLabel()
        labelBack = initBackLabel()
        btnKnow = initBtnKnow()
        btnNotKnow = initBtnNotKnow()
        btnNotSure = initBtnNotSure()
        viewContent.addSubview(labelFront)
        self.view.addSubview(viewContent)
        
        
    }
    
    func initSubview() -> UIView {
        let subview = UIView(frame: CGRect(x: MARGIN_LEFT_AND_RIGHT, y: MARGIN_TOP, width: SCREEN_WIDTH-MARGIN_LEFT_AND_RIGHT*2-2, height: SCREEN_HEIGHT-MARGIN_TOP-MARGIN_BOTTOM-2))
        subview.layer.borderColor = CHILD_VIEW_BORDER_COLOR.cgColor
        subview.layer.borderWidth = 0.5
        subview.layer.cornerRadius = VIEW_CORNER_RADIUS
        subview.layer.backgroundColor = CHILD_VIEW_BACKGROUND_COLOR.cgColor
        subview.layer.shadowColor = UIColor(red: 0xE6/255, green: 0xE6/255, blue: 0xE6/255, alpha: 1.0).cgColor
        subview.layer.shadowOffset = CGSize(width:6,height:6)
        subview.layer.shadowOpacity = 0.4
        subview.isUserInteractionEnabled = true
        subview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tagGesture)))
        subview.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(tagDrag)))
        return subview
    }
    
    func initFrontLabel() -> UILabel {
        let label : UILabel!
        label = UILabel(frame: CGRect(x: MARGIN_LEFT_AND_RIGHT, y: 200, width: SCREEN_WIDTH-MARGIN_LEFT_AND_RIGHT*4, height: 100))
        label.text = "汤姆米切尔提出的机器学习的定义"
        label.font = UIFont.systemFont(ofSize: 26)
        label.textColor = TITLE_FONT_COLOR
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }
    
    func initBackLabel() -> UILabel {
        let label : UILabel!
        label = UILabel(frame: CGRect(x: MARGIN_LEFT_AND_RIGHT, y: 60, width: SCREEN_WIDTH-MARGIN_LEFT_AND_RIGHT*4, height: 100))
        label.text = "汤姆米切尔提出的机器学习的定义"
        label.font = UIFont.systemFont(ofSize: 26)
        label.textColor = TITLE_FONT_COLOR
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }
    
    func initBtnKnow() -> UIButton {
        let button : UIButton!
        button = UIButton(frame: CGRect(x: 0, y:viewContent.bounds.height-btn_height, width: btn_width, height: btn_height))
        button.backgroundColor = UIColor(red: 0xF8/255, green: 0xF9/255, blue: 0xFA/255, alpha: 1.0)
        button.setTitle("知道", for: .normal)
        button.setTitleColor(BUTTON_TITLE_COLOR, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = CHILD_VIEW_BORDER_COLOR.cgColor
        
        return button
    }

    func initBtnNotKnow() -> UIButton {
        let button : UIButton!
        button = UIButton(frame: CGRect(x: btn_width*2-1, y:viewContent.bounds.height-btn_height, width: btn_width, height: btn_height))
        button.backgroundColor = UIColor(red: 0xF8/255, green: 0xF9/255, blue: 0xFA/255, alpha: 1.0)
        button.setTitle("不知道", for: .normal)
        button.setTitleColor(BUTTON_TITLE_COLOR, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = CHILD_VIEW_BORDER_COLOR.cgColor
        return button
    }
    
    func initBtnNotSure() -> UIButton {
        let button : UIButton!
        button = UIButton(frame: CGRect(x: btn_width-0.5, y:viewContent.bounds.height-btn_height, width: btn_width, height: btn_height))
        button.backgroundColor = UIColor(red: 0xF8/255, green: 0xF9/255, blue: 0xFA/255, alpha: 1.0)
        button.setTitle("不确定", for: .normal)
        button.setTitleColor(BUTTON_TITLE_COLOR, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = CHILD_VIEW_BORDER_COLOR.cgColor
        return button
    }
    var animationFront,animationBack : UIViewPropertyAnimator!
    // View点击事件
    @objc func tagGesture() {

        animationFront = UIViewPropertyAnimator(duration: 0.1, curve: .easeIn, animations: {
            self.viewContent.layer.transform = CATransform3DMakeRotation(CGFloat(.pi*0.5), 0, -1, 0)
        })
        animationFront.startAnimation()
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) {_ in
            self.viewContent.subviews.map{ $0.removeFromSuperview()}
            if self.isFront {
                self.viewContent.addSubview(self.labelBack)
                self.viewContent.addSubview(self.btnKnow)
                self.viewContent.addSubview(self.btnNotKnow)
                self.viewContent.addSubview(self.btnNotSure)
            } else {
                self.viewContent.addSubview(self.labelFront)
            }
            self.isFront = !self.isFront
            self.viewContent.layer.transform = CATransform3DMakeRotation(CGFloat(.pi*3.5), 0, -1, 0)
            self.animationBack = UIViewPropertyAnimator(duration: 0.1, curve: .easeOut, animations: {
                self.viewContent.layer.transform = CATransform3DMakeRotation(CGFloat(.pi*4.0), 0, -1, 0)
            })
            self.animationBack.startAnimation()
        }
        
    }
    
    //View 拖拽事件
    @objc func tagDrag(sender: UIPanGestureRecognizer) {
        if isFront {
            return
        }
        
        let transition:CGPoint = sender.translation(in: viewContent)
        checkLock(transition)
        
        if isLock {
            
        }
    }
    
    func checkLock(_ transition : CGPoint){
        if(abs(transition.x) > 1 || abs(transition.y) > 1){
            isLock = true
        } else {
            isLock = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //    @IBAction func touch(_ sender: UIButton) {
//
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let vc = sb.instantiateViewController(withIdentifier: "ViewController2")
//        self.present(vc, animated: true, completion: nil)
//    }
    //    @IBAction func touch(_ sender: UIButton) {
//        
//        let ac = UIAlertController(title: "Message", message: "You press the button!", preferredStyle: .alert)
//
//        let btnOK = UIAlertAction(title: "OK", style: .default, handler: nil)
//
//        ac.addAction(btnOK)
//
//        self.present(ac, animated: true, completion: nil)
//    }
    
    
}

