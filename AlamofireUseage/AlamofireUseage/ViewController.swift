//
//  ViewController.swift
//  AlamofireUseage
//
//  Created by 我是五高你敢信 on 2017/2/15.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit
import Alamofire

let PURL = "http://61.136.101.137:9080/api.ukxueche/params/"
let para = "startpage.param"
let imageURL = "https://httpbin.org/image/png"
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
//        textRequest3()
//        textImageDownload()
        textTimeoutInterval()
    }
    
    fileprivate func textRequest1 () {
        
        Alamofire.request(PURL + para, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { data in
            
            if data.result.description == "SUCCESS" {
                print(data.result.value ?? "nil")
            }else {
                
                
            }
            
            
            
        })
        
        
    }
    
    fileprivate func textRequest2 () {
        
        
        let request = Alamofire.request("https://httpbin.org/get")
        request.responseJSON(completionHandler: { responds in
            print(responds.result)
            print(responds.request)
            print(responds.response)
            print(responds.data)
            
            if let data = responds.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        })
        
        request.responseData(completionHandler: { response in
            if let data = response.result.value, let utf8String = String(data: data, encoding: .utf8) {
                print("data2: \(utf8String)")
            }
            
        })
        
        
        
    }
    
    fileprivate func textRequest3() {
        
        Alamofire.request("https://httpbin.org/get")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                case .failure(let error):
                    print(error)
                }
        }
        
        Alamofire.request("https://httpbin.org/get").validate(statusCode: 200..<300).validate(contentType: ["application/json"]).responseData(completionHandler: { response in
            switch response.result {
            case.success:
                print("success")
            case .failure:
                print("failure")
            }
        })
    }
    
    fileprivate func textImageDownload() {
        
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 60, width: UIScreen.main.bounds.width, height: 400))
//        view.addSubview(imageView)
//        
//        Alamofire.download(imageURL).responseData(completionHandler: { response in
//            print(response.result.description)
//            if let data = response.result.value {
//                imageView.image = UIImage(data: data)
//            }
//        })
        Alamofire.download("https://httpbin.org/image/png")
            .downloadProgress { progress in
                print("Download Progress: \(progress.fractionCompleted)")
            }
            .responseData { response in
                print(response.description)
                if let data = response.result.value {
                    let image = UIImage(data: data)
                }
        }
    }
    
    fileprivate func textTimeoutInterval() {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        sessionManager.request(PURL + para, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { response in
            print(response.result.description)
            print(response.result.value)
        })
    }
    
}

