//
//  RegistrationView.swift
//  ApiCalls
//
//  Created by macbook on 06.08.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            
            // image
            Image("firebaseLogo")
                .resizable()
                .frame(width: 140, height: 150)
            
            
            
            // form fields
            VStack(spacing: 24) {
                InputView(text: $email, title: "Email Adress", placeHolder: "name@example.com")
                    .autocapitalization(.none)
                
                InputView(text: $fullname, title: "Full Name", placeHolder: "Enter your name")
                    .autocapitalization(.none)

                
                InputView(text: $password, title: "Password", placeHolder: "Enter  your password", isSecured: true)
                
                InputView(text: $confirmPassword, title: "Confirm password", placeHolder: "Confirm  your password", isSecured: true)
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            
            Button(action: {
                
            }, label: {
                HStack {
                    Text("SIGN UP")
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
            
            Button {
               dismiss()
            } label: {
                HStack(spacing: 2) {
                    Text("Already Have account")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
                
            }
        }
    }
}

#Preview {
    RegistrationView()
}
