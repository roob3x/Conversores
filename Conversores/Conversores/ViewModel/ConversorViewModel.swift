//
//  ConversorViewModel.swift
//  Conversores
//
//  Created by Roberto Filho on 17/02/23.
//

import SwiftUI
import Combine

class ConversorViewModel: ObservableObject {
    
    @Published var value: String = ""
    @Published var result: Double = 0.0
    @Published var label: String = ""
    
    init() {
        
    }
    
    
    func calcFahrenheit () {
        result = (Double(value)! * 9/5) + 32
        label = "Fahrenheit"
    }
    
    func calcCelcius () {
        
        result = (Double(value)!)
        label = "Celsius"

    }
    
    
}
  
