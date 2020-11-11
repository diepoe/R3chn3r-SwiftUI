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
            .background(Color(.white))
            .foregroundColor(Color(.darkGray))
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .padding()
            .frame(maxWidth: .infinity)
            
            
            
    }
}

struct ContentView: View {
    @State var rechnung: String=""
   
    
    var body: some View {
        VStack {
            Form {
                HStack {
                    TextField("Rechnung", text: $rechnung)
                    Button(action: {self.rechnung += "="}){Text("=")}
                }
            }
            HStack {
                Button(action: {self.rechnung += "7"}){Text("7")}.buttonStyle(NumberButtonStyle())
                
                Button(action: {self.rechnung += "8"}){Text("8")}.buttonStyle(NumberButtonStyle())
                
                Button(action: {self.rechnung += "9"}){Text("9")}.buttonStyle(NumberButtonStyle())
            
            }
            Spacer()
            HStack {
                Button(action: {self.rechnung += "4"}){Text("4")}.buttonStyle(NumberButtonStyle())
                
                Button(action: {self.rechnung += "5"}){Text("5")}.buttonStyle(NumberButtonStyle())
                
                Button(action: {self.rechnung += "6"}){Text("6")}.buttonStyle(NumberButtonStyle())
            }
            Spacer()
            HStack {
                Button(action: {self.rechnung += "1"}){Text("1")}.buttonStyle(NumberButtonStyle())
                
                Button(action: {self.rechnung += "2"}){Text("2")}.buttonStyle(NumberButtonStyle())
                
                Button(action: {self.rechnung += "3"}){Text("3")}.buttonStyle(NumberButtonStyle())
            }
            Spacer()
            HStack {
                Spacer()
                
                Button(action: {self.rechnung += "0"}){Text("0")}.buttonStyle(NumberButtonStyle())
                
                Spacer()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
