//
//  ViewController.swift
//  AlamofireUseage
//
//  Created by 我是五高你敢信 on 2017/2/15.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

let PURL = "http://61.136.101.137:9080/api.ukxueche/params/"
let para = "startpage.param"
let imageURL = "https://httpbin.org/image/png"
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
//        textRequest3()
//        textImageDownload()
//        textTimeoutInterval()
        
//        easydemo1()
        
        downloadData()
    }
    
    fileprivate func textRequest1 () {
        
        Alamofire.request(PURL + para, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { data in
            
            if data.result.description == "SUCCESS" {
                print(data.result.value ?? "nil")
            }else {
                
            }
            
        })
        
    }
    
    fileprivate func easydemo1() {
        
        /*
        Alamofire.request("http://www.httpbin.org/get").responseJSON(completionHandler: { json in
            debugPrint(json)
        })
 */
        //swiftJson解析
//        Alamofire.request("http://www.httpbin.org/get", method: .get, parameters: ["name": "wugao"], encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { response in
//            
//            let json = JSON(response.result.value ?? "nil")
//            debugPrint(json["args"]["name"].stringValue)
//            
//        })
        
        
        //下载
        if let url = Bundle.main.url(forResource: "图片", withExtension: "zip") {
            
            print("打包成功")
            
            Alamofire.upload(url, to: "https://httpbin.org/post", method: .post, headers: nil).responseJSON(completionHandler: { response in
                debugPrint(response)
            })
        }
        
        
    }
    
    fileprivate func downloadData() {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 60, width: 300, height: 300))
        view.addSubview(imageView)
        
        //失败了
        /*
        Alamofire.download("https://httpbin.org/image/png").responseData(completionHandler: { response in
            debugPrint(response)
            
            if let data = response.result.value {
                imageView.image = UIImage(data: data)
            }
        })
         */
        
        
        
        
    }
}



