//
//  SplashViewModel.swift
//  Conversores
//
//  Created by Roberto Filho on 17/02/23.
//

import SwiftUI
import Combine

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUiState = .loading
    
    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.uiState = .goToConversors
        }
    }
}

extension SplashViewModel {
    func conversoresView() -> some View {
        return SplashViewRouter.makeConversorView()
    }
}
