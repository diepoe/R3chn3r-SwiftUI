//
//  ContentView.swift
//  R3chn3r
//
//  Created by Dietrich Poensgen on 10.11.20.
//

import SwiftUI

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
                Button(action: {self.rechnung += "7"}){Text("7")}
                Spacer()
                Button(action: {self.rechnung += "8"}){Text("8")}
                Spacer()
                Button(action: {self.rechnung += "9"}){Text("9")}
            
            }
            Spacer()
            HStack {
                Button(action: {self.rechnung += "4"}){Text("4")}
                Spacer()
                Button(action: {self.rechnung += "5"}){Text("5")}
                Spacer()
                Button(action: {self.rechnung += "6"}){Text("6")}
            }
            Spacer()
            HStack {
                Button(action: {self.rechnung += "1"}){Text("1")}
                Spacer()
                Button(action: {self.rechnung += "2"}){Text("2")}
                Spacer()
                Button(action: {self.rechnung += "3"}){Text("3")}
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
