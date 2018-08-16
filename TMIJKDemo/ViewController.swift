//
//  ViewController.swift
//  TMIJKDemo
//
//  Created by 纪志刚 on 2018/8/13.
//  Copyright © 2018年 纪志刚. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: 100, y: 100, width: 100, height: 50)
        btn.backgroundColor = UIColor.red
        btn.setTitle("开始直播", for: .normal)
        btn.addTarget(self, action: #selector(start(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @objc private func start(_ btn:UIButton)
    {
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let rotation : UIInterfaceOrientationMask = [.landscapeRight]
//        appDelegate.blockRotation = rotation
//
//        self.navigationController?.navigationBar.isHidden = true
        
        let vc = playerViewController()
//        self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

