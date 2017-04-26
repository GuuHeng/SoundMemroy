//
//  SMTimeChannelsView.swift
//  SoundMemory
//
//  Created by HuHeng on 2017/4/18.
//  Copyright © 2017年 HUHENG. All rights reserved.
//

import UIKit

class SMTimeChannelsView: UIView {

    lazy var memoryButton: UIButton = {
        
        let memory = UIButton.init(type: .custom)
        
        memory.setTitle("回忆", for: .normal)
        memory.setTitleColor(.white, for: .normal)
        memory.setTitleColor(.gray, for: .highlighted)
        memory.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        memory.backgroundColor = .black
        memory.alpha = 0.6
        memory.clipsToBounds = true
        memory.layer.cornerRadius = 6
        
        return memory
    }()
    
    lazy var dateButton: UIButton = {
        
        let date = UIButton.init(type: .custom)
        
        date.setTitle("00/00", for: .normal)
        date.setTitleColor(.white, for: .normal)
        date.setTitleColor(.gray, for: .highlighted)
        date.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        date.backgroundColor = .black
        date.alpha = 0.6
        date.clipsToBounds = true
        date.layer.cornerRadius = 6
        
        return date
    }()
    
    
    lazy var futureButton: UIButton = {
        
        let future = UIButton.init(type: .custom)
        
        future.setTitle("预见", for: .normal)
        future.setTitleColor(.white, for: .normal)
        future.setTitleColor(.gray, for: .highlighted)
        future.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        future.backgroundColor = .black
        future.alpha = 0.6
        future.clipsToBounds = true
        future.layer.cornerRadius = 6
        
        return future
    }()
    
    
    
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        self.addSubview(self.memoryButton)
        self.addSubview(self.dateButton)
        self.addSubview(self.futureButton)
        
        self.memoryButton.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.bottom.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalTo(self.dateButton.snp.left).offset(-15)
        }
        
        self.dateButton.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.bottom.equalToSuperview()
            ConstraintMaker.left.equalTo(self.memoryButton.snp.right).offset(15)
            ConstraintMaker.right.equalTo(self.futureButton.snp.left).offset(-15)
            ConstraintMaker.width.equalTo(self.memoryButton)
        }
        
        self.futureButton.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.bottom.equalToSuperview()
            ConstraintMaker.left.equalTo(self.dateButton.snp.right).offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.width.equalTo(self.dateButton)
        }
        
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        let date1 = dateFormatter.string(from: currentDate)
        self.dateButton.setTitle(date1, for: .normal)
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
