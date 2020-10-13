//
//  LoginView.swift
//  Tiktok
//
//  Created by Indra on 06/10/20.
//  Copyright © 2020 Balaji. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authState: AuthenticationState
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        ScrollView{
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                VStack(alignment: .leading){
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .padding()
                        TextField("User Name", text: $username)
                            .textContentType(.username)
                            .frame( height: 40)
                            .colorInvert()
                            .background(Color.gray)
                        
                            
                        
                    }
                    .background(Color.gray)
                    Text("Enter your username").foregroundColor(Color.gray)
                }
                .padding()
                
                VStack(alignment:.leading){
                    HStack {
                        Image(systemName: "lock").foregroundColor(Color.white)
                            .background(Color.gray)
                            .padding()
                        SecureField("Password", text: $password)
                            .textContentType(.password)
                            .frame( height: 40)
                            .colorInvert()
                            .background(Color.gray)
                        
                    }
                    .background(Color.gray)
                    
                    Text("Enter your password").foregroundColor(Color.gray)
                }
                .padding()
                
                VStack(spacing:20){
                    Button("LOGIN") {
                        emailAuthenticationTapped()
                    }
                    .frame(width: 250, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(25)
                    
                    
                    Button(action: {
                        guestAuthenticationTapped()
                    }){
                        HStack {
                            Text("Login as Guest")
                        }
                        .frame(minWidth: 0, maxWidth: 250)
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.green, lineWidth: 1)
                        )
                    }
                }
                
            }
        }
        .background(Color.black)
    }

    private func emailAuthenticationTapped(){
        authState.login(with: .withEmail(email: username, password: password))
    }
    
    private func guestAuthenticationTapped(){
        authState.login(with: .asGuest)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
