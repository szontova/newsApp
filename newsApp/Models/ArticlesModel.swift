//
//  ArticlesModel.swift
//  newsApp
//
//  Created by User on 20.10.21.
//

import Foundation

struct ArticlesModel: Codable {
    let articles: [NewsModel]
    
    enum CodingKeys: String, CodingKey {
      case articles

    }
    func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      try container.encode(articles, forKey: .articles)
    }
    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
        articles = try container.decode([NewsModel].self, forKey: .articles)
    }
}
