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
    @Published var actionbtn1: Bool = false
    @Published var actionbtn2: Bool = false
    
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
            btn1 = "Kilometro"
            btn2 = "Metros"
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
        switch self.btn1 {
        case "Celsius":
            calcFahrenheit()
        case "Kilograma":
            weightCalc()
        case "Real":
            calcDolar()
        case "Kilometro":
            distanceCalc()
        default:
            calcFahrenheit()
        }
            label = self.btn2
    }
    
    func calcBtn2() {
        switch self.btn2 {
        case "Farenheint":
            calcFahrenheit()
        case "Libra":
            weightCalc()
        case "Dolar":
            calcDolar()
        case "Metros":
            distanceCalc()
        default:
            calcFahrenheit()
        }
        label = self.btn1
    }
    
    func distanceCalc() {
        if btn1 == "Kilometro" && actionbtn1 == true {
            result = Double(value)! * 1000
        }
        else {
            result = Double(value)! / 1000
        }
    }
    
    func weightCalc() {
        if btn1 == "Kilograma" && actionbtn1 == true {
            result = (Double(value)! * 2.2046)
        }
        else {
            result = (Double(value)! / 2.2046)
        }
    }
    
    func calcDolar() {
        if btn1 == "Real" && actionbtn1 == true {
            result = (Double(value)! / 5.15)
        }
        else {
            result = (Double(value)! * 5.15)
        }
    }
    
    
    func calcFahrenheit () {
        if btn1 == "Celsius" && actionbtn1 == true {
            result = (Double(value)! - 32.0) / 18
        }
        else {
            result = Double(value)! * 1.8 + 32.0
        }
    }
    
}
  
