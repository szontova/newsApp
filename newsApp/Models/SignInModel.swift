//
//  SignInModel.swift
//  newsApp
//
//  Created by User on 19.10.21.
//

import UIKit

struct SignInModel: Codable {    
    let code: String
    let date: String
    
    init(code: String, date: String) {
        self.code = code
        self.date = date
    }
    
    func updateCompletion() -> SignInModel {
        return SignInModel(code: code, date: date)
    }
}
