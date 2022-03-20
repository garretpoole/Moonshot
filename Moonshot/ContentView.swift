//
//  ContentView.swift
//  Moonshot
//
//  Created by Garret Poole on 3/14/22.
//

import SwiftUI

struct ContentView: View {
    //extension to make this; generic decode to now load any json
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    //toggles views
    @State private var listToggle = true
    
    var body: some View {
        NavigationView{
            
            if listToggle{
                ListView(astronauts: astronauts, missions: missions)
                    .navigationTitle("Moonshot")
                    .background(.darkBackground)
                    .preferredColorScheme(.dark)
                    .toolbar {
                        Button{
                            listToggle.toggle()
                        } label: {
                            Text("Grid")
                                .font(.title3)
                                .foregroundColor(.secondary)
                        }
                    }

            } else{
                GridView(astronauts: astronauts, missions: missions)
                    .navigationTitle("Moonshot")
                    .background(.darkBackground)
                    .preferredColorScheme(.dark)
                    .toolbar {
                        Button{
                            listToggle.toggle()
                        } label: {
                            Text("List")
                                .font(.title3)
                                .foregroundColor(.secondary)
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
