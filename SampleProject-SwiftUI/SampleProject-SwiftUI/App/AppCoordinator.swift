//
//  AppCoordinator.swift
//  SampleProject-SwiftUI
//
//  Created by Denis Svichkarev on 28.09.2024.
//

import Foundation

enum AppRoute {
    case home
    case search
}

class AppCoordinator: ObservableObject {
    @Published var navigateToHome = false
    @Published var navigateToSearch = false
    
    func navigate(to route: AppRoute) {
        switch route {
        case .home:
            navigateToHome = true
        case .search:
            navigateToSearch = true
        }
    }
}
