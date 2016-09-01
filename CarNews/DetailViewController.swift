//
//  DetailViewController.swift
//  CarNews
//
//  Created by langyue on 16/9/1.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit
import SVProgressHUD


class DetailViewController: UIViewController,UIWebViewDelegate {


    var webView:UIWebView?
    var webLink:String?



    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "详情"


        // Do any additional setup after loading the view.
    }


    func createWebView(){

        webView = UIWebView(frame:CGRectMake(0,-44,kScreenWidth,kScreenHeight-20))
        let request = NSURLRequest(URL: NSURL(string: webLink!)!)

        webView?.loadRequest(request)
        webView?.delegate = self
        webView?.scalesPageToFit = true
        webView?.scrollView.bounces = false
        view.addSubview(webView!)


    }



    override func viewWillAppear(animated: Bool) {
        self.createWebView()
    }


    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {


    }

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        SVProgressHUD.showWithStatus("正在加载...")
        return true
    }


    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        SVProgressHUD.dismiss()
        if webView != nil {
            webView?.stopLoading()
            webView?.removeFromSuperview()
            webView = nil
        }
    }





    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
