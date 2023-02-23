//
//  ConversorView.swift
//  Conversores
//
//  Created by Roberto Filho on 22/02/23.
//

import SwiftUI

struct ConversorView: View {
    @ObservedObject var viewModel: ConversorViewModel
    var body: some View {
        Group {
            ZStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 0, content: {
                    HStack(spacing: 0){
                        Text("\(viewModel.title)")
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity)
                        Button("≫") {
                            viewModel.conversorChange()
                        }
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
                        Button("\(viewModel.btn1)") {
                            viewModel.actionbtn1 = true
                            viewModel.actionbtn2 = false
                            viewModel.calcBtn1()
                            UIApplication.shared.endEditing()
                        }
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.leading)
                        Button("\(viewModel.btn2)") {
                            viewModel.actionbtn1 = false
                            viewModel.actionbtn2 = true
                            viewModel.calcBtn2()
                            UIApplication.shared.endEditing()
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

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ConversorView_Previews: PreviewProvider {
    static var previews: some View {
        ConversorView(viewModel: ConversorViewModel())
    }
}
