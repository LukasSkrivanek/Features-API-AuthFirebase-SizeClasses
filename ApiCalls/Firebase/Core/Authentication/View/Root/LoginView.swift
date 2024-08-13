//
//  LoginView.swift
//  ApiCalls
//
//  Created by macbook on 06.08.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack {
            VStack {
                
                // image
                Image("firebaseLogo")
                    .resizable()
                    .frame(width: 140, height: 150)
                

                
                // form fields
                VStack(spacing: 24) {
                    InputView(text: $email, title: "Email Adress", placeHolder: "name@example.com")
                        .autocapitalization(.none)
                    
                    InputView(text: $password, title: "passwor", placeHolder: "Enter  your password", isSecured: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                         
                
                // sign in button
                Button(action: {
                    
                }, label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    
                })
                .foregroundStyle(.white)
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                // sign up button
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 2) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                    
                }

                
                
                
            }
        }
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
