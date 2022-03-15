//
//  ContentView.swift
//  Moonshot
//
//  Created by Garret Poole on 3/14/22.
//

import SwiftUI

struct CustomText: View{
    let text: String
    
    var body: some View{
        Text(text)
    }
    
    init(_ text: String){
        print("Creating new CustomText")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        //can use .horizontal in call with HStack
        ScrollView(.vertical){
            //.infinity to scroll entire screen
            //VStack all rows are created immediately, not as they come into view
            //Lazy loads them on demand but automatically take up all availbale free space in layout
            //Regular only take up the space needed for their children
            LazyVStack(spacing: 10){
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
