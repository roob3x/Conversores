//
//  ConversorView.swift
//  Conversores
//
//  Created by Roberto Filho on 16/02/23.
//

import SwiftUI

struct ConversorView: View {
    @ObservedObject var viewModel: ConversorViewModel
    var body: some View {
        GeometryReader() {_ in
                    ZStack {
                        Color.init(.white)
                            .edgesIgnoringSafeArea(.all)
                        
                    }
            VStack(alignment: .center){
                HStack (spacing: 10){
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("Temperatura")
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 10)
                    Button("≫"){
                        
                    }.frame(maxWidth: 50, maxHeight: 50)
                        .multilineTextAlignment(.leading)
                }
                .foregroundColor(Color.white)
                .font(.title.bold())
                HStack(spacing: 0) {
                    Spacer()
                    TextField("0", text: $viewModel.value)
                        .padding()
                        .lineLimit(1)
                        .font(.system(size: CGFloat(80 / Int((Double)(String(viewModel.result).count + 10) / 8.0))))
                        .foregroundColor(Color.white)
                        .fixedSize(horizontal: true, vertical: false)
                            .background(Color.blue)
                }
                
                
                HStack(alignment: .center) {
                    Button("Celsius") {
                        viewModel.calcCelcius()
                    }
                    Spacer()
                    Button("Firenheint") {
                        viewModel.calcFahrenheit()
                    }
                }.foregroundColor(Color.white)
                    .padding()
                

                HStack(alignment: .center, spacing: 0) {
                    Text("\(String(viewModel.result))")
                        .font(.system(size: 60))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.blue)
                        .frame(height: 70)
                        .background(Color.white)
                }.padding(.vertical, 14)
                
                HStack(alignment: .center, spacing: 0) {
                    Text("\(viewModel.label)")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.blue)
                            .background(Color.white)
                }
                .padding(.vertical, -22)
                
            }.background(Color.blue)
            
                }
    }
}

struct ConversorView_Previews: PreviewProvider {
    static var previews: some View {
        ConversorView(viewModel: ConversorViewModel())
    }
}
