//
//  springBoardApp.swift
//  springBoard
//
//  Created by Ojas Mehta on 12/27/22.
//

import SwiftUI
import Firebase

@main
struct springBoardApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
