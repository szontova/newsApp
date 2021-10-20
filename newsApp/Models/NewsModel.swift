//
//  NewsModel.swift
//  newsApp
//
//  Created by User on 20.10.21.
//

import Foundation

struct NewsModel: Codable {
    var title: String
    var description: String
    var url: String
    var urlToImage: String

    enum CodingKeys: String, CodingKey {
      case title
      case description
      case url
      case urlToImage
    }
    func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      try container.encode(title, forKey: .title)
      try container.encode(description, forKey: .description)
      try container.encode(url, forKey: .url)
      try container.encode(urlToImage, forKey: .urlToImage)
    }
    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        url = try container.decode(String.self, forKey: .url)
        urlToImage = try container.decode(String.self, forKey: .urlToImage)
    }
}
