//
//  WelcomeView.swift
//  SampleProject-SwiftUI
//
//  Created by Denis Svichkarev on 28.09.2024.
//

import SwiftUI

struct WelcomeView: View {
    @StateObject var coordinator = AppCoordinator()
    
    @State private var showCustomSheet = true
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: HomeView(), isActive: $coordinator.navigateToHome) {
                    EmptyView()
                }
                .hidden()
                
                Button("SKIP") {
                    coordinator.navigate(to: .home)
                }
                .padding(24)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                
                LoginSheetView(show: $showCustomSheet, isGestureEnabled: false)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
