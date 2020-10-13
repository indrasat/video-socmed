//
//  AuthenticationState.swift
//  gowaslu
//
//  Created by Indra on 10/07/20.
//  Copyright © 2020 Indra. All rights reserved.
//

import UIKit
import AuthenticationServices
import Combine

enum LoginOption {
    case asGuest
    case withEmail(email: String, password: String)
    case withPhoneNumber(phoneNumber: String)
}

class AuthenticationState: NSObject, ObservableObject {
    @Published var loggedInUserData: User?
    @Published var loggedInUser: Bool = false
    @Published var isAuthenticating = false
    @Published var error: NSError?
    @Published var isShowError: Bool = false
    @Published var isRedirectToLogin = false
    
    static let shared = AuthenticationState()
    
    private let userDefault = UserDefaults.standard
    
    override private init() {
        super.init()
        let isUserLoggedIn = userDefault.bool(forKey: "isUserLoggedIn")
        loggedInUser = isUserLoggedIn
    }
    
    func login(with loginOption: LoginOption){
        self.isAuthenticating = true
        self.error = nil
        
        switch loginOption {
        case let .withEmail(email, password):
            handleSignInWithEmail(email: email, password: password)
        case let .withPhoneNumber(phoneNumber):
            handleSignInWithPhoneNumber(with: phoneNumber)
        case .asGuest:
            loggedInAsGuest()
        }
    }
    
    private func handleSignInWithEmail(email: String, password: String){
        if email == "guest" && password == "12345678" {
            userDefault.set(true, forKey: "isUserLoggedIn")
            loggedInUser = true
            loggedInUserData = User(id: 1, name: "Dummy")
        }
    }
    
    private func loggedInAsGuest(){
        self.userDefault.set(true, forKey: "isUserLoggedIn")
        loggedInUser = true
    }
    
    private func handleSignInWithPhoneNumber(with phoneNumber: String){
        
    }
    
    func logout(){
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        loggedInUser = false
    }
}
