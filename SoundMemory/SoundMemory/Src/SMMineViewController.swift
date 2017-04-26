//
//  SMMineViewController.swift
//  SoundMemory
//
//  Created by HuHeng on 2017/4/17.
//  Copyright © 2017年 HUHENG. All rights reserved.
//

import UIKit

import SnapKit.Swift

class SMMineViewController: SMCommonViewController, UITableViewDataSource, UITableViewDelegate {

    lazy var tableView: UITableView = {
        
        var tableView = UITableView.init(frame: CGRect.init(origin: CGPoint.zero, size: CGSize.zero),
                                         style: UITableViewStyle.plain)
        
        tableView.contentInset = UIEdgeInsets.init(top: 64, left: 0, bottom: 49, right: 0)
        
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self as UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
        tableView.showsHorizontalScrollIndicator = true
        tableView.rowHeight = 50
        tableView.tableFooterView = UIView();
        
        return tableView

    }()
    
    var titles: [NSString] = ["姓名", "性别", "年龄", "手机号", "QQ", "邮箱", "公司", "公司地址", "家庭地址", "你喜欢的是什么", "你讨厌的是什么", "你喜欢的人是谁", "你喜欢哪位演员", "我是一只小小鸟", "想要飞", "却怎么也飞不高", "路灯下的小女孩"]

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.tableView.snp.makeConstraints { (ConstraintMaker) in
            
            ConstraintMaker.top.left.right.bottom.equalToSuperview()
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.tableView)
        
        self.tableView.reloadData()
    }

    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIDE = "cellIDE"
        
        let cell: UITableViewCell = UITableViewCell.init(style: .default, reuseIdentifier: cellIDE)
        
        cell.textLabel?.text = self.titles[indexPath.row] as String
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
