//
//  MissionView.swift
//  Moonshot
//
//  Created by Garret Poole on 3/19/22.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct MissionView: View {
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView{
                VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                        .accessibilityHidden(true)
                    
                    if mission.formattedLaunchDate != "N/A"{
                        Text(mission.formattedLaunchDate)
                            .font(.title2)
                            .foregroundColor(.secondary)
                    }
                    
                    VStack(alignment: .leading){
                        //Divider()
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        //Divider()
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)

                    }
                    .padding(.horizontal)
                    .accessibilityElement()
                    .accessibilityLabel(mission.displayName)
                    .accessibilityHint(mission.description)
                    
                    //works best edge to edge so outside of VStack
                    //else would have horizontal padding and would look off
                    HStack{
                        Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .accessibilityElement()
                    .accessibilityLabel("Crew")
                    
                    CrewView(crew: crew)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]){
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[1], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
