//
//  SMKitConstant.swift
//  SoundMemory
//
//  Created by HuHeng on 2017/4/17.
//  Copyright © 2017年 HUHENG. All rights reserved.
//

import UIKit

let SCREEN_WiDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height

let SCREEN_H_W_RATIO = SCREEN_HEIGHT/SCREEN_WiDTH

func COLOR(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
    
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    
}

func aCOLOR(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    
}




		
