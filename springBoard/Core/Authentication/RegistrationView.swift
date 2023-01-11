//
//  RegistrationView.swift
//  springBoard
//
//  Created by Ojas Mehta on 1/9/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var phonenumber = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var AuthViewModel: AuthViewModel
    
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack { Spacer() }
                Text("Get Started With")
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
                TextField("Username", text: $username)
                TextField("Phone Number", text: $phonenumber)
                SecureField("Password", text: $password)
            }
            .padding(.horizontal, 32.0)
            .padding(.top, 48)
            
            Button {
                AuthViewModel.register(withEmail: email, password: password, phonenumber: phonenumber, username: username)
            } label: {
                Text("Register")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color(.black))
                    .clipShape(Capsule())
                    .padding(.all)
            }
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.footnote)
                    Text("Sign in")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .padding(.bottom, 48)
            }
            
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
