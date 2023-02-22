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
    @Published var title: String = "Temperatura"
    @Published var btn1: String = "Celsius"
    @Published var btn2: String = "Fahrenheit"
    
    init() {
        
    }
    
    @Published var uiState: ConversorModel = .goToTemperature
    
    func conversorChange() {
        switch uiState {
        case .goToTemperature:
            title = "Peso"
            btn1 = "Kilograma"
            btn2 = "Libra"
            value = "0"
            result = 0.0
            label = ""
            self.uiState = .goToWeight

        case .goToWeight:
            title = "Moeda"
            btn1 = "Real"
            btn2 = "Dolar"
            value = "0"
            result = 0.0
            label = ""
            self.uiState = .goToCoin

        case .goToCoin:
            title = "Distancia"
            btn1 = "Metro"
            btn2 = "Kilometro"
            value = "0"
            result = 0.0
            label = ""
            self.uiState = .goToTemperature

        default:
            title = "Temperatura"
            btn1 = "Celsius"
            btn2 = "Farenheint"
            value = "0"
            result = 0.0
            label = ""

        }
    }
    
    func calcBtn1() {
        result = (Double(value)!)
        label = self.btn1
    }
    
    func calcBtn2() {
        switch self.title {
        case "Temperatura":
            calcFahrenheit()
        case "Peso":
            weightCalc()
        case "Moeda":
            calcDolar()
        case "Distancia":
            distanceCalc()
        default:
            calcFahrenheit()
        }
        label = self.btn2
    }
    
    func distanceCalc() {
        result = (Double(value)! / 1000)
    }
    
    func weightCalc() {
        result = (Double(value)! * 2.2046)
    }
    
    func calcDolar() {
        result = (Double(value)! * 5.15)
    }
    
    
    func calcFahrenheit () {
        result = (Double(value)! * 9/5) + 32
    }
    
}
  
