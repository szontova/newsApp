//
//  MainViewModel.swift
//  newsApp
//
//  Created by User on 25.10.21.
//

import Foundation

import UIKit

class MainViewModel {
    
    @Published var user: [UserModel] = []
    
    init() {
        getUser()
    }
    
    func getUser() {
        guard let data = UserDefaults.standard.data(forKey: "user"), let savedItems = try? JSONDecoder().decode([UserModel].self, from: data)
        else { return }

        self.user = savedItems
    }
    
}
