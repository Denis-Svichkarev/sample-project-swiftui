//
//  AuthService.swift
//  SampleProject-SwiftUI
//
//  Created by Denis Svichkarev on 28.09.2024.
//

import Foundation
import Combine

class AuthService {
    static let shared = AuthService()
    
    private init() {}
    
    func login(email: String, password: String) -> AnyPublisher<Bool, Error> {
        let url = URL(string: "https://api.fittrack.com/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = ["email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                // Логика обработки ответа
                return true
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
