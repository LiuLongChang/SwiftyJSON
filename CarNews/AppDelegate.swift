//
//  AppDelegate.swift
//  CarNews
//
//  Created by langyue on 16/8/31.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.mainScreen().bounds.size.width
let kScreenHeight = UIScreen.mainScreen().bounds.size.height


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    var btn:UIButton?
    var vc:UIViewController?
    var view:UIView?
    var item:UIBarButtonItem?




    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.

        Initialization.initializationAppearance(window)



        UIApplication.sharedApplication().statusBarStyle = .LightContent
        let story = UIStoryboard(name: "LaunchScreen",bundle: nil)
        vc = story.instantiateViewControllerWithIdentifier("landInterface")
        vc?.view.backgroundColor = UIColor.purpleColor()

        view = vc?.view
        view?.userInteractionEnabled = true
        view?.addGestureRecognizer(UITapGestureRecognizer(target: self,action: #selector(AppDelegate.tapClick)))


        view?.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight)
        view?.backgroundColor = UIColor.yellowColor()
        window?.userInteractionEnabled = true
        window?.addSubview(view!)

        weak var weakSelf = self
        UIView.animateWithDuration(0.6, delay: 1.0, options: .BeginFromCurrentState, animations: {

            weakSelf!.view?.alpha = 0
            weakSelf!.view?.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.5, 1.5, 1.0)

            }) { (yes) in

                weakSelf!.view?.removeFromSuperview()

        }




        return true
    }



    func tapClick(){

        print("爷的")

    }




    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

