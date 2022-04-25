//
//  AstronautView.swift
//  Moonshot
//
//  Created by Garret Poole on 3/19/22.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var body: some View {
        ScrollView{
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .accessibilityHidden(true)
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .accessibilityElement()
        .accessibilityLabel(astronaut.name)
        .accessibilityHint(astronaut.description)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        //force unwrap, must be careful when doing so
        AstronautView(astronaut: astronauts["armstrong"]!)
    }
}
