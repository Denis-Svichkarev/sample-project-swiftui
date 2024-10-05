//
//  AuthViewModel.swift
//  SampleProject-SwiftUI
//
//  Created by Denis Svichkarev on 28.09.2024.
//

import SwiftUI
import Combine

class AuthViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    func login() {
        if email.isEmpty || password.isEmpty {
            errorMessage = "Please fill in all fields."
            return
        }

        AuthService.shared.login(email: email, password: password)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { success in
                if success {
                    self.errorMessage = ""
                    // Navigate to the HomeView or set logged-in state
                } else {
                    self.errorMessage = "Invalid email or password."
                }
            }
            .store(in: &cancellables)
    }

    func navigateToSignup() {
        // Implement navigation to the Signup screen
    }

    func navigateToForgotPassword() {
        // Implement navigation to the Forgot Password screen
    }
}
