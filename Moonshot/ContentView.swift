//
//  ContentView.swift
//  Moonshot
//
//  Created by Garret Poole on 3/14/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //fixed size images do not auto scale up on screen
        //scaledToFit will leave white space
        Image("Example")
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 300)
            
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
