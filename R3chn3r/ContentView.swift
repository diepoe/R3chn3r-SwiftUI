//
//  ContentView.swift
//  R3chn3r
//
//  Created by Dietrich Poensgen on 10.11.20.
//

import SwiftUI

// custom styles
struct NumberButtonStyle: ButtonStyle {
    
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, minHeight: 75)
            .background(configuration.isPressed ? color.opacity(0.5) : color)
            .foregroundColor(Color.white)
            .font(.title)
            .clipShape(Circle())
    }
}



struct NumberTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding()
            .foregroundColor(.white)
            .font(.title)
    }
}


struct ContentView: View {
    @State private var rechnungEingegeben: String=""
    //  @Binding var rechnung: Double
    @State private var ergebnis: Double = 0
    @State private var backend = Backend()
   
    
    var body: some View {
        ZStack {
            Color(.lightGray).ignoresSafeArea()
            VStack(spacing: 10) {
                HStack {
                    TextField("", text: $rechnungEingegeben).textFieldStyle(NumberTextFieldStyle()).keyboardType(.decimalPad)
                    if ergebnis.isNormal {
                        Text(String(ergebnis)).font(.largeTitle).foregroundColor(.orange)
                    }
                }
                
                Spacer()
                HStack{
                    
                    Button(action: {
                            self.rechnungEingegeben = ""
                            self.ergebnis = 0
                    }){Image(systemName: "trash").imageScale(.small).foregroundColor(.orange)}.buttonStyle(NumberButtonStyle(color: .gray))
                    
                    Button(action: {self.rechnungEingegeben += ""}){Image(systemName: "x.squareroot").imageScale(.small)}.buttonStyle(NumberButtonStyle(color: .gray))
                    
                    Button(action: {
                            self.rechnungEingegeben += ""
                        let format: Double? = Double(rechnungEingegeben)
                        ergebnis = format! / 100
                    }){Image(systemName: "percent").imageScale(.small)}.buttonStyle(NumberButtonStyle(color: .gray))
                    
                    Button(action: {self.rechnungEingegeben += "/"}){Image(systemName: "divide").imageScale(.small)}.buttonStyle(NumberButtonStyle(color: .orange))
                }
//                Spacer()
                HStack {
                    Button(action: {self.rechnungEingegeben += "7"}){Text("7")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "8"}){Text("8")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "9"}){Text("9")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "*"}){Image(systemName: "multiply").imageScale(.small)}.buttonStyle(NumberButtonStyle(color: .orange))
                
                }
//                Spacer()
                HStack {
                    Button(action: {self.rechnungEingegeben += "4"}){Text("4")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "5"}){Text("5")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "6"}){Text("6")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "-"}){Image(systemName: "minus").imageScale(.small)}.buttonStyle(NumberButtonStyle(color: .orange))
                }
//                Spacer()
                HStack {
                    Button(action: {self.rechnungEingegeben += "1"}){Text("1")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "2"}){Text("2")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "3"}){Text("3")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "+"}){Image(systemName: "plus").imageScale(.small)}.buttonStyle(NumberButtonStyle(color: .orange))
                }
//                Spacer()
                HStack {
                    
                    Button(action: {self.rechnungEingegeben += "( )"}){Text("( )")}.buttonStyle(NumberButtonStyle(color: .gray))
                    
                    Button(action: {self.rechnungEingegeben += "0"}){Text("0")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "."}){Text(",")}.buttonStyle(NumberButtonStyle(color: .gray))
                    
        
                    
                    Button(action: {
                        backend.performOperation("+")
                        if backend.endergebnis != nil {
                            ergebnis = backend.endergebnis!
                            }
                        
                    }){Image(systemName: "equal").imageScale(.small)}.buttonStyle(NumberButtonStyle(color: .orange))
                }
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
