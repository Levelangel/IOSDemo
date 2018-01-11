//
//  ViewController.swift
//  ex1
//
//  Created by Albert Chen on 2018/1/3.
//  Copyright © 2018年 Albert Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isTurn : Bool = false
    
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var btnNotKnow: UIButton!
    @IBOutlet weak var btnNotShre: UIButton!
    @IBOutlet weak var btnKnow: UIButton!
    @IBOutlet weak var viewTitle: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewTitle.layer.cornerRadius = 10.0
        viewContent.layer.cornerRadius = 10.0
        viewContent.isHidden = true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch: AnyObject in touches {
//            let t:UITouch = touch as! UITouch
//            //当在屏幕上连续拍动两下时，背景恢复为白色
//            if(t.tapCount == 2)
//            {
//                self.view.backgroundColor = UIColor.white
//            }
//                //当在屏幕上单击时，屏幕变为红色
//            else if(t.tapCount == 1)
//            {
//                self.view.backgroundColor = UIColor.red
//            }
            
//        }
        if !isTurn {
            UIView.beginAnimations("animation", context: nil)
            UIView.setAnimationDuration(0.2)
            UIView.setAnimationCurve(.linear)
            UIView.setAnimationTransition(.flipFromLeft, for: viewTitle, cache: false)
            UIView.commitAnimations()
            isTurn = true
            viewContent.isHidden = false
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

