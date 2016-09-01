//
//  LCScrollView.swift
//  CarNews
//
//  Created by langyue on 16/9/1.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit
import Kingfisher


class LCScrollView: UIView,UIScrollViewDelegate {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    typealias Block = (HeadImgModel)->()


    var scrollView:UIScrollView?    //滚动视图
    var pageControl:UIPageControl?  //分页控件
    var timer:NSTimer?  //定时器
    var currentPage:Int?    //当前页码

    var muArr = [HeadImgModel]()
    var tapClickBlock:Block? //回调block
    var count:Int?  //记录图片数组(未处理循环前)长度+1


    override init(frame: CGRect) {
        super.init(frame: frame)


        backgroundColor = UIColor.whiteColor()
        scrollView = UIScrollView(frame: CGRectMake(0,0,bounds.width,bounds.height))
        scrollView?.delegate = self
        scrollView?.contentOffset = CGPointMake(bounds.width, 0)
        scrollView?.pagingEnabled = true
        scrollView?.showsHorizontalScrollIndicator = false
        self.addSubview(scrollView!)



        currentPage = 1
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(LCScrollView.timerChange), userInfo: nil, repeats: true)
        pageControl = UIPageControl(frame:CGRectMake(0,0,bounds.width,30))
        pageControl?.currentPage = currentPage! - 1
        pageControl?.pageIndicatorTintColor = UIColor.whiteColor()
        pageControl?.currentPageIndicatorTintColor = UIColor.redColor()


        let view = UIView(frame: CGRectMake(0,bounds.height - 30,bounds.width,30))
        view.backgroundColor = UIColor(red: 42/255.0,green:47/255.0,blue: 48/255.0,alpha:0.4)
        self.addSubview(view)
        view.addSubview(pageControl!)

    }



    func timerChange(){
        scrollView?.scrollRectToVisible(CGRectMake(scrollView!.contentOffset.x+bounds.width,0,bounds.width, bounds.height), animated: true)
    }


    func changeScrollContentOffset(){

        if currentPage == 0 {
            scrollView?.contentOffset = CGPointMake(bounds.width * CGFloat(muArr.count - 2), 0)
            currentPage = Int((scrollView?.contentOffset.x)! / bounds.width)
            pageControl?.currentPage = currentPage! - 1
        }else if currentPage == count {
            scrollView?.contentOffset = CGPointMake(bounds.width,0)
            currentPage = Int((scrollView?.contentOffset.x)! / bounds.width)
            pageControl?.currentPage = currentPage! - 1
        }

    }



    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {

        currentPage = Int (scrollView.contentOffset.x / bounds.width)
        pageControl?.currentPage = currentPage! - 1
        self.changeScrollContentOffset()
        //滚动结束再次初始化定时器
        if timer == nil {
            timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(LCScrollView.timerChange), userInfo: nil, repeats: true)
        }
    }




    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        currentPage = Int(scrollView.contentOffset.x / bounds.width)
        pageControl?.currentPage = currentPage! - 1
        self.changeScrollContentOffset()
    }


    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        //开始拖动停用定时器
        timer?.invalidate()
        timer = nil
    }


    //图片手势方法
    func tapClick(tap:UITapGestureRecognizer){
        if self.tapClickBlock != nil {
            self.tapClickBlock!(muArr[(tap.view?.tag)!])
        }
    }


    //外部调用
    func configureScrollView(array:[HeadImgModel]){
        count = array.count + 1
        scrollView?.contentSize = CGSizeMake(bounds.width * CGFloat(array.count + 2), bounds.height)
        pageControl?.numberOfPages = array.count

        var index:Int
        muArr = array
        //防止数组为空
        //处理循环滚动
        if muArr.count > 0 {
            muArr.insert(muArr.last!, atIndex: 0)
            muArr.append(muArr[1])
        }

        for i in 0..<muArr.count {
            index = Int(i)
            let image = UIImageView(frame:CGRectMake(bounds.width*CGFloat(i), 0, bounds.width, bounds.height))
                image.kf_setImageWithURL(NSURL(string: muArr[index].imgURL!),placeholderImage: UIImage(named: "common_default_100x76"))
                image.userInteractionEnabled = true
                image.addGestureRecognizer(UITapGestureRecognizer(target: self,action: #selector(LCScrollView.tapClick(_:))))
                image.tag = index
            scrollView?.addSubview(image)
        }
        print(muArr)
        print(muArr.count)

    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
