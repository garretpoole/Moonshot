//
//  ContentView.swift
//  Moonshot
//
//  Created by Garret Poole on 3/14/22.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView{
            //sheet is used for showing unrelated content
            //used for showing details about something based on user selection
            List(0..<100){ row in
                NavigationLink{
                    Text("Detail \(row)")
                } label: {
                Text("Row \(row)")
                    .padding()
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
