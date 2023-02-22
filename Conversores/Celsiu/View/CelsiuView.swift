//
//  CelsiuView.swift
//  Conversores
//
//  Created by Roberto Filho on 21/02/23.
//

import SwiftUI

struct CelsiuView: View {
    @ObservedObject var viewModel: ConversorViewModel
    var body: some View {
        Group {
            ZStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 0, content: {
                    HStack(spacing: 0){
                        Text("Temperatura")
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity)
                        Text("≫")
                            .padding()
                            .multilineTextAlignment(.trailing)
                    }
                    .foregroundColor(Color.white)
                    .font(.title.bold())
                    .background(Color.blue)
                    HStack{
                        TextField("0", text: $viewModel.value)
                            .padding()
                            .multilineTextAlignment(.center)
                            .font(.system(size: 60, weight: .semibold, design: .serif))
                            .foregroundColor(Color.white)
                                .background(Color.blue)
                    }
                    
                    HStack(spacing: 0) {
                        Button("Celsius") {
                            viewModel.calcCelcius()
                        }
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.leading)
                        Button("Firenheint") {
                            viewModel.calcFahrenheit()
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical, 20)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    
                    HStack(spacing: 0) {
                        Text("\(String(viewModel.result))")
                            .font(.system(size: 60))
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.blue)
                            .frame(height: 70)
                            .background(Color.white)
                    }
                    .padding()
                    HStack(alignment: .center, spacing: 0) {
                        Text("\(viewModel.label)")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.blue)
                                .background(Color.white)
                    }
                    
                    
                    Spacer()
                })

            }
        }
    }
}

struct CelsiuView_Previews: PreviewProvider {
    static var previews: some View {
        CelsiuView(viewModel: ConversorViewModel())
    }
}
