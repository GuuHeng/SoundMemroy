//
//  SMAudioRecordViewController.swift
//  SoundMemory
//
//  Created by HuHeng on 2017/4/18.
//  Copyright © 2017年 HUHENG. All rights reserved.
//

import UIKit
import AVFoundation

class SMAudioRecordViewController: SMCommonViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

    }
    
    var audioView: SMAudioRecordView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.isNeedPop = true
        
        audioView = SMAudioRecordView.init(frame: CGRect.zero)
        self.view.addSubview(audioView)
        
        audioView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview()
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "摄像头转换", style: .done, target: self, action: #selector(turn))
    }
    
    func turn() {
        
        let position = audioView.captureServic.videoDevice?.position
        
        if position == AVCaptureDevicePosition.front {
            audioView.captureServic.videoDevice = AVCaptureDevice.defaultDevice(withDeviceType: AVCaptureDeviceType.builtInDuoCamera, mediaType: AVMediaTypeVideo, position: .back)
        } else {
            audioView.captureServic.videoDevice = AVCaptureDevice.defaultDevice(withDeviceType: AVCaptureDeviceType.builtInDuoCamera, mediaType: AVMediaTypeVideo, position: .front)
        }

    }
    
    override func pop() {
        
        if audioView.captureServic.captureSession != nil {
            audioView.captureServic.stopRunning()
            audioView.captureServic.previewLayer.removeFromSuperlayer()
        } else {
            super.pop()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
