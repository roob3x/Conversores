//
//  SplashViewRouter.swift
//  Conversores
//
//  Created by Roberto Filho on 17/02/23.
//

import SwiftUI

enum SplashViewRouter {
    static func makeConversorView() -> some View {
        return CelsiuView(viewModel: ConversorViewModel())
    }
}
