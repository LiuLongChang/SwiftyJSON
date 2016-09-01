//
//  Initialization.swift
//  CarNews
//
//  Created by langyue on 16/8/31.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit

class Initialization: NSObject {


    //初始化外观
    class func initializationAppearance(window: UIWindow?){

        window?.backgroundColor = UIColor.whiteColor()

        let navBar = UINavigationBar.appearance()
        let navBarSize = CGSizeMake(UIScreen.mainScreen().bounds.width, 64)
        let navBarImage = UIImage.image_Color(kAppearanceColor, size: navBarSize)
        navBar.setBackgroundImage(navBarImage, forBarMetrics: .Default)
        navBar.shadowImage = UIImage()
        navBar.tintColor = UIColor.whiteColor()

        navBar.titleTextAttributes = [
            NSFontAttributeName: kNavigationBarFont,
            NSForegroundColorAttributeName: UIColor.whiteColor()
        ]

        let tabBar = UITabBar.appearance()
        tabBar.translucent = false

    }





}
