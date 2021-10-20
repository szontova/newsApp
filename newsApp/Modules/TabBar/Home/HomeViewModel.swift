//
//  HomeViewModel.swift
//  newsApp
//
//  Created by User on 20.10.21.
//

import Alamofire
import Foundation

class HomeViewModel {
    public var news: [NewsModel] = []
    
    init() {
        getNews()
    }
    
    func getNews() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=4812833d0d0345e4be9d3fd2efb9ff84") else {
                return
            }
        let request = AF.request(url)
        request.responseJSON(completionHandler: { response in
            debugPrint(response)
            print("Result of Reponse Serialization \(response.result)")
    })
      
    }
    
}
