//
//  NewsModel.swift
//  newsApp
//
//  Created by User on 20.10.21.
//

import Foundation


class NewsModel {
    let title: String
    let description: String
    let date: Date
    let source: String
    let link: URL?

    
    init(title: String, description: String, date: Date, source: String, link: URL?) {
        self.title = title
        self.description = description
        self.date = date
        self.source = source
        self.link = link
    }
}
