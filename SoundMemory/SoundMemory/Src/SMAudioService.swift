//
//  SMAudioService.swift
//  SoundMemory
//
//  Created by HuHeng on 2017/4/18.
//  Copyright © 2017年 HUHENG. All rights reserved.
//

import UIKit
import AVFoundation

class SMAudioService: NSObject, AVAudioPlayerDelegate {
    
    var audioRecorder: AVAudioRecorder! // 录音
    var audioPlayer: AVAudioPlayer!     // 播放
    
    let recordSettings = [AVSampleRateKey: 44100.0, // 声音采样率
                          AVFormatIDKey: kAudioFormatMPEG4AAC, // 编码格式
                          AVNumberOfChannelsKey: 1, // 采集音轨
                          AVEncoderAudioQualityKey: AVAudioQuality.medium.rawValue] // 音频质量
        as [String : Any]
    
    let audioSession = AVAudioSession.sharedInstance()
    
    var isAllowed: Bool = false // 请求权限
    
    // MARK: 注册Audio
    func registerService() {
        
        // 1. 请求权限
        audioSession.requestRecordPermission { (allow) in
            
            if !allow {
                let alertController = UIAlertController.init(title: "无法访问您的麦克风", message: "请到设置→隐私→麦克风，打开访问权限", preferredStyle: UIAlertControllerStyle.alert)
                
                let alertAction = UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                
                alertController.addAction(alertAction)
                self.isAllowed = false
            } else {
                self.isAllowed = true
            }
        }
        
        if self.isAllowed {
            
            do {
                try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
                
                try audioRecorder = AVAudioRecorder.init(url: URL.init(fileURLWithPath: self.writeToPath()!), settings: self.recordSettings)
                
                audioRecorder.delegate = self as? AVAudioRecorderDelegate
                audioRecorder.prepareToRecord()
                
            } catch let error as NSError {
                print(error)
            }
            
            self.startRecord()
        }
    }
    
    func writeToPath() -> String? {
        
        let fileManager = FileManager.default
        var urlString: String = (NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first!
            
            ) as String      

        urlString.append("/playa.acc")
        if fileManager.createFile(atPath: urlString, contents: nil, attributes: nil) {
            print(urlString + "创建成功")
        } else {
            print(urlString + "创建不成功")
        }
        
        return urlString
    }
    
    func readFormPath() -> String? {
        let fileManager = FileManager.default
        var urlString: String = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first!
        urlString.append("/playa.acc")
        
        if fileManager.fileExists(atPath: urlString as String) {
            print("路径存在")
            return urlString
        } else {
            print("路径不存在")
            return "aaa"
        }
    }
    
    func startRecord() {
        
        if audioRecorder.record() {
            do {
                try audioSession.setActive(true)
                audioRecorder.record()
            }catch let error as NSError {
                print(error)
            }
        }
    }
    
    func startPlay() {
        
        if !audioRecorder.isRecording {
            do {
                let url: URL = URL.init(fileURLWithPath: self.readFormPath()!)
                try audioPlayer = AVAudioPlayer.init(contentsOf: url)
                audioPlayer.delegate = self as AVAudioPlayerDelegate
                audioPlayer.play()
                print("开始播放")
            } catch let error as NSError {
                print(error)
            }
        }
        else {
            print("没有播放")
        }
    }
    
    func stopRecord() {
        
        audioRecorder.stop()
    }
}
