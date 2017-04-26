//
//  SMMemoryCollectionViewCell.swift
//  SoundMemory
//
//  Created by HuHeng on 2017/4/24.
//  Copyright © 2017年 HUHENG. All rights reserved.
//

import UIKit

class SMMemoryCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        self.contentView.addSubview(self.baseView)
        self.baseView.addSubview(self.imageView)
        self.baseView.addSubview(self.authorLable)
        self.baseView.addSubview(self.dateLabel)
        self.baseView.addSubview(self.flagLabel)
        
//        self.imageView.backgroundColor = UIColor.init(red: CGFloat(arc4random_uniform(255))/255.0, green: CGFloat(arc4random_uniform(255))/255.0, blue: CGFloat(arc4random_uniform(255))/255.0, alpha: 1.0)
        self.backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.baseView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.left.equalToSuperview().offset(10)
            ConstraintMaker.right.bottom.equalToSuperview().offset(-10)
        }
        
        self.imageView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.left.right.equalToSuperview()
            ConstraintMaker.height.equalTo((SCREEN_WiDTH - 30)/2)
        }
        
        self.authorLable.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(self.imageView.snp.bottom)
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.height.equalTo(self.dateLabel)
        }
        
        self.dateLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(self.authorLable.snp.bottom)
            ConstraintMaker.left.right.bottom.equalToSuperview()
            ConstraintMaker.height.equalTo(self.authorLable)
        }
        
        self.flagLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.center.equalTo(self.imageView)
            ConstraintMaker.size.equalTo(CGSize.init(width: 80, height: 80))
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var baseView: UIView = {
        let base = UIView.init()
        base.backgroundColor = UIColor.black
        
        base.clipsToBounds = true
        base.layer.cornerRadius = 6
        
        base.layer.shadowColor = UIColor.black.cgColor
        base.layer.shadowOffset = CGSize.init(width: 4, height: 4)
        base.layer.shadowOpacity = 0.5
        base.layer.shadowRadius = 2
        return base
    }()
    
    lazy var imageView: UIImageView = {
        let imgV = UIImageView.init()
        imgV.backgroundColor = .white
        imgV.image = UIImage.init(named: "image1")
        return imgV
    }()
    
    lazy var authorLable: UILabel = {
        let author = UILabel.init()
        author.backgroundColor = UIColor.init(red: 233/255.0, green: 233/255.0, blue: 233/255.0, alpha: 1)
        author.textColor = .black
        author.font = UIFont.systemFont(ofSize: 13)
        author.textAlignment = NSTextAlignment.left
        
        return author
    }()
    
    lazy var dateLabel: UILabel = {
        let date = UILabel.init()
        date.backgroundColor = UIColor.init(red: 233/255.0, green: 233/255.0, blue: 233/255.0, alpha: 1)
        date.textColor = .black
        date.font = UIFont.systemFont(ofSize: 13)
        date.textAlignment = NSTextAlignment.left
        return date
    }()
    
    lazy var flagLabel: UILabel = {
        let flag = UILabel.init()
        flag.backgroundColor = .black
        flag.alpha = 0.5
        flag.textColor = UIColor.white
        flag.font = UIFont.boldSystemFont(ofSize: 20)
        flag.textAlignment = NSTextAlignment.center
        flag.clipsToBounds = true
        flag.layer.cornerRadius = 40
        flag.text = "日记"
        return flag
    }()
    
    
    
    
    
    
    
    
    
    
    
}
