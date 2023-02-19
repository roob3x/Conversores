//
//  SplashView.swift
//  Conversores
//
//  Created by Roberto Filho on 16/02/23.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        
        Group {
            switch viewModel.uiState {
            case .loading:
                LoadingView()
            case .goToConversors:
                viewModel.conversosView()
            }
        }
        .onAppear(perform: viewModel.onAppear)
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Image("LaunchScreen")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(viewModel: SplashViewModel())
    }
}
