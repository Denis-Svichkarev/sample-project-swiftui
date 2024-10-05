//
//  IntroView.swift
//  SampleProject-SwiftUI
//
//  Created by Denis Svichkarev on 28.09.2024.
//

import SwiftUI

struct IntroView: View {
    @State private var showCustomSheet = true

    var body: some View {
        ZStack {
            if showCustomSheet {
                LoginSheetView(show: $showCustomSheet, isGestureEnabled: false)
                    .transition(.move(edge: .bottom))
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
