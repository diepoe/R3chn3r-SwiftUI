//
//  ContentView.swift
//  R3chn3r
//
//  Created by Dietrich Poensgen on 10.11.20.
//

import SwiftUI
import Darwin

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
            .frame(minHeight: 100)
            .ignoresSafeArea(edges: .top)

    }
}


struct ContentView: View {
    @State private var rechnungEingegeben: String=""
    //  @Binding var rechnung: Double
    @State private var ergebnis: String = ""
    @State private var menu: Bool = false
    
    
    var body: some View {
        ZStack {
            Color(.lightGray).ignoresSafeArea()
            VStack(spacing: 10) {
                // Stack with the input and result field
                HStack {
                    TextField("", text: $rechnungEingegeben).textFieldStyle(NumberTextFieldStyle()).keyboardType(.decimalPad)
                   
                    Text(ergebnis).font(.largeTitle).foregroundColor(Color(.systemOrange))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                }
                
                Spacer()
                
                // invisible line with buttons with special characters
                if menu {
                    HStack {
                        Button(action: {self.rechnungEingegeben += "√"}){Image(systemName: "x.squareroot").imageScale(.small)}.buttonStyle(NumberButtonStyle(color: .gray))
                        
                        Button(action: {self.rechnungEingegeben += String(Double.pi)}){Text("π")}.buttonStyle(NumberButtonStyle(color: .gray))
                        
                        Button(action: {self.rechnungEingegeben += "^"}){Text("^")}.buttonStyle(NumberButtonStyle(color: .gray))
                        
                        Text("trig")
                            .frame(maxWidth: .infinity, minHeight: 75)
                            .background(Color.gray)
                            .foregroundColor(Color.white)
                            .font(.title)
                            .clipShape(Circle())
                            .contextMenu {
                            Button(action: {self.rechnungEingegeben += "sin"}){Text("sin")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                            
                            Button(action: {self.rechnungEingegeben += "cos"}){Text("cos")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                                
                            Button(action: {self.rechnungEingegeben += "tan"}){Text("tan")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                        }
                    
                    }
                }
                
                // first visble line of buttons
                HStack{
                    
                    Button(action: {
                            self.rechnungEingegeben = ""
                            self.ergebnis = ""
                    }){Image(systemName: "trash").imageScale(.small).foregroundColor(.orange)}.buttonStyle(NumberButtonStyle(color: .gray))
                    
                    // button that toggles the first invisible line of buttons with the special characters
                    Button(action: {self.menu = !self.menu}){Image(systemName: "plus.slash.minus").imageScale(.small)}.buttonStyle(NumberButtonStyle(color: .gray))
                    
                    Button(action: {
                        if self.rechnungEingegeben == "" {
                            ergebnis = "undef"
                        }
                        else {
                            self.rechnungEingegeben += ""
                            let format: Double? = Double(rechnungEingegeben)
                            ergebnis = String(format! / 100)

                        }
                    }){Image(systemName: "percent").imageScale(.small)}.buttonStyle(NumberButtonStyle(color: .gray))
                    
                    Button(action: {self.rechnungEingegeben += "/"}){Image(systemName: "divide").imageScale(.small)}.buttonStyle(NumberButtonStyle(color: .orange))
                }
//                Spacer()
                // second line of buttons
                HStack {
                    Button(action: {self.rechnungEingegeben += "7"}){Text("7")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "8"}){Text("8")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "9"}){Text("9")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "*"}){Image(systemName: "multiply").imageScale(.small)}.buttonStyle(NumberButtonStyle(color: .orange))
                
                }
//                Spacer()
                // third line of buttons
                HStack {
                    Button(action: {self.rechnungEingegeben += "4"}){Text("4")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "5"}){Text("5")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "6"}){Text("6")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "-"}){Image(systemName: "minus").imageScale(.small)}.buttonStyle(NumberButtonStyle(color: .orange))
                }
//                Spacer()
                // fourth line of buttons
                HStack {
                    Button(action: {self.rechnungEingegeben += "1"}){Text("1")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "2"}){Text("2")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "3"}){Text("3")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "+"}){Image(systemName: "plus").imageScale(.small)}.buttonStyle(NumberButtonStyle(color: .orange))
                }
//                Spacer()
                // fith line of buttons
                HStack {
                    
                    Text("( )")
                        .frame(maxWidth: .infinity, minHeight: 75)
                        .background(Color(.darkGray))
                        .foregroundColor(Color.white)
                        .font(.title)
                        .clipShape(Circle())
                        .contextMenu {
                        Button(action: {self.rechnungEingegeben += "("}){Text("(")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                        
                        Button(action: {self.rechnungEingegeben += ")"}){Text(")")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    }
                    
                    
                    
                    Button(action: {self.rechnungEingegeben += "0"}){Text("0")}.buttonStyle(NumberButtonStyle(color: Color(.darkGray)))
                    
                    Button(action: {self.rechnungEingegeben += "."}){Text(",")}.buttonStyle(NumberButtonStyle(color: .gray))
                    
        
                    // equal button who calls the backend calculation process at backend.swift 
                    Button(action: {
                        ergebnis = Backend(rawData: rechnungEingegeben)
                        
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
