//
//  ViewController.swift
//  JSONParsingSwift4
//
//  Created by Dhaivat Vyas on 24/06/18.
//  Copyright © 2018 DevDK. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var arrArticles = [Articles]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callApi()
    }

    func callApi() {
        let strURL = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=fe79aa80ed7b49f5bdf68592100a2b96"
        
        let url = URL(string: strURL)!
        Alamofire.request(url).responseData { (responseData) in
            do {
                let Data = try JSONDecoder().decode(newsResponse.self, from: responseData.data!)
                self.arrArticles = Data.articles!
                print("self.arrArticles", self.arrArticles)
            } catch let err {
                print(err)
            }
        }
    }
    
}

struct newsResponse: Decodable {
    let status: String?
    let totalResults: Int?
    let articles: [Articles]?
    
}

struct Articles: Decodable {
    let source : Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    
}

struct Source: Decodable {
    let id: String?
    let name: String?
}
