//
//  SetViewController.swift
//  CarNews
//
//  Created by langyue on 16/9/1.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit
import SVProgressHUD


let iPhone4s = UIScreen.mainScreen().bounds.size.width == 320
private let kHeaderViewHeight: CGFloat = iPhone4s ? 180.0 : 358.0




class SetViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {


    var collectionView:UICollectionView?
    var dataArr = [DataModel]()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "新车上市"
        view.backgroundColor = UIColor.whiteColor()

        SVProgressHUD.showWithStatus("正在加载...")
        HttpRequest.ShareHttpRequest.getNewCarData(10) { (dataModels) in

            self.dataArr = dataModels
            self.collectionView?.reloadData()
            SVProgressHUD.dismiss()

        }



        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20

        collectionView = UICollectionView(frame: CGRectMake(0, -64, kScreenWidth, kScreenHeight),collectionViewLayout:layout)
        collectionView?.insertSubview(headerView, atIndex: 0)
        collectionView?.registerClass(Home_Cell.self, forCellWithReuseIdentifier: "cell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor.groupTableViewBackgroundColor()
        collectionView?.contentInset = UIEdgeInsetsMake(kHeaderViewHeight, 0, 0, 0)
        layout.itemSize = CGSizeMake(kScreenWidth, 100)
        view.addSubview(collectionView!)



        // Do any additional setup after loading the view.
    }


    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        dispatch_async(dispatch_get_main_queue()) {
            self.headerView.frame = CGRectMake(0, -kHeaderViewHeight, CGRectGetWidth(self.view.bounds), kHeaderViewHeight)
        }
    }



    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarAlpha(0.0)
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        setNavigationBarAlpha(1.0)
    }



    private func setNavigationBarAlpha(alpha:CGFloat){
        if let navigationBar = navigationController?.navigationBar {

            if let bgView = navigationBar.valueForKey("_backgroundView") as? UIView {
                bgView.alpha = alpha
            }
            let titleAlpha = alpha > 0.8 ? alpha : 0
            navigationBar.titleTextAttributes = [
                NSFontAttributeName: kNavigationBarFont,
                NSForegroundColorAttributeName: UIColor.init(white: 1, alpha: titleAlpha)
            ]

        }
    }

    private lazy var headerView: HeaderView = {
        let t = HeaderView.loadFromNib()
        return t
    }()




    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }


    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! Home_Cell

        cell.setCell_DataModelArr(dataArr[indexPath.row])

        cell.block = {str in


        }


        return cell
    }



    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 0, 10, 0)
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

        setNavigationBarAlpha(1)
        navigationController?.navigationBar.hidden = false
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        let dvc = DetailViewController()
        dvc.webLink = dataArr[indexPath.row].webLink
        navigationController?.pushViewController(dvc, animated: true)


    }


    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset

        if offset.y <= -(kHeaderViewHeight - 64) {
            setNavigationBarAlpha(0)
        }else{
            setNavigationBarAlpha(offset.y / (kHeaderViewHeight-64))
        }

        if offset.y < kHeaderViewHeight {

            var frame = headerView.frame
            frame.origin.y = offset.y
            frame.size.height = -offset.y
            headerView.frame = frame

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





