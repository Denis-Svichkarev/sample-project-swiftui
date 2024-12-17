//
//  CodeConfirmView.swift
//  SampleProject-SwiftUI
//
//  Created by Denis Svichkarev on 06.10.2024.
//

import SwiftUI

struct CodeConfirmView: View {
    @State private var isLoading = false
    @State private var code = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter code", text: $code)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Confirm Code") {
                isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLoading = false
                }
            }
            .disabled(code.isEmpty)
        }
        .padding()
        .loading(isLoading)
    }
}

#Preview {
    CodeConfirmView()
}
