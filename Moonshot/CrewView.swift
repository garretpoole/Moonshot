//
//  CrewView.swift
//  Moonshot
//
//  Created by Garret Poole on 3/20/22.
//

import SwiftUI

struct CrewView: View {
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink{
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack{
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                                .accessibilityHidden(true)
                            
                            VStack(alignment: .leading){
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .accessibilityElement()
                    .accessibilityLabel(crewMember.astronaut.name)
                    .accessibilityHint(crewMember.role)
                    .accessibilityAddTraits(.isButton)
                }
            }
        }
    }
    
    init(crew: [CrewMember]){
        self.crew = crew
    }
}

struct CrewView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let mission = missions[1]
    static let crew = mission.crew.map { member -> CrewMember in
        if let astronaut = astronauts[member.name] {
            return CrewMember(role: member.role, astronaut: astronaut)
        } else {
            fatalError("Missing \(member.name)")
        }
    }
    
    static var previews: some View {
        CrewView(crew: crew)
            .preferredColorScheme(.dark)
    }
}
