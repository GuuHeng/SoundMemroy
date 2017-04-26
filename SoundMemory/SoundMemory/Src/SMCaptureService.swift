//
//  SMCaptureService.swift
//  SoundMemory
//
//  Created by HuHeng on 2017/4/25.
//  Copyright © 2017年 HUHENG. All rights reserved.
//

import UIKit
import AVFoundation

class SMCaptureService: NSObject, AVCaptureMetadataOutputObjectsDelegate {
    
    var previewLayer: AVCaptureVideoPreviewLayer! // 视频呈现画面
    var captureSession: AVCaptureSession! // 捕获会话
    var output: AVCaptureMetadataOutput! // 输出
    var videoDevice: AVCaptureDevice? // 设备
    var input: AVCaptureInput! // 输入
    
    var isRunning = false
    
    var sendURL: String!
    
    // MARK: setup
    
    func setupCaptureSession() {
        
        if captureSession != nil {
            return
        }
        videoDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        if videoDevice == nil {
            return
        }
        
        captureSession = AVCaptureSession.init()
        
        input = (try! AVCaptureDeviceInput.init(device: videoDevice))
        
        if captureSession.canAddInput(input) {
            captureSession.addInput(input)
        }
        
        previewLayer = AVCaptureVideoPreviewLayer.init(session: captureSession)
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill

        
        output = AVCaptureMetadataOutput.init()
        let queue = DispatchQueue.init(label: "com.SoundMemory")
        output.setMetadataObjectsDelegate(self, queue: queue)
        
        if captureSession.canAddOutput(output) {
            captureSession.addOutput(output)
        }
        
    }
    
    // MARK: capture method
    func startRunning() {
        
        if captureSession == nil {
            return
        }
        
        captureSession.startRunning()
        output.metadataObjectTypes = output.availableMetadataObjectTypes;
        isRunning = true
        
    }
    
    func stopRunning() {
        captureSession.stopRunning()
        isRunning = false
    }
    
    // MARK: AVCaptureMetadataOutputObjectsDelegate
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        let element = metadataObjects.first as? AVMetadataMachineReadableCodeObject
        if  element != nil {
            sendURL = element?.stringValue
        }
        
    }
}
