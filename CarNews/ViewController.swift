//
//  ViewController.swift
//  CarNews
//
//  Created by langyue on 16/8/31.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit
import SVProgressHUD





class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {



    var collectionView:UICollectionView?
    var dataArr = [DataModel]()
    var headArr = [HeadImgModel]()




    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        navigationController?.navigationBar.translucent = false
        SVProgressHUD.showWithStatus("正在加载...")
        HttpRequest.ShareHttpRequest.getHomeData(1) { (homeItems, dataModels) in

            self.dataArr = dataModels
            self.headArr = homeItems
            self.collectionView?.reloadData()
            SVProgressHUD.dismiss()

        }
        

        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        collectionView = UICollectionView(frame: CGRectMake(0, 0, kScreenWidth, kScreenHeight-64),collectionViewLayout:layout)
        collectionView?.registerClass(Home_Cell.self, forCellWithReuseIdentifier: "cell")
        collectionView?.registerClass(HomeHeadView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeadView")
        collectionView?.delegate = self;
        collectionView?.dataSource = self;
        collectionView?.backgroundColor = UIColor.groupTableViewBackgroundColor()
        layout.itemSize = CGSizeMake(kScreenWidth, 100)
        self.view.addSubview(collectionView!)






    }




    @IBAction func ActionBtn(sender: UIBarButtonItem) {

        let vc = SetViewController()


        navigationController?.pushViewController(vc, animated: true)



    }



    //
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }


    //返回自定义的cell
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

    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {

        var headView = HomeHeadView()
        if kind == UICollectionElementKindSectionHeader {
            headView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "HeadView", forIndexPath: indexPath) as! HomeHeadView
        }

        headView.tapClickBlock = {model in




        }

        headView.setHeadViewWith(headArr)
        return headView
    }



    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(kScreenWidth, kScreenWidth / 2)
    }




    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

        setNavigationBarAlpha(1)
        navigationController?.navigationBar.hidden = false
        UIApplication.sharedApplication().statusBarStyle = .LightContent



        let vc = DetailViewController()
        vc.webLink = dataArr[indexPath.row].webLink


        navigationController?.pushViewController(vc, animated: true)

    }




    private func setNavigationBarAlpha(alpha: CGFloat){

        if let navigationBar = navigationController?.navigationBar {

            if let bgView = navigationBar.valueForKey("_backgroundView") as? UIView{
                bgView.alpha = alpha
            }
            let titleAlpha = alpha > 0.8 ? alpha : 0
            navigationBar.titleTextAttributes = [
                NSFontAttributeName: kNavigationBarFont,
                NSForegroundColorAttributeName: UIColor.init(white: 1, alpha: titleAlpha)
            ]

        }

    }




    func scrollViewDidScroll(scrollView: UIScrollView) {

        let offset = scrollView.contentOffset
        print(scrollView.contentOffset.y)
        if offset.y > 0 {

            setNavigationBarAlpha(1/(offset.y/10))
            collectionView?.frame = CGRectMake(0, -44, kScreenWidth, kScreenHeight-20)
            if offset.y > 44 {
                navigationController?.navigationBar.hidden = true
                UIApplication.sharedApplication().statusBarStyle = .Default
            }

        }else{

            setNavigationBarAlpha(1)
            collectionView?.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-64)
            navigationController?.navigationBar.hidden = false
            UIApplication.sharedApplication().statusBarStyle = .LightContent

        }

    }






    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}

