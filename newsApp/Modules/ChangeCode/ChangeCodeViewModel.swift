//
//  ChangeCodeViewModel.swift
//  newsApp
//
//  Created by User on 25.10.21.
//

import UIKit

class ChangeCodeViewModel {
    
    @Published var user: [UserModel] = [] {
        didSet {
            saveUser()
        }
    }
    
    init() {
        getUser()
    }
    
    func getUser() {
        guard let data = UserDefaults.standard.data(forKey: "user"), let savedItems = try? JSONDecoder().decode([UserModel].self, from: data)
        else { return }
        
        self.user = savedItems
    }
    
    func updateUser(item: UserModel) {
       user[0] = item.updateCompletion()
    }

    func saveUser() {
        if let encodedData = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encodedData, forKey: "user")
        }
    }
}
