//
//  HomeView.swift
//  SampleProject-SwiftUI
//
//  Created by Denis Svichkarev on 28.09.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var coordinator = AppCoordinator()
    
    @State private var showCustomSheet = false

    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: SearchView(), isActive: $coordinator.navigateToSearch) {
                    EmptyView()
                }
                .hidden()
                
                VStack {
                    HStack {
                        Button(action: {
                            withAnimation(.spring()) {
                                showCustomSheet.toggle()
                            }
                        }) {
                            Text("Login")
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                        
                        Button("What can we get you?") {
                            coordinator.navigate(to: .search)
                        }
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        
                        Button(action: {
                            withAnimation(.spring()) {
                                showCustomSheet.toggle()
                            }
                        }) {
                            Text("Cart")
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                    }
                    Spacer()
                }
                .blur(radius: showCustomSheet ? 3 : 0)
                .animation(.easeInOut, value: showCustomSheet)
                .padding(16)
                
                if showCustomSheet {
                    Color.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                showCustomSheet = false
                            }
                        }
                    
                    LoginSheetView(show: $showCustomSheet, isGestureEnabled: true)
                        .transition(.move(edge: .bottom))
                }
            }
        }.navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
