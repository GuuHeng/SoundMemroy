//
//  SMNavigationController.swift
//  SoundMemory
//
//  Created by HuHeng on 2017/4/17.
//  Copyright © 2017年 HUHENG. All rights reserved.
//

import UIKit

class SMNavigationController: UINavigationController {

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        
        self.navigationBar.barStyle = UIBarStyle.black
        
        self.navigationBar.tintColor = UIColor.white
        
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]

    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
