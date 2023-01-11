//
//  SocialView.swift
//  springBoard
//
//  Created by Ojas Mehta on 1/9/23.
//

import SwiftUI

struct SocialView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Button {
            viewModel.signOut()
        } label: {
            Text("Sign Out")
                .bold()
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color(.black))
                .foregroundColor(.white)
                .clipShape(Capsule())
        }
    }
}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}
