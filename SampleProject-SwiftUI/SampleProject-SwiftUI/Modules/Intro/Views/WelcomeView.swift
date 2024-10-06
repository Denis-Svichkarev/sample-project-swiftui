//
//  WelcomeView.swift
//  SampleProject-SwiftUI
//
//  Created by Denis Svichkarev on 28.09.2024.
//

import SwiftUI

struct WelcomeView: View {
    @State private var showCustomSheet = true

    var body: some View {
        if showCustomSheet {
            LoginSheetView(show: $showCustomSheet, isGestureEnabled: false)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
