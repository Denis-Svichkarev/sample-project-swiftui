//
//  LoginSheetView.swift
//  SampleProject-SwiftUI
//
//  Created by Denis Svichkarev on 05.10.2024.
//

import SwiftUI

struct LoginSheetView: View {
    @Binding var show: Bool
    @State private var offsetY: CGFloat = 0
    @State private var lastDragValue: CGFloat = 0
    var isGestureEnabled: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                VStack {
                    HStack {
                        Spacer()
                        Text("Welcome")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding()

                    Text("Let's start with your phone number")
                        .padding()
                    
                    Spacer()
                }
                .frame(height: geometry.size.height * 0.8)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .offset(y: max(offsetY, 0))
                .gesture(isGestureEnabled ? dragGesture : nil)
            }
            .edgesIgnoringSafeArea(.bottom)
            .onAppear {
                resetOffsets()
            }
        }
    }
    
    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                offsetY = value.translation.height + lastDragValue
            }
            .onEnded { value in
                if offsetY > 150 {
                    withAnimation(.spring()) {
                        show = false
                        resetOffsets()
                    }
                } else {
                    withAnimation(.spring()) {
                        offsetY = 0
                    }
                }
                lastDragValue = offsetY
            }
    }
    
    private func resetOffsets() {
        offsetY = 0
        lastDragValue = 0
    }
}
