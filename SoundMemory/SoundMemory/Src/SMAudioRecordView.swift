//
//  SMAudioRecordView.swift
//  SoundMemory
//
//  Created by HuHeng on 2017/4/18.
//  Copyright © 2017年 HUHENG. All rights reserved.
//

import UIKit

class SMAudioRecordView: UIView {
    
    let audioService = SMAudioService()
    let captureServic = SMCaptureService()
    
    lazy var startButton: UIButton = {
        let start = UIButton.init(type: .custom)
        start.backgroundColor = UIColor.black
        start.alpha = 0.6
        start.clipsToBounds = true
        start.layer.cornerRadius = 50
        start.layer.shadowColor = UIColor.gray.cgColor
        
        start.setTitle("开始录音", for: .normal)
        start.setTitleColor(.white, for: .normal)
        start.setTitleColor(.gray, for: .highlighted)
        start.setTitle("正在录制", for: .selected)
        
        start.addTarget(self, action: #selector(startRecord), for: .touchUpInside)
        return start
    }()
    
    lazy var stopButton: UIButton = {
        let stop = UIButton.init(type: .custom)
        
        stop.backgroundColor = UIColor.red
        stop.setTitle("结束播放", for: .normal)
        stop.setTitleColor(.white, for: .normal)
        stop.clipsToBounds = true
        stop.layer.cornerRadius = 6
        
        stop.addTarget(self, action: #selector(stopRecord), for: .touchUpInside)
        
        return stop
    }()
    
    lazy var startPlay: UIButton = {
        let play = UIButton.init(type: .custom)
        play.backgroundColor = UIColor.gray
        play.setTitle("开始播放", for: .normal)
        play.setTitleColor(.white, for: .normal)
        play.addTarget(self, action: #selector(playRecord), for: .touchUpInside)
        return play
    }()
    
    lazy var startCapture: UIButton = {
        let play = UIButton.init(type: .custom)
        play.backgroundColor = UIColor.gray
        play.setTitle("开启摄像头", for: .normal)
        play.setTitleColor(.white, for: .normal)
        play.addTarget(self, action: #selector(startCaputure), for: .touchUpInside)
        return play
    }()
    
    func startCaputure() {
        register()
        if captureServic.captureSession.isRunning {
            captureServic.stopRunning()
        } else {
            
            captureServic.startRunning()
        }
    }
    
    func stopRecord() {
    
        audioService.stopRecord()
    }
    
    func startRecord() {
        
        if startButton.isSelected {
            startButton.isSelected = false
        } else {
            startButton.isSelected = true
            
            audioService.registerService()
            
        }
    }
    
    func playRecord() {
        audioService.startPlay()
    }
    
    func register() {
        
        captureServic.setupCaptureSession()
        
        if captureServic.captureSession == nil {
            let alert = UIAlertController.init(title: "请求相机权限", message: "此设备相机权限没有打开？", preferredStyle: .alert)
            let action = UIAlertAction.init(title: "获取", style: .default, handler: nil)
            alert.addAction(action)
            SMAudioRecordViewController().present(alert, animated: true, completion: nil)
        } else {
            print("申请权限")
            captureServic.previewLayer.frame = self.bounds
            self.layer.addSublayer(captureServic.previewLayer)
            NotificationCenter.default.addObserver(self, selector: #selector(captureServic.startRunning), name:NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(captureServic.stopRunning), name:NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
            
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(startButton)
        
        startButton.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.center.equalToSuperview()
            ConstraintMaker.size.equalTo(CGSize.init(width: 100, height: 100))
        }
        
        self.addSubview(stopButton)
        
        stopButton.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(startButton.snp.bottom).offset(10)
            ConstraintMaker.centerX.equalTo(startButton)
            ConstraintMaker.size.equalTo(CGSize.init(width: 100, height: 100))
        }
        
        self.addSubview(startPlay)
        
        startPlay.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(stopButton.snp.bottom).offset(10)
            ConstraintMaker.centerX.equalTo(stopButton)
            ConstraintMaker.size.equalTo(stopButton)
        }
        
        self.addSubview(startCapture)
        
        startCapture.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.bottom.equalTo(startButton.snp.top).offset(-10)
            ConstraintMaker.centerX.equalTo(startPlay)
            ConstraintMaker.size.equalTo(startPlay)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
