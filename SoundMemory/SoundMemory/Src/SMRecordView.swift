//
//  SMRecordView.swift
//  SoundMemory
//
//  Created by HuHeng on 2017/4/17.
//  Copyright © 2017年 HUHENG. All rights reserved.
//

import UIKit

class SMRecordView: UIView {
    
    lazy var recordButton: UIButton = {
       
        let record = UIButton.init(type: .custom)
        record.clipsToBounds = true
        record.layer.cornerRadius = 6
        record.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        record.backgroundColor = .black
        record.alpha = 0.6
        record.setTitle("记下此时此刻", for: .normal)
        
        record.setTitleColor(.white, for: .normal)
        record.setTitleColor(.gray, for: .highlighted)
        return record
    }()
    
    
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.recordButton)
        
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.recordButton.snp.makeConstraints { (ConstraintMaker) in
            
            ConstraintMaker.top.left.equalToSuperview().offset(15)
            ConstraintMaker.right.bottom.equalToSuperview().offset(-15)
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
