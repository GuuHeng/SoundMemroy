//
//  SMMemoryViewController.swift
//  SoundMemory
//
//  Created by HuHeng on 2017/4/24.
//  Copyright © 2017年 HUHENG. All rights reserved.
//

import UIKit

class SMMemoryViewController: SMCommonViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.isNeedPop = true
        self.title = "回忆"
        self.view.backgroundColor = UIColor.white
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: (SCREEN_WiDTH - 30)/2, height: (SCREEN_WiDTH - 30)/2 * 1.4)

        layout.sectionInset = UIEdgeInsets.init(top: 5, left: 10, bottom: 0, right: 10)
        
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self as UICollectionViewDelegate
        collectionView.dataSource = self as UICollectionViewDataSource
        
        self.view.addSubview(collectionView)
        
        collectionView.register(SMMemoryCollectionViewCell.self, forCellWithReuseIdentifier: "sss")
        
        collectionView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview()

        }
        
        collectionView.contentInset = UIEdgeInsets.init(top: 64, left: 0, bottom: 49, right: 0)
    }
    
    // MARK: private method
    
    func save() {
        
        let fileManager = FileManager.default
        let documentPath: NSString? = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first! as NSString
        let filePath = documentPath?.appendingPathComponent("SoundMemory.plist")
        
        let date = Date.init()
        let format = DateFormatter.init()
        format.dateFormat = "yyyy-MM-dd HH-mm-ss"
        let dateString = format.string(from: date)
        let dictionary: NSDictionary = ["name": "SoundMemory", "creatTime": dateString]
        fileManager.createFile(atPath: filePath!, contents: nil, attributes: nil)
        if dictionary.write(toFile: filePath!, atomically: true) {
            print("写入成功")
        } else {
            print("写入失败")
        }
        print(filePath as Any)
        
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let id = "sss"
        let cell: SMMemoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! SMMemoryCollectionViewCell
        
        cell.authorLable.text = " 作者是谁"
        cell.dateLabel.text = " 2017/04/24"
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        self.save()
        
    }
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
