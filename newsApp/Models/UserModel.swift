//
//  SignInModel.swift
//  newsApp
//
//  Created by User on 19.10.21.
//

import UIKit

struct UserModel: Codable {    
    var code: String
    var date: String
    var isLogout: Bool
    
    init(code: String, date: String, isLogout: Bool) {
        self.code = code
        self.date = date
        self.isLogout = isLogout
    }
    
    func updateCompletion() -> UserModel {
        return UserModel(code: code, date: date, isLogout: isLogout)
    }
}
