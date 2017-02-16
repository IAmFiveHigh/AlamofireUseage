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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(PURL + para, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { data in
            print("请求成功")
            print(data.result.description)
            print(data.result.value ?? "nil")
            
        })
            
            
    }
    
}

