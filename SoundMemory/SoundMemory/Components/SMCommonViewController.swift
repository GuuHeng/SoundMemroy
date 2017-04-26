//
//  SMCommonViewController.swift
//  SoundMemory
//
//  Created by HuHeng on 2017/4/17.
//  Copyright © 2017年 HUHENG. All rights reserved.
//

import UIKit

class SMCommonViewController: UIViewController {

    var isNeedPop: Bool? = false
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = UIColor.white
        
        if self.isNeedPop == true {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "←", style: .done, target: self, action: #selector(pop))
        } else {
            self.navigationItem.leftBarButtonItem = nil
        }
    }
    
    func pop() {
        self.navigationController?.popViewController(animated: true)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
