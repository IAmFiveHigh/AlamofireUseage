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
//        textTimeoutInterval()
        
        easydemo1()
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
        
        
    }
}



