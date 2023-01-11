//
//  LoginView.swift
//  springBoard
//
//  Created by Ojas Mehta on 1/9/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var AuthViewModel: AuthViewModel
    
    
    var body: some View {
//        NavigationView{
        VStack {
            VStack(alignment: .leading) {
                HStack { Spacer() }
                Text("Welcome Back to")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                Text("SpringBoard.")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
            }
            .padding(.all)
            .frame(height: 280)
            .background(Color(.black))
            .foregroundColor(.white)
            
            
            
            VStack(spacing: 40) {
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
            }
            .padding(.horizontal, 32.0)
            .padding(.top, 48)
            
            Button {
                AuthViewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign in")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color(.black))
                    .clipShape(Capsule())
                    .padding(.all)
            }
            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                    Text("Register Now")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .padding(.bottom, 48)
            }
            
        }
        .ignoresSafeArea()
    }
//    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
