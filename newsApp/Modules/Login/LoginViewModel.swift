//
//  SignInViewModel.swift
//  newsApp
//
//  Created by User on 19.10.21.
//

import UIKit

class LoginViewModel {
    
    @Published var user: [LoginModel] = [] {
        didSet {
            saveUser()
        }
    }
    
    init() {
        getUser()
    }
    
    func getUser() {
        guard let data = UserDefaults.standard.data(forKey: "user"), let savedItems = try? JSONDecoder().decode([LoginModel].self, from: data)
        else { return }

        self.user = savedItems
    }
    
    func addUser(code: String, date: String, isLogout: Bool) {
        let data = LoginModel(code: code, date: date, isLogout: isLogout)
        user.append(data)
    }
    
    func updateUser(item: LoginModel) {
       user[0] = item.updateCompletion()
    }
    
    func saveUser() {
        if let encodedData = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encodedData, forKey: "user")
        }
    }
}
