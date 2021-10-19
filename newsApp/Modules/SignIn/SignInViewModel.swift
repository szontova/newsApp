//
//  SignInViewModel.swift
//  newsApp
//
//  Created by User on 19.10.21.
//

import UIKit

class SignInViewModel {
    
    @Published var user: [SignInModel] = [] {
        didSet {
            saveUser()
        }
    }
    
    init() {
        getUser()
    }
    
    func getUser() {
        guard
            let data = UserDefaults.standard.data(forKey: "user"),
            let savedItems = try? JSONDecoder().decode([SignInModel].self, from: data)
        else { return }

        self.user = savedItems
    }
    
    func addUser(code: String, date: String) {
        let data = SignInModel(code: code, date: date)
        user.append(data)
    }
    
    func updateUser(item: SignInModel) {
//       users[index] = item.updateCompletion()
    }
    
    func saveUser() {
        if let encodedData = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encodedData, forKey: "user")
        }
    }
}
