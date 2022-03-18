//
//  ContentView.swift
//  Moonshot
//
//  Created by Garret Poole on 3/14/22.
//

import SwiftUI

struct ContentView: View {
    //made extension to make this
    let astronauts = Bundle.main.decode("astronauts.json")
    var body: some View {
        Text("\(astronauts.count)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
