//
//  HomeView.swift
//  SampleProject-SwiftUI
//
//  Created by Denis Svichkarev on 28.09.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var showCustomSheet = true

    var body: some View {
        ZStack {
            VStack {
                Text("Основной экран")
                    .font(.largeTitle)
                    .padding()
                
                Button(action: {
                    withAnimation(.spring()) {
                        showCustomSheet.toggle()
                    }
                }) {
                    Text("Показать кастомное окно")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .blur(radius: showCustomSheet ? 3 : 0)
            .animation(.easeInOut, value: showCustomSheet)
            
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
