//
//  HttpRequest.swift
//  CarNews
//
//  Created by langyue on 16/9/1.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class HttpRequest: NSObject {


    static let ShareHttpRequest = HttpRequest()


    func getHomeData(page:Int,finished:(homeItems:[HeadImgModel],dataModels:[DataModel])->()){

        let url = "http://a.xcar.com.cn/interface/6.0/getNewsList.php"
        let params = [
                    "limit":10,
                    "offset":0,
                    "type":1]
        Alamofire.request(.GET,url,parameters: params).responseJSON { (response) in


            guard response.result.isSuccess else {
                return
            }

            if let value = response.result.value {

                let dict = JSON(value)

                let data = dict["focusList"].dictionary
                var dataModels = [DataModel]()
                if let newsList = dict["newsList"].arrayObject{
                    for newsList in newsList {
                        let lc_newsList = DataModel(dict: newsList as! [String:AnyObject])
                        dataModels.append(lc_newsList)
                    }
                }

                


                if let channels = data!["focusImgs"]?.arrayObject{
                    var homeItems = [HeadImgModel]()
                    for channel in channels {
                        let lc_channel = HeadImgModel(dict: channel as! [String: AnyObject])
                        homeItems.append(lc_channel)
                    }
                    finished(homeItems: homeItems,dataModels: dataModels)
                }

            }
        }


    }





    func getNewCarData(page:Int,finish:(dataModels:[DataModel])->()){

        let url = "http://mi.xcar.com.cn/interface/xcarapp/getdingyue.php"
        let params = ["limit":15,
                      "offset":page,
                      "type":18534]
        Alamofire.request(.GET,url,parameters: params).responseJSON { (response) in

            guard response.result.isSuccess else {
                return
            }

            if let value = response.result.value {

                let dict = JSON(value)
                let data = dict["newsList"].arrayObject
                var dataModels = [DataModel]()
                if let newsLists = data {
                    for newsList in newsLists {
                        let lc_newsList = DataModel(dict: newsList as! [String: AnyObject])
                        dataModels.append(lc_newsList)
                    }
                    finish(dataModels: dataModels)
                }

            }

        }


    }




}
