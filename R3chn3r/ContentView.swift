//
//  ContentView.swift
//  R3chn3r
//
//  Created by Dietrich Poensgen on 10.11.20.
//

import SwiftUI

struct NumberButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, minHeight: 75)
            .background(Color(.darkGray))
            .foregroundColor(Color(.white))
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
            
            
    }
}

struct ZeroNumberButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, minHeight: 75)
            .background(Color(.darkGray))
            .foregroundColor(Color(.white))
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .clipShape(Rectangle())
            .cornerRadius(40)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
            
            
    }
}


struct OrangeNumberButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, minHeight: 75)
            .background(Color(.orange))
            .foregroundColor(Color(.white))
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
            
            
    }
}

struct LightNumberButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, minHeight: 75)
            .background(Color(.gray))
            .foregroundColor(Color(.white))
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
            
            
    }
}


struct ContentView: View {
    @State var rechnungEingegeben: String=""
    //  @Binding var rechnung: Double
   
    
    var body: some View {
        VStack {
            Form {
                HStack {
                    TextField("Rechnung", text: $rechnungEingegeben)
                }
            }.frame(maxWidth: .infinity, maxHeight: 80).background(Color(.gray))
            
            HStack{
                
                Button(action: {self.rechnungEingegeben = ""}){Image(systemName: "trash").imageScale(.small)}.buttonStyle(LightNumberButtonStyle())
                
                Button(action: {self.rechnungEingegeben = ""}){Image(systemName: "trash").imageScale(.small)}.buttonStyle(LightNumberButtonStyle())
                
                Button(action: {self.rechnungEingegeben = ""}){Image(systemName: "trash").imageScale(.small)}.buttonStyle(LightNumberButtonStyle())
                
                Button(action: {self.rechnungEingegeben += "/"}){Image(systemName: "divide").imageScale(.small)}.buttonStyle(OrangeNumberButtonStyle())
            }
            Spacer()
            HStack {
                Button(action: {self.rechnungEingegeben += "7"}){Text("7")}.buttonStyle(NumberButtonStyle())
                
                Button(action: {self.rechnungEingegeben += "8"}){Text("8")}.buttonStyle(NumberButtonStyle())
                
                Button(action: {self.rechnungEingegeben += "9"}){Text("9")}.buttonStyle(NumberButtonStyle())
                
                Button(action: {self.rechnungEingegeben += "*"}){Image(systemName: "multiply").imageScale(.small)}.buttonStyle(OrangeNumberButtonStyle())
            
            }
            Spacer()
            HStack {
                Button(action: {self.rechnungEingegeben += "4"}){Text("4")}.buttonStyle(NumberButtonStyle())
                
                Button(action: {self.rechnungEingegeben += "5"}){Text("5")}.buttonStyle(NumberButtonStyle())
                
                Button(action: {self.rechnungEingegeben += "6"}){Text("6")}.buttonStyle(NumberButtonStyle())
                
                Button(action: {self.rechnungEingegeben += "-"}){Image(systemName: "minus").imageScale(.small)}.buttonStyle(OrangeNumberButtonStyle())
            }
            Spacer()
            HStack {
                Button(action: {self.rechnungEingegeben += "1"}){Text("1")}.buttonStyle(NumberButtonStyle())
                
                Button(action: {self.rechnungEingegeben += "2"}){Text("2")}.buttonStyle(NumberButtonStyle())
                
                Button(action: {self.rechnungEingegeben += "3"}){Text("3")}.buttonStyle(NumberButtonStyle())
                
                Button(action: {self.rechnungEingegeben += "+"}){Image(systemName: "plus").imageScale(.small)}.buttonStyle(OrangeNumberButtonStyle())
            }
            Spacer()
            HStack {
                
                Button(action: {self.rechnungEingegeben += "0"}){Text("trig")}.buttonStyle(NumberButtonStyle())
                
                Button(action: {self.rechnungEingegeben += "0"}){Text("0")}.buttonStyle(NumberButtonStyle())
                
                Button(action: {self.rechnungEingegeben += ","}){Text(",")}.buttonStyle(NumberButtonStyle())
                
    
                
                Button(action: {self.rechnungEingegeben = ""}){Image(systemName: "equal").imageScale(.small)}.buttonStyle(OrangeNumberButtonStyle())
            }
        }.background(Color(.lightGray))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
