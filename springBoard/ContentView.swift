//
//  ContentView.swift
//  springBoard
//
//  Created by Ojas Mehta on 12/27/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            }
            else {
                ZStack {
                    MainTabView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
