//
//  aaaaViewController.swift
//  TMIJKDemo
//
//  Created by 纪志刚 on 2018/8/14.
//  Copyright © 2018年 纪志刚. All rights reserved.
//

import UIKit

class aaaaViewController: UIViewController {

    var iPlayer:IJKFFMoviePlayerController? //
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //        IJKFFOptions *options = [IJKFFOptions optionsByDefault]; //使用默认配置
        //        NSURL * url = [NSURL URLWithString:@"rtmp://live.hkstv.hk.lxdns.com/live/hks"];
        
        let options:IJKFFOptions = IJKFFOptions.byDefault()
        let url:URL = URL.init(string: "rtmp://live.hkstv.hk.lxdns.com/live/hks")!
        
        
        
        
        //        self.player = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:options]; //初始化播放器，播放在线视频或直播(RTMP)
        //        self.player.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        //        self.player.view.frame = self.view.bounds;
        //        self.player.scalingMode = IJKMPMovieScalingModeAspectFit; //缩放模式
        //        self.player.shouldAutoplay = YES; //开启自动播放
        //
        //        self.view.autoresizesSubviews = YES;
        //        [self.view addSubview:self.player.view];
        
        
        
        
        
        
        
        self.iPlayer = IJKFFMoviePlayerController.init(contentURL: url, with: options)
        var arm1 = UIViewAutoresizing.init(rawValue: 0)
        arm1.insert(UIViewAutoresizing.flexibleWidth)
        arm1.insert(UIViewAutoresizing.flexibleHeight)
        self.iPlayer?.view.autoresizingMask = arm1
        self.iPlayer?.view.backgroundColor = UIColor.white
        self.iPlayer?.view.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        self.iPlayer?.scalingMode = .aspectFit
        self.iPlayer?.shouldAutoplay = true
        self.view.autoresizesSubviews = true
        self.view.addSubview((self.iPlayer?.view)!)
        
        
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = UIColor.red
        btn.frame = CGRect.init(x: 0, y: 0, width: 50, height: 50)
        btn.setTitle("返", for: .normal)
        btn.addTarget(self, action: #selector(quanping(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
        
        
        
        // Do any additional setup after loading the view.
    }

    
    @objc func quanping(_ btn:UIButton){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let rotation : UIInterfaceOrientationMask = [.portrait]
        appDelegate.blockRotation = rotation
        
        self.navigationController?.navigationBar.isHidden = false
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.iPlayer?.prepareToPlay()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.iPlayer?.shutdown()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
