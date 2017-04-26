//
//  SMHomeViewController.swift
//  SoundMemory
//
//  Created by HuHeng on 2017/4/17.
//  Copyright © 2017年 HUHENG. All rights reserved.
//

import UIKit

class SMHomeViewController: SMCommonViewController {

    let recordView: SMRecordView = SMRecordView.init(frame: CGRect.zero)
    let timeChannelsView: SMTimeChannelsView = SMTimeChannelsView.init(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(recordView)
        self.view.addSubview(timeChannelsView)
        recordView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalToSuperview().offset(64)
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.height.equalTo(100)
        }
        
        timeChannelsView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(recordView.snp.bottom)
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.height.equalTo(150)
        }
        
        recordView.recordButton.addTarget(self, action: #selector(recordStart), for: .touchUpInside)
        timeChannelsView.memoryButton.addTarget(self, action: #selector(memoryStart), for: .touchUpInside)
    }
    
    func memoryStart() {
        self.navigationController?.pushViewController(SMMemoryViewController(), animated: true)
    }
    
    func recordStart() {
        
        print("记下此时此刻/(1++))")
        
        
        self.navigationController?.pushViewController(SMAudioRecordViewController(), animated: true)
        
        
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
