//
//  LoadingView.swift
//  SampleProject-SwiftUI
//
//  Created by Denis Svichkarev on 28.09.2024.
//

import SwiftUI

struct LoadingView<Content: View>: View {
    @Binding var isLoading: Bool
    let content: () -> Content
    
    var body: some View {
        ZStack {
            content()
                .disabled(isLoading)
                .blur(radius: isLoading ? 3 : 0)
            
            if isLoading {
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                    Text("Loading...")
                        .foregroundColor(.secondary)
                        .padding(.top)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.1))
                .transition(.opacity)
            }
        }
        .animation(.default, value: isLoading)
    }
}

struct LoadingModifier: ViewModifier {
    let isLoading: Bool
    
    func body(content: Content) -> some View {
        LoadingView(isLoading: .constant(isLoading)) {
            content
        }
    }
}

extension View {
    func loading(_ isLoading: Bool) -> some View {
        modifier(LoadingModifier(isLoading: isLoading))
    }
}
