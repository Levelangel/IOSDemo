//
//  ViewController.swift
//  ex1
//
//  Created by Albert Chen on 2018/1/3.
//  Copyright © 2018年 Albert Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touch(_ sender: UIButton) {
        
        let ac = UIAlertController(title: "Message", message: "You press the button!", preferredStyle: .alert)
        
        let btnOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        ac.addAction(btnOK)
        
        self.present(ac, animated: true, completion: nil)
    }
    
}

