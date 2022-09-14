//
//  UserSettings.swift
//  Nfact
//
//  Created by 송영모 on 2022/09/15.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    static let shared = UserSettings()
    
    @Published var firstWalletAddress: String {
        didSet {
            UserDefaults.standard.set(firstWalletAddress, forKey: "firstWalletAddress")
        }
    }
    
    @Published var secondWalletAddress: String {
        didSet {
            UserDefaults.standard.set(secondWalletAddress, forKey: "secondWalletAddress")
        }
    }
    
    @Published var thirdWalletAddress: String {
        didSet {
            UserDefaults.standard.set(thirdWalletAddress, forKey: "thirdWalletAddress")
        }
    }
    
    private init() {
        self.firstWalletAddress = UserDefaults.standard.object(forKey: "firstWalletAddress") as? String ?? ""
        self.secondWalletAddress = UserDefaults.standard.object(forKey: "secondWalletAddress") as? String ?? ""
        self.thirdWalletAddress = UserDefaults.standard.object(forKey: "thirdWalletAddress") as? String ?? ""
    }
}
