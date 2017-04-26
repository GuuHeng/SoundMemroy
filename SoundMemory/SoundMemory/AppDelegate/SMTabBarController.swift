//
//  SMTabBarController.swift
//  SoundMemory
//
//  Created by HuHeng on 2017/4/17.
//  Copyright © 2017年 HUHENG. All rights reserved.
//

import UIKit

class SMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let home = SMHomeViewController()
        let mine = SMMineViewController()
        
        let vcs = [home, mine]
        
        let itemTitles = ["主页", "我的"]
        
        for (index, vc) in vcs.enumerated() {
            
            let navC = SMNavigationController.init(rootViewController: vc)
            
            let tabBarItem = UITabBarItem.init(title: itemTitles[index], image: nil, selectedImage: nil)
            
            navC.tabBarItem = tabBarItem
            
            self .addChildViewController(navC)
            
        }
        
        self.tabBar.barTintColor = UIColor.white
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
